//responsavel por armazenar os dados no BD

import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'dart:async';

//nome das colunas
String contactTable = "contactTable";
String idColumns = "idColumn";
String nameColumn = "nameColumn";
String emailColumn = "emailColumn";
String phoneColumn = "phoneColumn";
String imgColumn = "imgColumn";

//criação de BD
class ContactHelper {
  //declaração da classe com a criação do obj '_instance', chamando o contrutor interno só podendo ser chamado de dentro da classe
  static final ContactHelper _instance = ContactHelper.internal();

  //para obter o 'ContactHelper" a instancia dele eu colocao ContactHelper._instance de qualquer local do codigo
  factory ContactHelper() => _instance;

  //construtor
  ContactHelper.internal();

  //declaração de banco de dados
  late Database _db;
  //inicializar o banco de dados
  Future<Database> get db async {
    if (_db != null) {
      return _db;
    } else {
      _db = await initDb();
      return _db;
    }
  }

//caminho para o banco de dados
  Future<Database> initDb() async {
    final databasesPath = await getDatabasesPath();
    final path = join(databasesPath, "contacts.db");
    //abrir bando de dados
    return await openDatabase(path, version: 1, onCreate: (db, version) async {
      await db.execute(
          'CREATE TABLE $contactTable($idColumns INTEGER PRIMARY KEY, $nameColumn TEXT, $emailColumn TEXT, $phoneColumn TEXT, $imgColumn TEXT)');
    });
  }

//C
  Future<Contact> saveContact(Contact contact) async {
    Database dbContact = await db;
    contact.id = await dbContact.insert(contactTable, contact.toMap());
    return contact;
  }

//R
  Future<Contact?> getContact(int id) async {
    Database dbContact = await db;
    List<Map> maps = await dbContact.query(contactTable,
        columns: [idColumns, nameColumn, emailColumn, phoneColumn, imgColumn],
        where: "$idColumns=?",
        whereArgs: [id]);
    if (maps.length > 0) {
      return Contact.fromMap(maps.first);
    } else {
      return null;
    }
  }

//U
  Future<int> updateContact(Contact contact) async {
    Database dbContact = await db;
    return await dbContact.update(contactTable, contact.toMap(),
        where: "$idColumns = ?", whereArgs: [contact.id]);
  }

//D
  Future<int> deleteContact(int id) async {
    Database dbContact = await db;
    return await dbContact
        .delete(contactTable, where: "$idColumns = ?", whereArgs: [id]);
  }

//Carregar todos os contatos
  Future<List> getAllContacts() async {
    Database dbContact = await db;
    //lista de mapas
    List listMap = await dbContact.rawQuery("SELECT * FROM $contactTable");
    //declaração de lista de contatos
    List<Contact> listContact = [];
    //para cada mapa da minha lista de mapa eu transformo ele em um contato e adiciono em uma lista de contatos
    for (Map m in listMap) {
      listContact.add(Contact.fromMap(m));
    }
    return listContact;
  }

  Future<int?> getNumber() async {
    Database dbContact = await db;
    return Sqflite.firstIntValue(
        await dbContact.rawQuery("SELECT COUNT(*)FROM $contactTable"));
  }
}

// id, name, email, phone, img
//  0, Dario, ddmaciel@gmail.com, 18981996400, /images/...
class Contact {
  late int id;
  late String name;
  late String email;
  late String phone;
  late String img;

  //Transforma os dados declarados em um Mapa
  Map toMap() {
    Map<String?, dynamic> map = {
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

  //contrutor //Recupera as informações/dados do Mapa
  Contact.fromMap(Map map) {
    id = map[idColumns];
    name = map[nameColumn];
    email = map[emailColumn];
    phone = map[phoneColumn];
    img = map[imgColumn];
  }

  //metodo para recuperar todas as informações de um contato
  @override
  String toString() {
    return "Contact(id: $id, name: $name, email: $email, phone: $phone, img: $img)";
  }
}
