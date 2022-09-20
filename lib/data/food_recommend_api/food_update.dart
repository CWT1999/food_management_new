import 'dart:convert';
import 'package:http/http.dart' as http;

class UpdateProviders{
  UpdateProviders(this.uri);
  String url = '';
  Uri uri = Uri.parse('');

  List<dynamic> returnData = [];
  Future<List<dynamic>> getNews() async {

    print("업데이트 호출!");
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      print("업데이트 진행");
      // Map<String,dynamic> result  = jsonDecode(utf8.decode(response.bodyBytes));
      // print(result.values.toList());
    }

    return returnData;
  }


}