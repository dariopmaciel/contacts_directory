import 'dart:io';

import 'package:contacts_directory/helpers/contact_helper.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

class ContactPage extends StatefulWidget {
  Contact contact;

  ContactPage({super.key, required this.contact});

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  late Contact _editedContact;
  bool _userEdited = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.contact == null) {
      _editedContact = Contact();
    } else {
      _editedContact = Contact.fromMap(widget.contact.toMap());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text(_editedContact.name ?? "Novo Contato"),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.save),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            GestureDetector(
              child: Container(
                height: 140,
                width: 140,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: _editedContact.img != null
                        ? FileImage(File(_editedContact.img))
                        : FileImage(File("images/person.png")),
                  ),
                ),
              ),
            ),
            TextField(
              decoration: const InputDecoration(labelText: "Nome"),
              onChanged: (value) {
                _userEdited = true;
                setState(() {
                  _editedContact.name = value;
                });
              },
            ),
            TextField(
              decoration: const InputDecoration(labelText: "E-mail"),
              onChanged: (value) {
                _userEdited = true;
                _editedContact.email = value;
              },
              keyboardType: TextInputType.emailAddress,
            ),
            TextField(
              decoration: const InputDecoration(labelText: "Fone"),
              onChanged: (value) {
                _userEdited = true;
                _editedContact.phone = value;
              },
              keyboardType: TextInputType.number,
            ),
          ],
        ),
      ),
    );
  }
}
