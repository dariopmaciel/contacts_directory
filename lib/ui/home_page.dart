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

  // @override
  // void initState() {
  //   super.initState();
  //   Contact c = Contact();
  //   c.name = "MArcos";
  //   c.email = "marcos@gmail.com";
  //   c.phone = "54654654";
  //   c.img = "imgTest";

  //   helper.saveContact(c);
  //   helper.getAllContacts().then((list) {
  //     print(list);
  //   });
  // }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(),
      drawer: Drawer(
        child: ListView(
          children: const [
            UserAccountsDrawerHeader(
              accountName: Text(
                "Dario Flutter Dev",
              ),
              accountEmail: Text(
                "dariodepaulamaciel@hotmail.com",
              ),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.greenAccent,
                child: Text(
                  "D",
                ),
              ),
            ),
            ListTile(
              title: Text(
                "Este novo projeto será criado como mais um experimento de aprendizado. \n\nCom o objetido de uma lista de contatos em CRUD, com a adição de: \n\n-Nome; \n-E-mail; \n-Telefone; \n-Adição de imagem por camera; \n-Compartilhamento em reder sociais. \n\nNovas funcionalidades estarão disponiveis em breve.",
                textAlign: TextAlign.justify,
                style: TextStyle(fontSize: 16),
              ),
            ),
            ListTile(
              title: Text(
                "\nObrigado por sua visualização.",
                style: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      // body: ListView.builder(
      //   itemCount: null,
      //   itemBuilder: (context, index) {},
      // ),
    );
  }
}
