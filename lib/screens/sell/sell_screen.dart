import 'package:flutter/material.dart';

class SellScreen extends StatefulWidget {
  static const String routeName = '/sell';

  const SellScreen({Key? key}) : super(key: key);

  @override
  _SellScreenState createState() => _SellScreenState();
}

class _SellScreenState extends State<SellScreen> {
  // Controller for the text field
  final TextEditingController _toyController = TextEditingController();

  // List to store added toys
  final List<String> _toys = [];

  // Function to add a new toy
  void _addToy() {
    if (_toyController.text.isNotEmpty) {
      setState(() {
        _toys.add(_toyController.text);
        _toyController.clear();
      });
    }
  }

  // Function to clear all toys
  void _clearToys() {
    setState(() {
      _toys.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add a Toy to Sell'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _toyController,
              decoration: const InputDecoration(
                labelText: 'Add a Toy',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context); // Cancel action
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey,
                  ),
                  child: const Text('Cancel'),
                ),
                ElevatedButton(
                  onPressed: _addToy,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                  ),
                  child: const Text('Post'),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: _toys.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(_toys[index]),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete, color: Colors.red),
                      onPressed: () {
                        setState(() {
                          _toys.removeAt(index);
                        });
                      },
                    ),
                  );
                },
              ),
            ),
            ElevatedButton(
              onPressed: _clearToys,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
              ),
              child: const Text('Clear All Toys'),
            ),
          ],
        ),
      ),
    );
  }
}
