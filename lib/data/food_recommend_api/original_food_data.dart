import 'dart:convert';
import 'package:http/http.dart' as http;

class OrignialProvider{

  String url = '';
  OrignialProvider(this.uri);
  Uri uri = Uri.parse('');

  //List<dynamic> returnData = [];\
  List<dynamic> result = [];
  Future< List<dynamic>> getNews() async {

    print("호출!");
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      print("밀 진행");
      result = jsonDecode(utf8.decode(response.bodyBytes));


      print(result);
    }

    return result;
  }


}