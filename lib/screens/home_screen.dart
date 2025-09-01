import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[_RecipesCard(context), _RecipesCard(context)],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.orange,
        child: Icon(Icons.add, color: Colors.white),
        onPressed: () {
          _showBottom(context);
        },
      ),
    );
  }

  Future<void> _showBottom(BuildContext context) {
    return showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (contexto) => Container(
        width: MediaQuery.of(context).size.width,
        height: 600,
        color: Colors.white,
        child: RecipeForm(),
      ),
    );
  }

  Widget _RecipesCard(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 125,
        child: Card(
          child: Row(
            children: <Widget>[
              Container(
                height: 125,
                width: 100,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(
                    'https://www.simplyrecipes.com/thmb/X2B0QCVdGJWGO1gW6GR7cz1rhe0=/750x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/__opt__aboutcom__coeus__resources__content_migration__simply_recipes__uploads__2019__09__easy-pepperoni-pizza-lead-3-8f256746d649404baa36a44d271329bc.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(width: 26),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Pizza Peperoni',
                    style: TextStyle(fontSize: 16, fontFamily: 'Quicksand'),
                  ),
                  SizedBox(height: 4),
                  Container(height: 2, width: 75, color: Colors.orange),
                  Text(
                    'Juan M',
                    style: TextStyle(fontSize: 16, fontFamily: 'Quicksand'),
                  ),
                  SizedBox(height: 4),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RecipeForm extends StatelessWidget {
  const RecipeForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(12),
      child: Form(
        //key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Add New Recipe',
              style: TextStyle(color: Colors.orange, fontSize: 24),
            ),
            SizedBox(height: 16),
            _buildTextField(label: 'Recipe Name'),
            SizedBox(height: 16),
            _buildTextField(label: 'Author'),
            SizedBox(height: 16),
            _buildTextField(label: 'Image Url'),
            SizedBox(height: 16),
            _buildTextField(label: 'Recipe'),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField({required String label}) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(fontFamily: 'Quicksand', color: Colors.orange),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.orange, width: 1),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
