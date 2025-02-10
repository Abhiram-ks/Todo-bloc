import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

class PutMethod {
  static Future<bool> updateTodo({
    required String id,
    required String title,
    required String description,
    required bool isCompleted,
  }) async {
    Map<String, dynamic> body = {
       "title": title,
       "description": description,
       "is_completed": isCompleted, 
    };

    var client = http.Client();

    try {
      var response = await client.put(Uri.parse('https://api.nstack.in/v1/todos/$id'),
      headers: {
        'accept': 'application/json',
        'Content-Type': 'application/json',
      },
      body: jsonEncode(body),
      );
      if (response.statusCode >= 200 && response.statusCode < 300) {
        log('Success: updated todo with $id. Response: ${response.body}. StatusCode: ${response.statusCode}');
        return true;
        
      } else {
        log('Error: Failed to Update todo. Status Code: ${response.statusCode} $id');
        return false;
      }
    } catch (e) {
      log('Exception Update: $e');
      return false;
    } finally {
      client.close();
    }
  }
}