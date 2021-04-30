import 'package:flutter/material.dart';
import 'package:flutter_fetch/models.dart';
import 'package:flutter_fetch/screens/overview_screen.dart';
import 'package:provider/provider.dart';
void main () {
   runApp(Home());
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => BookList(),
      child: MaterialApp(
        home: Views(),
      ),
    );
  }
}
