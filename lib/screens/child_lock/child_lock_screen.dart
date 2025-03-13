import 'package:flutter/material.dart';

class ChildLockScreen extends StatefulWidget {
  static const String routeName = '/child-lock';

  const ChildLockScreen({Key? key}) : super(key: key);

  @override
  _ChildLockScreenState createState() => _ChildLockScreenState();
}

class _ChildLockScreenState extends State<ChildLockScreen> {
  bool _isChildLockEnabled = false;
  final Map<String, bool> _selectedToys = {
    'Building blocks': false,
    'Applabel puzzles': false,
    'Bicycles': false,
    'Jump ropes': false,
    'Water guns': false,
    'Remote control cars': false,
  };

  void _clearSelections() {
    setState(() {
      _selectedToys.forEach((key, value) {
        _selectedToys[key] = false;
      });
    });
  }

  void _saveSelections() {
    // Handle save action
    // You can add your logic here to save the selected toys
    print('Selected Toys: $_selectedToys');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Child Lock'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Child Lock',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                const Text(
                  'Child Lock',
                  style: TextStyle(fontSize: 18),
                ),
                const Spacer(),
                Switch(
                  value: _isChildLockEnabled,
                  onChanged: (bool value) {
                    setState(() {
                      _isChildLockEnabled = value;
                    });
                  },
                ),
              ],
            ),
            const SizedBox(height: 24),
            const Text(
              'Please select toys to hide from your child\'s feed',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView(
                children: _selectedToys.keys.map((String toyName) {
                  return _buildToyCheckbox(toyName);
                }).toList(),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: _clearSelections,
                    child: const Text('Clear'),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: ElevatedButton(
                    onPressed: _saveSelections,
                    child: const Text('Save'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildToyCheckbox(String toyName) {
    return CheckboxListTile(
      title: Text(toyName),
      value: _selectedToys[toyName],
      onChanged: (bool? value) {
        setState(() {
          _selectedToys[toyName] = value ?? false;
        });
      },
    );
  }
}
