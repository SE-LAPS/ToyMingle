import 'package:flutter/material.dart';

class SwapScreen extends StatefulWidget {
  static const String routeName = '/swap';

  @override
  _SwapScreenState createState() => _SwapScreenState();
}

class _SwapScreenState extends State<SwapScreen> {
  final _formKey = GlobalKey<FormState>();
  String _toyName = '';
  String _condition = '';
  String _category = '';
  String _description = '';
  List<String> _images = [];

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Process the data
      print('Toy Name: $_toyName');
      print('Condition: $_condition');
      print('Category: $_category');
      print('Description: $_description');
      print('Images: $_images');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add a Toy to Swap'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(labelText: 'Toy Name *'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the toy name';
                  }
                  return null;
                },
                onChanged: (value) {
                  setState(() {
                    _toyName = value;
                  });
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Condition *'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the condition';
                  }
                  return null;
                },
                onChanged: (value) {
                  setState(() {
                    _condition = value;
                  });
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Category *'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the category';
                  }
                  return null;
                },
                onChanged: (value) {
                  setState(() {
                    _category = value;
                  });
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Description'),
                maxLines: 3,
                onChanged: (value) {
                  setState(() {
                    _description = value;
                  });
                },
              ),
              SizedBox(height: 20),
              Text('Upload Images *'),
              ElevatedButton(
                onPressed: () {
                  // Implement image upload functionality
                },
                child: Text('Add Images'),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  ElevatedButton(
                    onPressed: () {
                      // Cancel action
                      Navigator.of(context).pop();
                    },
                    child: Text('Cancel'),
                  ),
                  ElevatedButton(
                    onPressed: _submitForm,
                    child: Text('Post'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
