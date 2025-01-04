```dart
Future<void> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://api.example.com/data'));
    if (response.statusCode == 200) {
      // Process the JSON response here
      final jsonResponse = json.decode(response.body);
      // ... handle data ...
    } else {
      // Handle error response
      throw Exception('Failed to load data: ${response.statusCode}');
    }
  } catch (e) {
    // Handle exceptions during network request
    print('Error: $e');
    // Consider rethrowing the exception to be handled higher up in the call stack
    // rethrow;
  }
}
```