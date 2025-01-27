import 'package:flutter/material.dart';

class SellScreen extends StatelessWidget {
  static String routeName = "/sell";

  const SellScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sell Items"),
      ),
      body: const Center(
        child: Text("Sell Screen Content"),
      ),
    );
  }
}