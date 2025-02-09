import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;

class PostMethod {
  static Future<bool> addPost({required String title, required String description}) async{
   
     Map<String, dynamic> body = {
       "title": title,
       "description": description,
       "is_completed": false,
     };

     var client = http.Client();
     try {
       var response = await client.post(Uri.parse('https://api.nstack.in/v1/todos'),
        headers: {
          'accept': 'application/json',
          'Content-Type': 'application/json',
        },
        body: jsonEncode(body),
       );
       if (response.statusCode >= 200 && response.statusCode < 300) {
         log('Error Post: ${response.statusCode} - ${response.body}');
         log('Success response! Post ${response.statusCode}');
         return true;
       } else {
         log('Error Post: ${response.statusCode} ');
         return false;
       }
     } catch (e) {
       log('Post Error: $e');
       return false;
     } finally {
      client.close();
     }
  }
}
