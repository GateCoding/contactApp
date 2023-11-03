import 'package:flutter/material.dart';

import 'contact_list.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ContactList(),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
