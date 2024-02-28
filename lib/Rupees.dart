import 'package:flutter/material.dart';

class Rupees extends StatefulWidget {
  const Rupees({super.key});

  @override
  State<Rupees> createState() => _inventoryState();
}

class _inventoryState extends State<Rupees> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Rupees"),
        centerTitle: true,
      ),
    );
  }
}
