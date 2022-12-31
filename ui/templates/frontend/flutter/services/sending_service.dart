import 'package:http/http.dart' as http;

class SendingService {
  const SendingService();

  void send(String path, String json) {
    http.post(
      Uri.parse('http://localhost:8080$path'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: json,
    );
  }
}
