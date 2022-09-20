import 'dart:convert';
import 'dart:math';
import 'package:http/http.dart' as http;

class FoodRecommend {
  String url = '';

  FoodRecommend(this.uri);

  Uri uri = Uri.parse('');

  Map<String, dynamic> result = {};
  List<dynamic> returnData = [];

  Future<List<dynamic>> getNews() async {
    print("호출!");
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      print("진행");
      result = jsonDecode(utf8.decode(response.bodyBytes));
      int dataLength = result.length;

      String RANK = (Random().nextInt(dataLength+1)).toString();


      returnData = jsonDecode(utf8.decode(response.bodyBytes))[RANK] ?? "";
      returnData[3] = returnData[3].toString();

      returnData[4] = double.parse(returnData[4]);
      print(returnData[4]);
      if (returnData[4] <= 20)
        returnData[4] = "GOOD";
      else if (returnData[4] <= 30)
        returnData[4] = "NORMAL";
      else
        returnData[4] = "BAD";

      print(returnData);
      print("s");
    }

    //return news;
    return returnData;
  }
}
