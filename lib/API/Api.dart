import 'dart:convert';
import 'package:http/http.dart' as http;

class Api {
  static const String baseUrl = 'https://largesparklytree30.conveyor.cloud/api/user22';

  static Future<dynamic> fetchData() async {
    try {
      final response = await http.get(Uri.parse('$baseUrl'));
      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        return jsonData;
      } else {
        throw Exception('API Error: ${response.statusCode}');
      }
    } catch (error) {
      throw Exception('API Error: $error');
    }
  }
}
