import 'dart:convert';
import 'dart:io';
// import 'dart:io';
import 'package:flutter/material.dart';
import 'package:pruebantpack/Models/models.dart';
import 'package:http/http.dart' as http;

class UserService extends ChangeNotifier {
  String _baseUrl = 'jsonplaceholder.typicode.com';
  List<UsersModel> users = [];
  
  String _imagen = '';

  get imagen {
    return _imagen;
  }

  set imagen(img) {
    this._imagen = img;
    notifyListeners();
  }
  UserService(){
    this.obtenerUsuerios();
  }
  obtenerUsuerios() async {
    final url = Uri.https(_baseUrl, '/users');

    final response = await http.get(url);
    // final prueba = ;
    // print(prueba);
    // List<UsersModel> users = (json.decode(response.body) as List).map((data) => UsersModel.fromJson(data)).toList();
    // print(json.decode(response.body));
    // final list = json.decode(response.body).map((data) => UsersModel.fromJson(data)).toList();
    // print(users);
    final usersResponse = UsersModel.listFromMap(json.decode(response.body));
    // users = usersResponse;
    users = [...users, ...usersResponse];
    print(usersResponse);
    notifyListeners();
  }
  
}