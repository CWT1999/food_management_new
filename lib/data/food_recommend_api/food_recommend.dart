import 'dart:convert';
import 'dart:math';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class FoodRecommend {
  String url = '';

  FoodRecommend(this.uri);

  Uri uri = Uri.parse('');

  Map<String, dynamic>? result = {};
  List<dynamic> returnData = [];

  Future<List<dynamic>?> getNews() async {
    print("호출!");
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      print("진행");
      try {
      if(response.bodyBytes.length <= 2){
        return null;
      }
        result = jsonDecode(utf8.decode(response.bodyBytes));

      }catch(e){
        return null;
      }
      int? dataLength = result?.keys.length;
      if(dataLength == null)
          return null;
       String RANK = (Random().nextInt(dataLength+1)).toString();


      returnData = jsonDecode(utf8.decode(response.bodyBytes))[RANK] ?? [];
      if(returnData == [])
        returnData = jsonDecode(utf8.decode(response.bodyBytes))[RANK] ?? [];
      if(returnData.length <   3)
        returnData = jsonDecode(utf8.decode(response.bodyBytes))[RANK] ?? [];

      try {
        returnData[3] = returnData[3].toString();
      }catch(e){
        returnData = jsonDecode(utf8.decode(response.bodyBytes))[RANK] ?? [];
        returnData[3] = returnData[3].toString();
      }

      returnData[4] = double.parse(returnData[4].toString());
      //print(returnData[4]);
      if (returnData[4] <= 79)
        returnData[4] = "GOOD";
      else if (returnData[4] <= 120)
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
