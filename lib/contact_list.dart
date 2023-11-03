import 'package:contact/add_contact.dart';
import 'package:contact/contact_box.dart';
import 'package:flutter/material.dart';

class ContactList extends StatefulWidget {
  const ContactList({super.key});

  @override
  State<ContactList> createState() => _ContactListState();
}

class _ContactListState extends State<ContactList> {
  List<int> selectedContacts = [];

  List liste = [
    ["1 Contact", false],
    ["2 Contact", false],
    ["3 Contact", true],
    ["4 Contact", false],
    ["5 Contact", false]
  ];
  void change(bool? value, int index) {
    setState(() {
      if (value == true) {
        selectedContacts.add(index);
      } else {
        selectedContacts.remove(index);
      }
      liste[index][1] = value;
    });
  }

  void deleteSelectedContacts() {
    setState(() {
      selectedContacts.sort(
          (a, b) => b.compareTo(a)); // Triez les indices en ordre décroissant
      for (var index in selectedContacts) {
        liste.removeAt(index);
      }
      selectedContacts.clear(); // Efface la liste des contacts sélectionnés
    });
  }

  final controller = TextEditingController();
  void saveConatact() {
    setState(() {
      liste.add([controller.text, false]);
      controller.clear();
      Navigator.of(context).pop();
    });
  }

  void addContact() {
    showDialog(
        context: context,
        builder: (context) {
          return AddContact(
              controller: controller,
              onAdd: saveConatact,
              onCancel: () => Navigator.of(context).pop());
        });
  }

  void delContact(index) {
    setState(() {
      liste.removeAt(index);
    });
  }

  Future<void> showDeleteConfirmationDialog() async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirmation de suppression'),
          content: const Text(
              'Êtes-vous sûr de vouloir supprimer les contacts sélectionnés ?'),
          actions: <Widget>[
            TextButton(
              child: const Text('Annuler'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Supprimer'),
              onPressed: () {
                deleteSelectedContacts(); // Appeler la fonction de suppression
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mes Contacts"),
        actions: [
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {
              if (selectedContacts.isNotEmpty) {
                showDeleteConfirmationDialog();
              }
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => addContact(),
        child: Icon(Icons.person),
      ),
      body: ListView.builder(
          itemCount: liste.length,
          itemBuilder: (context, index) {
            return ContactBox(
                nomContact: liste[index][0],
                selContact: liste[index][1],
                onChanged: (value) => change(value, index),
                delContact: (context) => delContact(index));
          }),
    );
  }
}
