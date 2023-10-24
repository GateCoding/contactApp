import 'package:contact/contact_box.dart';
import 'package:flutter/material.dart';

class ContactList extends StatefulWidget {
  const ContactList({super.key});

  @override
  State<ContactList> createState() => _ContactListState();
}

class _ContactListState extends State<ContactList> {
  List liste = [
    ["1 Contact", false],
    ["2 Contact", false],
    ["3 Contact", true],
    ["4 Contact", false],
    ["5 Contact", false]
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Mes Contacts")),
      body: ListView.builder(
          itemCount: liste.length,
          itemBuilder: (context, index) {
            return ContactBox(
              nomContact: liste[index][0],
              selContact: liste[index][1],
              onChanged: (value) => {},
            );
          }),
    );
  }
}
