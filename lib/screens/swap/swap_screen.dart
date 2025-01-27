import 'package:flutter/material.dart';

class SwapScreen extends StatelessWidget {
  static String routeName = "/swap";

  const SwapScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Swap Items"),
      ),
      body: const Center(
        child: Text("Swap Screen Content"),
      ),
    );
  }
}
