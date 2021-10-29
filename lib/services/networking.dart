import 'dart:convert';

import 'package:http/http.dart' as http;

class NetworkHelper {
  final url;

  NetworkHelper({this.url});

  getDate() async {
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      //to get the info about my location weather
      String data = response.body;
      return jsonDecode(data);
    } else
      print('Error With API , The status code is ${response.statusCode}');
  }
}
