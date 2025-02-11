import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;

class PostMethod {
  static Future<String?> addPost({required String title, required String description}) async{
   
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
         return null;
       } else if(response.statusCode == 500){
        log('Server Error: ${response.statusCode}');
          return 'Internal Server Error. Please try again later.';
       } else {
         log('Error Post: ${response.statusCode} ');
         return 'Submission failed. Please try again.';
       }
     } catch (e) {
       log('Post Error: $e');
       return 'An error occurred. Please check your connection.';
     } finally {
      client.close();
     }
  }
}
