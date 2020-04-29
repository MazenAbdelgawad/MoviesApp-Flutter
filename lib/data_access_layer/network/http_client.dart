import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class HttpClient{

  Future<dynamic> getData(String url) async {
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);
      return jsonResponse;
    } else {
      print('Request failed with status: ${response.statusCode}.');
      return Exception();
    }
  }

}
