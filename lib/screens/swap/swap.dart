import 'package:flutter/material.dart';
import 'package:shop_app/screens/swap/swap_screen.dart';

class SwapScreen extends StatefulWidget {
  static const String routeName = '/swap';

  const SwapScreen({Key? key}) : super(key: key);

  @override
  _SwapScreenState createState() => _SwapScreenState();
}

class _SwapScreenState extends State<SwapScreen> {
  final List<Map<String, dynamic>> _swapItems = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Toy Swap'),
      ),
      body: _swapItems.isEmpty
          ? const Center(
              child: Text('No swap items available yet.'),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(16.0),
              itemCount: _swapItems.length,
              itemBuilder: (context, index) {
                final item = _swapItems[index];
                return SwapItemCard(
                  item: item,
                  onEdit: () => _editSwapItem(index),
                  onDelete: () => _deleteSwapItem(index),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final result = await Navigator.pushNamed(
            context,
            '/swap/post',
          );
          if (result != null && result is Map<String, dynamic>) {
            setState(() {
              _swapItems.add(result);
            });
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  void _editSwapItem(int index) async {
    final item = _swapItems[index];
    final result = await Navigator.pushNamed(
      context,
      '/swap/post',
      arguments: item,
    );
    if (result != null && result is Map<String, dynamic>) {
      setState(() {
        _swapItems[index] = result;
      });
    }
  }

  void _deleteSwapItem(int index) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete Swap Item'),
        content: const Text('Are you sure you want to delete this item?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              setState(() {
                _swapItems.removeAt(index);
              });
              Navigator.pop(context);
            },
            child: const Text('Delete'),
          ),
        ],
      ),
    );
  }
}

class SwapItemCard extends StatelessWidget {
  final Map<String, dynamic> item;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  const SwapItemCard({
    Key? key,
    required this.item,
    required this.onEdit,
    required this.onDelete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (item['imagePath'] != null)
            Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: FileImage(item['imagePath']),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        item['toyName'],
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.edit),
                          onPressed: onEdit,
                        ),
                        IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: onDelete,
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  'Condition: ${item['condition']}',
                  style: const TextStyle(fontSize: 14),
                ),
                Text(
                  'Category: ${item['category']}',
                  style: const TextStyle(fontSize: 14),
                ),
                const SizedBox(height: 8),
                Text(
                  'Age Range: ${item['ageRange']}',
                  style: const TextStyle(fontSize: 14),
                ),
                const SizedBox(height: 8),
                Text(
                  'Dimensions: ${item['height']} × ${item['width']} cm, ${item['weight']} kg',
                  style: const TextStyle(fontSize: 14),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Description:',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
                Text(
                  item['description'],
                  style: const TextStyle(fontSize: 14),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}