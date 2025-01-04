```dart
import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiError extends Error {
  final String message;
  final int? statusCode;
  ApiError({required this.message, this.statusCode});
  @override
  String toString() => 'API Error: $message ${statusCode != null ? '(status code: $statusCode)' : ''}';
}

Future<Map<String, dynamic>> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://api.example.com/data'));
    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      return jsonResponse;
    } else {
      throw ApiError(message: 'Failed to load data', statusCode: response.statusCode);
    }
  } on ApiError catch (e) {
    print('API Error Caught: $e');
    rethrow; // Re-throw to allow handling further up the call stack
  } on SocketException catch (e) {
    print('Socket exception: $e');
    rethrow; 
  } catch (e) {
    print('Unexpected error: $e');
    rethrow;
  }
}

void main() async {
  try {
    final data = await fetchData();
    print('Data: $data');
  } catch (e) {
    print('Error in main: $e');
  }
}
```