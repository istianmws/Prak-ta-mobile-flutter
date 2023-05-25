import 'dart:convert';
import 'package:http/http.dart' as http;

class BaseNetwork {
  final String baseUrl = 'https://646f375609ff19b12086cbc0.mockapi.io/nvm/v1/tpmceria';

  Future<dynamic> get(String endpoint) async {
    final url = '$baseUrl$endpoint';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      return jsonResponse;
    } else {
      throw Exception('Failed to load data');
    }
  }
}
