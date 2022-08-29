import 'dart:convert';
import 'package:http/http.dart' as http;

class MealProviders{

  String url = '';
  MealProviders(this.uri);
  Uri uri = Uri.parse('');

  List<dynamic> returnData = [];
  Future<List<dynamic>> getNews() async {

    print("호출!");
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      print("밀 진행");
      Map<String,dynamic> result  = jsonDecode(utf8.decode(response.bodyBytes));
      returnData = result.values.toList();
    }

    return returnData;
  }


}