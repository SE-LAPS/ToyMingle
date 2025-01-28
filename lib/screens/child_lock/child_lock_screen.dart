import 'package:flutter/material.dart';

class ChildLockScreen extends StatefulWidget {
  static const String routeName = '/child-lock';

  const ChildLockScreen({Key? key}) : super(key: key);

  @override
  _ChildLockScreenState createState() => _ChildLockScreenState();
}

class _ChildLockScreenState extends State<ChildLockScreen> {
  final List<String> toyList = [
    'Building blocks',
    'Alphabet puzzles',
    'Bicycles',
    'Jump ropes',
    'Water guns',
    'Remote control cars',
  ];

  List<bool> selectedItems = [];

  @override
  void initState() {
    super.initState();
    selectedItems = List<bool>.filled(toyList.length, false);
  }

  void clearSelection() {
    setState(() {
      selectedItems = List<bool>.filled(toyList.length, false);
    });
  }
  void saveSelection() {
    final selectedToys = toyList
        .asMap()
        .entries
        .where((entry) => selectedItems[entry.key])
        .map((entry) => entry.value)
        .toList();
    print('Saved Toys: $selectedToys');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Child Lock'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Child Lock',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                DropdownButton<String>(
                  value: 'Enabled',
                  items: const [
                    DropdownMenuItem(value: 'Enabled', child: Text('Enabled')),
                    DropdownMenuItem(value: 'Disabled', child: Text('Disabled')),
                  ],
                  onChanged: (value) {},
                ),
              ],
            ),
            const SizedBox(height: 16),
            const Text(
              'Please select toys to hide from your childs feed',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: toyList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(toyList[index]),
                    trailing: Checkbox(
                      value: selectedItems[index],
                      onChanged: (value) {
                        setState(() {
                          selectedItems[index] = value!;
                        });
                      },
                    ),
                  );
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    foregroundColor: Colors.white,
                  ),
                  onPressed: clearSelection,
                  child: const Text('Clear'),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    foregroundColor: Colors.white,
                  ),
                  onPressed: saveSelection,
                  child: const Text('Save'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
