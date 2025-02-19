import express from 'express';
import path from 'path';
import mariadb from 'mariadb';
import { fileURLToPath } from 'url';
import { dirname } from 'path';

const __filename = fileURLToPath(import.meta.url);
const __dirname = dirname(__filename);

const app = express();

const pool = mariadb.createPool({
  host: process.env.DB_HOST,
  user: process.env.DB_USERNAME,
  password: process.env.DB_PASSWORD,
  database: process.env.DB_NAME,
  connectionLimit: 5,
  acquireTimeout: 30000, // Increase the connection timeout to 30 seconds
  connectTimeout: 30000, // Increase the connection timeout to 30 seconds
  idleTimeout: 30000 // Increase the idle timeout to 30 seconds
});

app.use(express.static(path.join(__dirname, 'dist')));
app.use(express.json());

app.get('/api/items', async (req, res) => {
  let conn;
  try {
    conn = await pool.getConnection();
    const rows = await conn.query('SELECT * FROM items');
    res.json(rows);
  } catch (err) {
    console.error('Error fetching items:', err); // Add logging
    res.status(500).json({ error: err.message });
  } finally {
    if (conn) conn.release();
  }
});

app.post('/api/items', async (req, res) => {
  const { id, name, description, location, quantity } = req.body;
  let conn;
  try {
    conn = await pool.getConnection();
    await conn.query('INSERT INTO items (id, name, description, location, quantity) VALUES (?, ?, ?, ?, ?)', [id, name, description, location, quantity]);
    res.status(201).json({ message: 'Item added' });
  } catch (err) {
    console.error('Error adding item:', err); // Add logging
    res.status(500).json({ error: err.message });
  } finally {
    if (conn) conn.release();
  }
});

app.put('/api/items/:id', async (req, res) => {
  const { id } = req.params;
  const { name, description, quantity } = req.body;
  let conn;
  try {
    conn = await pool.getConnection();
    await conn.query('UPDATE items SET name = ?, description = ?, quantity = ? WHERE id = ?', [name, description, quantity, id]);
    res.json({ message: 'Item updated' });
  } catch (err) {
    console.error('Error updating item:', err); // Add logging
    res.status(500).json({ error: err.message });
  } finally {
    if (conn) conn.release();
  }
});

app.delete('/api/items/:id', async (req, res) => {
  const { id } = req.params;
  let conn;
  try {
    conn = await pool.getConnection();
    await conn.query('DELETE FROM items WHERE id = ?', [id]);
    res.json({ message: 'Item deleted' });
  } catch (err) {
    console.error('Error deleting item:', err); // Add logging
    res.status(500).json({ error: err.message });
  } finally {
    if (conn) conn.release();
  }
});

app.get('*', (req, res) => {
  res.sendFile(path.join(__dirname, 'dist', 'index.html'));
});

const PORT = process.env.PORT || 8080; // Change the default port to 8080
app.listen(PORT, () => {
  console.log(`Server is running on port ${PORT}`);
  console.log(`Database connection info:`);
  console.log(`  Host: ${process.env.DB_HOST}`);
  console.log(`  User: ${process.env.DB_USER}`);
  console.log(`  Database: ${process.env.DB_NAME}`);
});
