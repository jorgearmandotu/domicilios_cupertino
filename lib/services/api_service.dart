import 'package:http/http.dart' as http;
import '../models/menu.dart';
//import 'dart:convert';

class ApiService {
  String _url = 'https://www.desarrollodeapis.com/apirest/plato.php';

  Future <List<Menu>> getMenu() async {
    final response  = await http.get(_url);
    List<Menu> data = menuFromJson(response.body);
    print(data);
    return data;
  }

}