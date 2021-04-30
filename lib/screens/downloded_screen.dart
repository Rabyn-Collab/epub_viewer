import 'package:flutter/material.dart';
class ViewsLand extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 40),
        child: Column(
          children: [
            Card(
              child: ListTile(
                title: Text('About'),
                leading: Icon(Icons.history_toggle_off_outlined),
              ),
            ),
            Card(
              child: ListTile(
                title: Text('Settings'),
                leading: Icon(Icons.settings),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
