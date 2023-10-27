import 'package:flutter/material.dart';

class AddContact extends StatelessWidget {
  final controller;
  VoidCallback onAdd;
  VoidCallback onCancel;

  AddContact(
      {super.key,
      required this.controller,
      required this.onAdd,
      required this.onCancel});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
