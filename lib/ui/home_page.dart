import 'package:contacts_directory/helpers/contact_helper.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ContactHelper helper = ContactHelper();

  @override
  void initState() {
    super.initState();

    // Contact c = Contact();
    // c.name = "Dario";
    // c.email = "dario@dario";
    // c.phone = "18981996400";
    // c.img = "imgTest";

    //helper.saveContact(c);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: const Drawer(),
      body: Container(color: Colors.pink),
    );
  }
}
