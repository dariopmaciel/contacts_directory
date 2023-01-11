import 'package:contacts_directory/helpers/contact_helper.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  ContactHelper helper = ContactHelper();

  @override
  void initState() {
    // TODO: implement initState
    // super.initState();
    // Contact c = Contact();
    // c.name = "Dario";
    // c.email = "dario@dario";
    // c.phone = "54654654";
    // c.img = "imgTest";

    // helper.saveContact(c);
    helper.getAllContacts().then((list) {
      print(list);
    });
  }

  Widget build(BuildContext context) {
    return Scaffold();
  }
}
