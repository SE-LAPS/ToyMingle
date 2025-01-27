import 'package:flutter/material.dart';

class ChildLockScreen extends StatelessWidget {
  static String routeName = "/child-lock";

  const ChildLockScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Child Lock"),
      ),
      body: const Center(
        child: Text("Child Lock Screen Content"),
      ),
    );
  }
}