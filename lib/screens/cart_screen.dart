import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  final TextEditingController field1 = TextEditingController();
  final TextEditingController field2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Cart Page")),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(controller: field1, decoration: InputDecoration(labelText: 'Field 1')),
            TextField(controller: field2, decoration: InputDecoration(labelText: 'Field 2')),
            SizedBox(height: 20),
            ElevatedButton(onPressed: () {}, child: Text("Submit")),
          ],
        ),
      ),
    );
  }
}
