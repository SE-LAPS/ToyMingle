import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class PostSwapScreen extends StatefulWidget {
  static const String routeName = '/swap/post';

  const PostSwapScreen({Key? key}) : super(key: key);

  @override
  _PostSwapScreenState createState() => _PostSwapScreenState();
}

class _PostSwapScreenState extends State<PostSwapScreen> {
  final _formKey = GlobalKey<FormState>();
  final _toyNameController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _heightController = TextEditingController();
  final _widthController = TextEditingController();
  final _weightController = TextEditingController();
  final _ageRangeController = TextEditingController();

  String? _selectedCondition;
  String? _selectedCategory;
  Map<String, dynamic>? _editingItem;

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

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final arguments = ModalRoute.of(context)?.settings.arguments;
      if (arguments != null && arguments is Map<String, dynamic>) {
        _editingItem = arguments;
        _toyNameController.text = _editingItem!['toyName'];
        _descriptionController.text = _editingItem!['description'];
        _heightController.text = _editingItem!['height'] ?? '';
        _widthController.text = _editingItem!['width'] ?? '';
        _weightController.text = _editingItem!['weight'] ?? '';
        _ageRangeController.text = _editingItem!['ageRange'];
        _selectedCondition = _editingItem!['condition'];
        _selectedCategory = _editingItem!['category'];
        if (_editingItem!['imagePath'] != null) {
          _image = _editingItem!['imagePath'];
        }
      }
    });
  }

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
      final swapItem = {
        // Include ID if we're editing an existing item
        if (_editingItem != null && _editingItem!['id'] != null)
          'id': _editingItem!['id'],
        'toyName': _toyNameController.text,
        'condition': _selectedCondition,
        'category': _selectedCategory,
        'description': _descriptionController.text,
        'height': _heightController.text,
        'width': _widthController.text,
        'weight': _weightController.text,
        'ageRange': _ageRangeController.text,
        'imagePath': _image,
      };

      // Return the data to the previous screen
      Navigator.pop(context, swapItem);
    }
  }

  void _cancelForm() {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_editingItem == null ? 'Post Swap' : 'Edit Swap'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
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
                decoration: const InputDecoration(labelText: 'Toy Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a toy name';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              DropdownButtonFormField<String>(
                value: _selectedCondition,
                decoration: const InputDecoration(labelText: 'Condition'),
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
              const SizedBox(height: 20),
              DropdownButtonFormField<String>(
                value: _selectedCategory,
                decoration: const InputDecoration(labelText: 'Category'),
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
              const SizedBox(height: 20),
              TextFormField(
                controller: _descriptionController,
                decoration: const InputDecoration(labelText: 'Description'),
                maxLines: 3,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a description';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              const Text('Dimensions',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _heightController,
                      decoration: const InputDecoration(labelText: 'Height (cm)'),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: TextFormField(
                      controller: _widthController,
                      decoration: const InputDecoration(labelText: 'Width (cm)'),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: TextFormField(
                      controller: _weightController,
                      decoration: const InputDecoration(labelText: 'Weight (kg)'),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _ageRangeController,
                decoration:
                    const InputDecoration(labelText: 'Age Range (e.g., 3-5 years)'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter an age range';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              const Text('Upload Images',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              const SizedBox(height: 10),
              GestureDetector(
                onTap: _pickImage,
                child: Container(
                  height: 100,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: _image == null
                      ? const Center(
                          child: Icon(Icons.add_a_photo, size: 40),
                        )
                      : Image.file(_image!, fit: BoxFit.cover),
                ),
              ),
              const SizedBox(height: 20),
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
                      child: const Text('Cancel'),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: _submitForm,
                      child: Text(_editingItem == null ? 'Post Swap' : 'Update Swap'),
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