import 'dart:convert';
import 'package:http/http.dart' as http;

class ServingProvider{

  String url = '';
  ServingProvider(this.uri);
  Uri uri = Uri.parse('');

  //List<dynamic> returnData = [];\
  List<dynamic> result = [];
  Future<dynamic> getNews() async {

    print("호출!");
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      print("밀 진행");
      result = jsonDecode(utf8.decode(response.bodyBytes));


      // print(result[0]);
      // print(result[0]['KCAL']);
    }
    dynamic servingSize = [result[0]['SERVING_SIZE'],
      result[1]['SERVING_SIZE'],
      result[2]['SERVING_SIZE']
    ];
    print(servingSize.runtimeType);

    return servingSize;
  }


}