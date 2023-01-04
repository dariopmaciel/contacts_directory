import 'package:sqflite/sqflite.dart';
import 'dart:html';

//nome das colunas
String idColumns = "idColumn";
String nameColumn = "nameColumn";
String emailColumn = "emailColumn";
String phoneColumn = "phoneColumn";
String imgColumn = "imgColumn";

//criação de BD
class ContactHelper {




}

// id, name, email, phone, img
//  0, Dario, ddmaciel@gmail.com, 18981996400, foto
class Contact {
  late int id;
  late String name;
  late String email;
  late String phone;
  late String img;

  //contrutor
  Contact.fromMap(Map map) {
    id = map[idColumns];
    name = map[nameColumn];
    email = map[emailColumn];
    phone = map[phoneColumn];
    img = map[imgColumn];
  }

  Map toMap() {
    Map<String, dynamic> map = {
      nameColumn: name,
      emailColumn: email,
      phoneColumn: phone,
      imgColumn: img,
    };
    if (id != null) {
      map[idColumns] = id;
    }
    return map;
  }

  @override
  String toString() {
    return "Contact(id: $id, name: $name, email: $email, phone: $phone, img: $img)";
  }
}
