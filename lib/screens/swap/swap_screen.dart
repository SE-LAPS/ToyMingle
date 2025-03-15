import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:shop_app/screens/home/home_screen.dart';

class SwapScreen extends StatefulWidget {
  static const String routeName = '/swap';

  const SwapScreen({Key? key}) : super(key: key);

  @override
  _SwapScreenState createState() => _SwapScreenState();
}

class _SwapScreenState extends State<SwapScreen> {
  final _formKey = GlobalKey<FormState>();
  final _toyNameController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _heightController = TextEditingController();
  final _widthController = TextEditingController();
  final _weightController = TextEditingController();
  final _ageRangeController = TextEditingController();

  String? _selectedCondition;
  String? _selectedCategory;

  final List<String> _conditions = [
    'New',
    'Used - Like New',
    'Used - Good',
    'Used - Fair'
  ];
  final List<String> _categories = [
    'Action Figures',
    'Board Games',
    'Dolls',
    'Educational Toys'
  ];

  File? _image;

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  @override
  void dispose() {
    _toyNameController.dispose();
    _descriptionController.dispose();
    _heightController.dispose();
    _widthController.dispose();
    _weightController.dispose();
    _ageRangeController.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Process the data
      print('Toy Name: ${_toyNameController.text}');
      print('Condition: $_selectedCondition');
      print('Category: $_selectedCategory');
      print('Description: ${_descriptionController.text}');
      print('Height: ${_heightController.text}');
      print('Width: ${_widthController.text}');
      print('Weight: ${_weightController.text}');
      print('Age Range: ${_ageRangeController.text}');
      if (_image != null) {
        print('Image Path: ${_image!.path}');
      }

      // Navigate back to home screen or show a success message
      Navigator.pushNamed(context, HomeScreen.routeName);
    }
  }

  void _cancelForm() {
    // Clear the form and navigate back
    _toyNameController.clear();
    _descriptionController.clear();
    _heightController.clear();
    _widthController.clear();
    _weightController.clear();
    _ageRangeController.clear();
    setState(() {
      _selectedCondition = null;
      _selectedCategory = null;
      _image = null;
    });
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Post Swap'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: _toyNameController,
                decoration: InputDecoration(labelText: 'Toy Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a toy name';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              DropdownButtonFormField<String>(
                value: _selectedCondition,
                decoration: InputDecoration(labelText: 'Condition'),
                items: _conditions.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedCondition = newValue;
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please select a condition';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              DropdownButtonFormField<String>(
                value: _selectedCategory,
                decoration: InputDecoration(labelText: 'Category'),
                items: _categories.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedCategory = newValue;
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please select a category';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: _descriptionController,
                decoration: InputDecoration(labelText: 'Description'),
                maxLines: 3,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a description';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              Text('Dimensions',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _heightController,
                      decoration: InputDecoration(labelText: 'Height (cm)'),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: TextFormField(
                      controller: _widthController,
                      decoration: InputDecoration(labelText: 'Width (cm)'),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: TextFormField(
                      controller: _weightController,
                      decoration: InputDecoration(labelText: 'Weight (kg)'),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: _ageRangeController,
                decoration:
                    InputDecoration(labelText: 'Age Range (e.g., 3-5 years)'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter an age range';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              Text('Upload Images',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              GestureDetector(
                onTap: _pickImage,
                child: Container(
                  height: 100,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: _image == null
                      ? Center(
                          child: Icon(Icons.add_a_photo, size: 40),
                        )
                      : Image.file(_image!, fit: BoxFit.cover),
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: _cancelForm,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey[300],
                        foregroundColor: Colors.black,
                      ),
                      child: Text('Cancel'),
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: _submitForm,
                      child: Text('Post Swap'),
                    ),
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
