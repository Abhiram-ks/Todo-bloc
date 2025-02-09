import 'dart:convert';
import 'dart:developer';
import 'package:todo_app/presentation/model/todo_model.dart';

import 'package:http/http.dart' as http;


class GetMethod {
  
  static Future<List<TodoModel>> fetchTodos() async{
    var client = http.Client();
    List<TodoModel> todoList = [];
    
    try {
      final response = await client.get(Uri.parse('https://api.nstack.in/v1/todos'),
       headers: {'accept': 'application/json' }
      );
           log(response.body);
      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
          if (jsonData["items"] != null) {
          todoList = (jsonData["items"] as List)
              .map((json) => TodoModel.fromJson(json))
              .toList();
        }
        log(todoList.length.toString());
        return todoList;
      }else{
        log(response.statusCode.toString());
      }
    } catch (e) {
      log(e.toString());
      return [];
    } finally {
      client.close();
    }
    return [];
  }
}