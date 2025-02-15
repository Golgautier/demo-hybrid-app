from flask import Flask, render_template, redirect, url_for, request, flash
from flask_sqlalchemy import SQLAlchemy
from forms import RecipeForm
import os

app = Flask(__name__)

username = os.getenv('DB_USERNAME','')
password = os.getenv('DB_PASSWORD','')
port = os.getenv('DB_PORT', '3306')
database = os.getenv('DB_NAME', '')
host = os.getenv('DB_HOST', '')

# Update this with your MariaDB configuration
app.config['SQLALCHEMY_DATABASE_URI'] = 'mysql://'+username+':'+password+'@'+host+':'+port+'/'+database
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
app.config['SECRET_KEY'] = 'mysecret'
db = SQLAlchemy(app)

# Models
class Recipe(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    title = db.Column(db.String(100), nullable=False)
    description = db.Column(db.Text, nullable=False)
    ingredients = db.Column(db.Text, nullable=False)  # New field for ingredients
    image_url = db.Column(db.String(200), nullable=True)  # New field for image URL

def init_db():
    with app.app_context():
        db.create_all()

@app.route('/')
def index():
    recipes = Recipe.query.all()
    return render_template('recipe_list.html', recipes=recipes)

@app.route('/add', methods=['GET', 'POST'])
def add_recipe():
    form = RecipeForm()
    if form.validate_on_submit():
        new_recipe = Recipe(
            title=form.title.data,
            description=form.description.data,
            ingredients=form.ingredients.data,  # Capture ingredients
            image_url=form.image_url.data  # Capture image URL
        )
        db.session.add(new_recipe)
        db.session.commit()
        flash('Recipe added successfully!', 'success')
        return redirect(url_for('index'))
    return render_template('add_recipe.html', form=form)

@app.route('/delete/<int:id>', methods=['POST'])
def delete_recipe(id):
    recipe = Recipe.query.get_or_404(id)
    db.session.delete(recipe)
    db.session.commit()
    flash('Recipe deleted successfully!', 'success')
    return redirect(url_for('index'))

if __name__ == '__main__':
    init_db()  # Initialize the database
    app.run(debug=True)