import 'package:flutter/material.dart';

class inventory extends StatefulWidget {
  const inventory({super.key});

  @override
  State<inventory> createState() => _inventoryState();
}

class _inventoryState extends State<inventory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Inventory"),
        centerTitle: true,
      ),
    );
  }
}
