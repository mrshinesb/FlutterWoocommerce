import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Profile")),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Text("Name: User Name"),
            Text("Email: user@example.com"),
            SizedBox(height: 20),
            ElevatedButton(onPressed: () {}, child: Text("Edit Profile")),
          ],
        ),
      ),
    );
  }
}
