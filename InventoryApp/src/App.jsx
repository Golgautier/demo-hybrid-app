import React, { useState, useEffect } from 'react';
import axios from 'axios';

const App = () => {
  const [items, setItems] = useState([]);
  const [id, setId] = useState('');
  const [name, setName] = useState('');
  const [description, setDescription] = useState('');
  const [location, setLocation] = useState('');
  const [quantity, setQuantity] = useState('');
  const [editingItem, setEditingItem] = useState(null);
  const [editingName, setEditingName] = useState('');
  const [editingDescription, setEditingDescription] = useState('');
  const [editingQuantity, setEditingQuantity] = useState('');

  useEffect(() => {
    fetchItems();
  }, []);

  const fetchItems = async () => {
    try {
      const response = await axios.get('/api/items');
      setItems(response.data);
    } catch (error) {
      console.error('Error fetching items:', error);
    }
  };

  const addItem = async (e) => {
    e.preventDefault();
    const newItem = { id: parseInt(id, 10), name, description, location, quantity: parseInt(quantity, 10) };
    console.log('Adding item:', newItem); // Add this line
    try {
      await axios.post('/api/items', newItem);
      fetchItems();
      setId('');
      setName('');
      setDescription('');
      setLocation('');
      setQuantity('');
    } catch (error) {
      console.error('Error adding item:', error);
    }
  };

  const updateItem = async (id, newName, newDescription, newQuantity) => {
    try {
      await axios.put(`/api/items/${id}`, { name: newName, description: newDescription, quantity: newQuantity });
      fetchItems();
      setEditingItem(null);
    } catch (error) {
      console.error('Error updating item:', error);
    }
  };

  const updateQuantity = async (id, newQuantity) => {
    try {
      await axios.put(`/api/items/${id}`, { quantity: newQuantity });
      fetchItems();
    } catch (error) {
      console.error('Error updating quantity:', error);
    }
  };

  const deleteItem = async (id) => {
    try {
      await axios.delete(`/api/items/${id}`);
      fetchItems();
    } catch (error) {
      console.error('Error deleting item:', error);
    }
  };

  const totalQuantity = items.reduce((total, item) => total + item.quantity, 0);

  return (
    <div>
      <h1>Inventory App</h1>
      <div className="add-item-form">
        <form onSubmit={addItem}>
          <input
            type="number"
            placeholder="Item ID"
            value={id}
            onChange={(e) => setId(e.target.value)}
            required
          />
          <input
            type="text"
            placeholder="Item Name"
            value={name}
            onChange={(e) => setName(e.target.value)}
            required
          />
          <input
            type="text"
            placeholder="Description"
            value={description}
            onChange={(e) => setDescription(e.target.value)}
          />
          <input
            type="text"
            placeholder="Location"
            value={location}
            onChange={(e) => setLocation(e.target.value)}
          />
          <input
            type="number"
            placeholder="Quantity"
            value={quantity}
            onChange={(e) => setQuantity(e.target.value)}
            required
          />
          <button type="submit">Add Item</button>
        </form>
      </div>
      <table>
        <thead>
          <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Description</th>
            <th>Location</th>
            <th>Quantity</th>
            <th>Actions</th>
          </tr>
        </thead>
        <tbody>
          {items.map((item) => (
            <tr key={item.id}>
              <td>{item.id}</td>
              <td>
                {editingItem === item.id ? (
                  <input
                    type="text"
                    value={editingName}
                    onChange={(e) => setEditingName(e.target.value)}
                  />
                ) : (
                  item.name
                )}
              </td>
              <td>
                {editingItem === item.id ? (
                  <input
                    type="text"
                    value={editingDescription}
                    onChange={(e) => setEditingDescription(e.target.value)}
                  />
                ) : (
                  item.description
                )}
              </td>
              <td>{item.location}</td>
              <td>
                {editingItem === item.id ? (
                  <input
                    type="number"
                    value={editingQuantity}
                    onChange={(e) => setEditingQuantity(e.target.value)}
                  />
                ) : (
                  item.quantity
                )}
              </td>
              <td>
                {editingItem === item.id ? (
                  <button
                    className="modify-button"
                    onClick={() => updateItem(item.id, editingName, editingDescription, parseInt(editingQuantity, 10))}
                  >
                    Save
                  </button>
                ) : (
                  <>
                    <button
                      className="modify-button"
                      onClick={() => {
                        setEditingItem(item.id);
                        setEditingName(item.name);
                        setEditingDescription(item.description);
                        setEditingQuantity(item.quantity);
                      }}
                    >
                      Modify
                    </button>
                    <button className="delete-button" onClick={() => deleteItem(item.id)}>Delete</button>
                  </>
                )}
              </td>
            </tr>
          ))}
        </tbody>
        <tfoot>
          <tr>
            <td colSpan="4">Total</td>
            <td>{totalQuantity}</td>
            <td></td>
          </tr>
        </tfoot>
      </table>
    </div>
  );
};

export default App;
