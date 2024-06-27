import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiService {
  // Base URL for the API
  static const String _baseUrl =
      'https://o7q6ka26qs232rmbtpbrxghy6u0vyrup.lambda-url.ap-southeast-1.on.aws/';
  // Method to fetch a random string from the API
  Future<String> fetchRandomString() async {
    // Send GET request to the API
    final response = await http.get(Uri.parse(_baseUrl));
    if (response.statusCode == 200) {
      // If successful, decode the JSON response
      final jsonData = json.decode(response.body);
      if (jsonData.containsKey('randomString')) {
        // Return the random string if it exists in the response
        return jsonData['randomString'];
      } else {
        // Throw an exception if the randomString key is not found
        throw Exception('randomString not found in response');
      }
    } else {
      // Throw an exception if the request fails
      throw Exception('Failed to load data');
    }
  }
}
