import 'package:flutter/material.dart';

class Stock extends StatefulWidget {
  const Stock({super.key});

  @override
  State<Stock> createState() => _inventoryState();
}

class _inventoryState extends State<Stock> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Stock"),
        centerTitle: true,
      ),
    );
  }
}
