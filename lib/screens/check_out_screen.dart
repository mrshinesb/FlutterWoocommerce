import 'package:flutter/material.dart';

class CheckOutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Settings")),
      body: ListView(
        children: [
          ListTile(title: Text("Change Password")),
          ListTile(title: Text("Notification Settings")),
          ListTile(title: Text("Logout")),
        ],
      ),
    );
  }
}
