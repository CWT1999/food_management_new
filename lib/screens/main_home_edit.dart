import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_management/data/food_recommend_api/food_update.dart';
import 'package:pie_chart/pie_chart.dart';
import '../data/food_recommend_api/original_food_data.dart';
import '../data/food_recommend_api/serving_size.dart';
import 'main_food_menu.dart';
import 'package:food_management/data/food_recommend_api/meal_recommend.dart';
import 'package:food_management/data/food_recommend_api/food_recommend.dart';
import 'dart:math' as math;


class MainHomeEdit extends StatefulWidget {
  List<dynamic>? news = null;
  String? breakfast = '';
  String? lunch = '';
  String? dinner = '';
  SendData? sendData;
  dynamic? originalFood1 = '';
  dynamic? originalFood2 = '';
  dynamic? originalFood3 = '';

  MainHomeEdit(
      {Key? key,
        this.news,
        this.breakfast,
        this.lunch,
        this.dinner,
        this.originalFood1,
        this.originalFood2,
        this.originalFood3})
      : super(key: key) {
    sendData = SendData(news, breakfast, lunch, dinner, originalFood1,
        originalFood2, originalFood3);
  }

  @override
  State<MainHomeEdit> createState() => _MainHomeEditState();
}

class SendData {
  List<dynamic>? news;
  String? breakfast;
  String? lunch;
  String? dinner;
  dynamic? originalFood1;
  dynamic? originalFood2;
  dynamic? originalFood3;

  SendData(this.news, this.breakfast, this.lunch, this.dinner,
      this.originalFood1, this.originalFood2, this.originalFood3) {}
}

class _MainHomeEditState extends State<MainHomeEdit> {
  List<dynamic> news = [
    ["", "", "", '', ''],
    ["", "", "", '', ''],
    ["", "", "", '', '']
  ];
  String breakfast = '';
  String lunch = '';
  String dinner = '';
  dynamic? originalFood1 = '';
  dynamic? originalFood2 = '';
  dynamic? originalFood3 = '';
  List<dynamic> originalFood = [];

  //final List<String> newText = ['new', '...'];
  int idx = 0;

/*000*/
  Uri uri = Uri.parse('');
  Uri uri2 = Uri.parse('');
  Uri uri3 = Uri.parse('');
  Uri uri4 = Uri.parse('');
  Uri uri5 = Uri.parse('');
  Uri uri6 = Uri.parse('');
  Uri uri7 = Uri.parse('');
  Uri uri8 = Uri.parse('');
  Uri uri9 = Uri.parse('');

  initnewsAsynk() async {
    showDialog(
      // The user CANNOT close this dialog  by pressing outsite it
        barrierDismissible: false,
        useRootNavigator: false,
        context: context,
        builder: (_) {
          return Dialog(
            // The background color
            backgroundColor: Colors.white,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  // The loading indicator
                  CircularProgressIndicator(),
                  SizedBox(
                    height: 15,
                  ),
                  // Some text
                  Text('Loading...')
                ],
              ),
            ),
          );
        });
    if (isLoading == false) {
      isLoading = true;
      await initNews().then((_) {
        //API를 위해 220822 initState() 수정
        setState(() {
          isLoading = false;
        });
      });
    }
    Navigator.of(context).pop();
  }

  initnewsAsynk2() async {
    showDialog(
      // The user CANNOT close this dialog  by pressing outsite it
        barrierDismissible: false,
        useRootNavigator: false,
        context: context,
        builder: (_) {
          return Dialog(
            // The background color
            backgroundColor: Colors.white,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  // The loading indicator
                  CircularProgressIndicator(),
                  SizedBox(
                    height: 15,
                  ),
                  // Some text
                  Text('Loading...')
                ],
              ),
            ),
          );
        });
    await initNews2().then((_) {
      //API를 위해 220822 initState() 수정
      setState(() {
        isLoading2 = false;
      });
    });
    Navigator.of(context).pop();
  }

  initnewsAsynk3() async {
    showDialog(
      // The user CANNOT close this dialog  by pressing outsite it
        barrierDismissible: false,
        useRootNavigator: false,
        context: context,
        builder: (_) {
          return Dialog(
            // The background color
            backgroundColor: Colors.white,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  // The loading indicator
                  CircularProgressIndicator(),
                  SizedBox(
                    height: 15,
                  ),
                  // Some text
                  Text('Loading...')
                ],
              ),
            ),
          );
        });
    await initNews3().then((_) {
      //API를 위해 220822 initState() 수정
      setState(() {
        isLoading3 = false;
      });
    });
    Navigator.of(context).pop();
  }

  initnewsAsynk4() async {
    await initNews4().then((_) {
      //API를 위해 220822 initState() 수정
      setState(() {
        isLoading4 = false;
      });
    });
  }

/********************************************************************/
  initnewsAsynkALl1() async {
    showDialog(
      // The user CANNOT close this dialog  by pressing outsite it
        barrierDismissible: false,
        useRootNavigator: false,
        context: context,
        builder: (_) {
          return Dialog(
            // The background color
            backgroundColor: Colors.white,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  // The loading indicator
                  CircularProgressIndicator(),
                  SizedBox(
                    height: 15,
                  ),
                  // Some text
                  Text('Loading...')
                ],
              ),
            ),
          );
        });
    await initNewsAll1(); //.then((_) {
    //   //API를 위해 220822 initState() 수정
    //   setState(() {
    //   });
    // });
    Navigator.of(context).pop();

  }

  initnewsAsynkALl2() async {
    showDialog(
      // The user CANNOT close this dialog  by pressing outsite it
        barrierDismissible: false,
        useRootNavigator: false,
        context: context,
        builder: (_) {
          return Dialog(
            // The background color
            backgroundColor: Colors.white,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  // The loading indicator
                  CircularProgressIndicator(),
                  SizedBox(
                    height: 15,
                  ),
                  // Some text
                  Text('Loading...')
                ],
              ),
            ),
          );
        });
    await initNewsAll2(); //.then((_) {
    //   //API를 위해 220822 initState() 수정
    //   setState(() {
    //   });
    // });
    Navigator.of(context).pop();
  }

  initnewsAsynkALl3() async {
    showDialog(
      // The user CANNOT close this dialog  by pressing outsite it
        barrierDismissible: false,
        useRootNavigator: false,
        context: context,
        builder: (_) {
          return Dialog(
            // The background color
            backgroundColor: Colors.white,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  // The loading indicator
                  CircularProgressIndicator(),
                  SizedBox(
                    height: 15,
                  ),
                  // Some text
                  Text('Loading...')
                ],
              ),
            ),
          );
        });
    await initNewsAll3(); //.then((_) {
    //   //API를 위해 220822 initState() 수정
    //   setState(() {
    //   });
    // });
    Navigator.of(context).pop();
  }

  initOriginalAsynk() async {
    await initOriginal();
  }

/********************************************************************/
  void loadingText(int index) {
    switch (index) {
      case 1:
        news[0] = [
          'loading...',
          'loading...',
          'loading...',
          'loading...',
          'loading...'
        ];
        originalFood1 = ['', '', ''];
        break;
      case 2:
        news[1] = [
          'loading...',
          'loading...',
          'loading...',
          'loading...',
          'loading...'
        ];
        originalFood2 = ['', '', ''];
        break;
      case 3:
        news[2] = [
          'loading...',
          'loading...',
          'loading...',
          'loading...',
          'loading...'
        ];
        originalFood3 = ['', '', ''];
        break;
      case 123:
        news[0] = [
          'loading...',
          'loading...',
          'loading...',
          'loading...',
          'loading...'
        ];
        news[1] = [
          'loading...',
          'loading...',
          'loading...',
          'loading...',
          'loading...'
        ];
        news[2] = [
          'loading...',
          'loading...',
          'loading...',
          'loading...',
          'loading...'
        ];
        originalFood1 = ['', '', ''];
        originalFood2 = ['', '', ''];
        originalFood3 = ['', '', ''];
        break;
    }
  }

  void initState() {
    super.initState();


    this.news = widget.news!;
    this.breakfast = widget.breakfast!;
    this.lunch = widget.lunch!;
    this.dinner = widget.dinner!;
    this.originalFood1 = widget.originalFood1;
    this.originalFood2 = widget.originalFood2;
    this.originalFood3 = widget.originalFood3;

    uri8 = Uri.parse('http://222.107.249.189:9990/api/nutrient/' +
        breakfast +
        '/' +
        news[0][1] +
        '/' +
        news[0][2] +
        '/' +
        lunch +
        '/' +
        news[1][1] +
        '/' +
        news[1][2] +
        '/' +
        dinner +
        '/' +
        news[2][1] +
        '/' +
        news[2][2]);
    initOriginalAsynk();

    uri = Uri.parse('http://222.107.249.189:9990/api/' + news[0][0]);
    uri2 = Uri.parse('http://222.107.249.189:9990/api/' + news[1][0]);
    uri3 = Uri.parse('http://222.107.249.189:9990/api/' + news[2][0]);
    uri4 = Uri.parse('http://222.107.249.189:9990/api/updateOneDish');
    // initnewsAsynk4();
    isLoading = false;
    isLoading2 = false;
    isLoading3 = false;

  }

  late bool isLoading;
  late bool isLoading2;
  late bool isLoading3;
  late bool isLoading4;

  initOriginalAsynk0() async {
    await initOriginal0();
  }

  initOriginalAsynk1() async {
    await initOriginal1();
  }

  initOriginalAsynk2() async {
    await initOriginal2();
  }

  Future initOriginal0() async {
    ServingProvider orignialProvider1 = ServingProvider(uri9);
    dynamic a = await orignialProvider1.getNews();
    print(originalFood1);

    setState(() {
      originalFood1 = a;
    });
    //print(originalFood![0]['SERVING_SIZE']);
    //print(originalFood[0]['KCAL']);
  }

  Future initOriginal1() async {
    ServingProvider orignialProvider2 = ServingProvider(uri9);
    dynamic a = await orignialProvider2.getNews();
    print(originalFood2);

    setState(() {
      originalFood2 = a;
    });
    //print(originalFood![0]['SERVING_SIZE']);
    //print(originalFood[0]['KCAL']);
  }

  Future initOriginal2() async {
    ServingProvider orignialProvider3 = ServingProvider(uri9);
    dynamic a = await orignialProvider3.getNews();
    print(originalFood3);

    setState(() {
      originalFood3 = a;
    });
    //print(originalFood![0]['SERVING_SIZE']);
    //print(originalFood[0]['KCAL']);
  }

  Future initNews() async {
    uri = Uri.parse('http://222.107.249.189:9990/api/' + news[0][0]);
    FoodRecommend newsProvider = FoodRecommend(uri);
    news[0] = await newsProvider.getNews();
    if (news[0] == []) {
      Map<String, String> a = originalFood[0] as Map<String, String>;
      String u = "http://222.107.249.189:9990/save";
      for (String b in a.values){
        u = u+"/"+b;
      }
      print(u);
    }
    uri9 = Uri.parse('http://222.107.249.189:9990/api/nutrient/'+news[0][0]+'/'+news[0][1]+'/'+news[0][2]);
    initOriginalAsynk0();
  }

  Future initNews2() async {
    uri2 = Uri.parse('http://222.107.249.189:9990/api/' + news[1][0]);
    FoodRecommend newsProvider2 = FoodRecommend(uri2);

    news[1] = await newsProvider2.getNews();
    uri9 = Uri.parse('http://222.107.249.189:9990/api/nutrient/'+news[1][0]+'/'+news[1][1]+'/'+news[1][2]);
    initOriginalAsynk1();
  }

  Future initNews3() async {
    uri3 = Uri.parse('http://222.107.249.189:9990/api/' + news[2][0]);
    FoodRecommend newsProvider3 = FoodRecommend(uri3);

    news[2] = await newsProvider3.getNews();
    uri9 = Uri.parse('http://222.107.249.189:9990/api/nutrient/'+news[2][0]+'/'+news[2][1]+'/'+news[2][2]);
    initOriginalAsynk2();
  }

/********************************************************************/
  Future initNewsAll1() async {


    //한끼 한번에 받아오기
    breakfast = 'loading..';
    FoodRecommend newsProvider4 = FoodRecommend(uri4);
    List<dynamic> result = await newsProvider4.getNews();

    setState(() {
      news[0] = result;
      breakfast = news[0][0];
      uri9 = Uri.parse('http://222.107.249.189:9990/api/nutrient/' +
          breakfast +
          '/' +
          news[0][1] +
          '/' +
          news[0][2]);
      initOriginalAsynk0();
    });

    // breakfast = a[0];
    //
    // uri = Uri.parse('http://222.107.249.189:9990/api/' + breakfast);
    //initnewsAsynk();
  }

  Future initNewsAll2() async {
    // lunch = 'loading..';
    // MealProviders newsProvider4 = MealProviders(uri4);
    // List<dynamic> a  = await newsProvider4.getNews();
    // lunch = a[1];
    //
    // uri2 = Uri.parse('http://222.107.249.189:9990/api/' + lunch);
    // initnewsAsynk2();
    //한끼 한번에 받아오기
    lunch = 'loading..';
    FoodRecommend newsProvider4 = FoodRecommend(uri4);
    List<dynamic> result = await newsProvider4.getNews();

    setState(() {
      news[1] = result;
      lunch =  news[1][0];
      uri9 = Uri.parse('http://222.107.249.189:9990/api/nutrient/'+lunch+'/'+news[1][1]+'/'+news[1][2]);
      initOriginalAsynk1();
    });
  }

  Future initNewsAll3() async {
    //저녁 한번에 바꾸기
    dinner = 'loading..';
    FoodRecommend newsProvider4 = FoodRecommend(uri4);
    List<dynamic> result = await newsProvider4.getNews();
    setState(() {
      news[2] = result;
      dinner =  news[2][0] ;
      uri9 = Uri.parse('http://222.107.249.189:9990/api/nutrient/'+breakfast+'/'+news[2][1]+'/'+news[2][2]);
      initOriginalAsynk2();
    });
  }

  Future initOriginal() async {
    OrignialProvider orignialProvider = OrignialProvider(uri8);
    originalFood = await orignialProvider.getNews();
    double d = calcScore();
    print("@#@#!# $d");
    print(originalFood[0]['KCAL']);
  }

/********************************************************************/
  Future initNews4() async {
    MealProviders newsProvider4 = MealProviders(uri4);

    List<dynamic> a = await newsProvider4.getNews();
    breakfast = a[0];
    lunch = a[1];
    dinner = a[2];

    loadingText(123);
    initnewsAsynk();
    initnewsAsynk2();
    initnewsAsynk3();
  }

  List<int> whatIsChange = [0,0,0,0,0,0,0,0,0];
  var b1Kcal;
  dynamic changeBreakfast;

  Future<void> _navigateAndDisplaySelection(
      BuildContext context, String str) async {
    final result = await Navigator.push(
        context, MaterialPageRoute(builder: (context) => MainFoodMenu()));

    var foodName = '${result.dESCKOR}';
    var foodKcal = '${result.nUTRCONT1}';
    var foodServing = '${result.sERVINGSIZE}';

    setState(() {

      whatIsChange[0] = 1;

      if(str == "breakfast1") {
        breakfast = foodName;
        news[0][3] = double.parse(foodKcal) + originalFood[1]["KCAL"] + originalFood[2]["KCAL"];
        originalFood1[0] = foodServing;
        // double b1 = calcScore();
        // print('아침1 $b1');

      }
      else if(str == "breakfast2") {
        news[0][1] = foodName;
        news[0][3] = double.parse(foodKcal) + originalFood[1]["KCAL"] + originalFood[2]["KCAL"];
        originalFood1[1] = foodServing;
        // double b2 = calcScore();
        // print('아침2 $b2');
      }
      else if(str == "breakfast3") {
        news[0][2] = foodName;
        news[0][3] = double.parse(foodKcal) + originalFood[1]["KCAL"] + originalFood[2]["KCAL"];
        originalFood1[2] = foodServing;

        // double b3 = calcScore();
        // print('아침3 $b3');

      }

      else if(str == "lunch1") {
        lunch = foodName;
        news[0][3] = double.parse(foodKcal) + originalFood[1]["KCAL"] + originalFood[2]["KCAL"];
        originalFood1[0] = foodServing;

      }
      else if(str == "lunch2") {
        news[1][1] = foodName;
        news[0][3] = double.parse(foodKcal) + originalFood[1]["KCAL"] + originalFood[2]["KCAL"];
        originalFood1[1] = foodServing;

      }
      else if(str == "lunch3") {
        news[1][2] = foodName;
        news[0][3] = double.parse(foodKcal) + originalFood[1]["KCAL"] + originalFood[2]["KCAL"];
        originalFood1[2] = foodServing;

      }
      else if(str == "dinner1") {
        dinner = foodName;
        news[0][3] = double.parse(foodKcal) + originalFood[1]["KCAL"] + originalFood[2]["KCAL"];
        originalFood1[0] = foodServing;

      }
      else if(str == "dinner2"){
        news[2][1] = foodName;
        news[0][3] = double.parse(foodKcal) + originalFood[1]["KCAL"] + originalFood[2]["KCAL"];
        originalFood1[1] = foodServing;

      }
      else if(str == "dinner3") {
        news[2][2] = foodName;
        news[0][3] = double.parse(foodKcal) + originalFood[1]["KCAL"] + originalFood[2]["KCAL"];
        originalFood1[2] = foodServing;

      }

      double score = calcScore();
      String gnb;
      if (score <= 79) {
        gnb = "GOOD";
      } else if (score <= 120) {
        gnb = "NORMAL";
      } else
        gnb = "BAD";
      print('칼크스코어: $gnb');
      print('점수: $score');

      news[0][4] = gnb;


    });
  }

  double calcScore() {
    double carb_total = 0;
    double protein_total = 0;
    double fat_total = 0;
    double sugars_total = 0;
    double sodium_total = 0;
    double sfa_total = 0;
    double transFat_total = 0;
    double kcal_total = 0;
    List score_list = [];

    for (int i = 0; i < 3; i++) {
      kcal_total += double.parse((originalFood[i]["KCAL"]).toString());
      carb_total += double.parse((originalFood[i]["CARBOHYDRATE"]).toString());
      protein_total += double.parse((originalFood[i]["PROTEIN"]).toString());
      fat_total += double.parse((originalFood[i]["FAT"]).toString());
      sugars_total += double.parse((originalFood[i]["SUGARS"]).toString());
      sodium_total += double.parse((originalFood[i]["SODIUM"]).toString());
      sfa_total += double.parse((originalFood[i]["SATURATED_FATTY_ACIDS"]).toString());
      transFat_total += double.parse((originalFood[i]["TRANS_FAT"]).toString());
      print("KCAL : ${originalFood[i]["SODIUM"]}");
    }
    double sugars_score = (50 / 3 - sugars_total).abs();
    double sodium_score = (2000 / 3 - sodium_total).abs();
    double sfa_score = (51 / 3 - sfa_total).abs();
    double transFat_score;
    if (kcal_total / 100 >= transFat_total) {
      transFat_score = 0;
    } else {
      transFat_score = (kcal_total / 100 - transFat_total).abs();
    }

    double cpf_total = carb_total + protein_total + fat_total;
    double carb_ratio = carb_total / cpf_total * 10;
    double protein_ratio = protein_total / cpf_total * 10;
    double fat_ratio = fat_total / cpf_total * 10;
    double cpf_score = (5 - carb_ratio).abs() +
        (3 - protein_ratio).abs() +
        (2 - fat_ratio).abs();

    print("fgasdkgljs $sodium_score");
    List scoreList = [
      kcal_total,
      cpf_score,
      sugars_score,
      sodium_score,
      sfa_score,
      transFat_score
    ];

    score_list.addAll(scoreList);


    print('score_list: $score_list');
    print('score_list[1]: ${score_list[0]}');
    // 0, 7, 14가 음식이름

    // 영양소 비율
    double sugars_max = 68.633333333333326;
    double sodium_max = 8678.3333333333;
    double sfa_max = 44.07;
    double transFat_max = 0;
    double cpf_max = 8.530292141852834;

    score_list[1] = (score_list[1] / cpf_max) * 100;
    score_list[2] = (score_list[2] / sugars_max) * 100;
    score_list[3] = (score_list[3] / sodium_max) * 100;
    score_list[4] = (score_list[4] / sfa_max) * 100;
    if (transFat_max != 0) {
      score_list[5] = (score_list[5] / transFat_max) * 100;
    } else {
      score_list[5] = 0;
    }

    print("cpf_score ${score_list[1]}");
    print("sugars_score ${score_list[2]}");
    print("sodium_score ${score_list[3]}");
    print("sfa_score ${score_list[4]}");
    print("transFat_score ${score_list[5]}");

    print(score_list[5].runtimeType);

    return score_list[1] +
        score_list[2] +
        score_list[3] +
        score_list[4] +
        score_list[5];
  }




  @override
  Widget build(BuildContext context) {



    return Scaffold(
      backgroundColor: Color.fromRGBO(240, 240, 240, 1),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: false,
            backgroundColor: Colors.green,
            elevation: 0,
            centerTitle: true,
            title: Column(
              children: [
                Text(
                  "Autokit",
                  style: TextStyle(
                      fontFamily: 'Arial Black',
                      fontSize: 25,
                      color: Colors.black),
                )
              ],
            ),
          ),

          SliverToBoxAdapter(
              child: Column(children: [
                Column(
                  //mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                          alignment: Alignment(0.0, 0.0),

                          //Spacer(),
                          height: 80,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border(
                                top: BorderSide(
                                  color: Colors.grey,
                                ),
                                bottom: BorderSide(
                                  color: Colors.grey,
                                ),
                              )),
                          child: Text("My Menu",
                              style: TextStyle(
                                backgroundColor: Colors.white,
                                fontFamily: 'Arial Black',
                                fontSize: 25,
                                // fontWeight: FontWeight.bold,
                              )))
                    ]),
              ])),

          SliverToBoxAdapter(
              child: Column(children: [
                Column(
                  //mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                          alignment: Alignment(-0.9, 0.0),

                          //Spacer(),
                          height: 40,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border(
                                top: BorderSide(
                                  color: Colors.grey,
                                ),
                                bottom: BorderSide(
                                  color: Colors.grey,
                                ),
                              )),
                          child: Row(children: [
                            Container(
                              alignment: Alignment(-0.97, 0.0),
                              //width: 320,
                              width: MediaQuery.of(context).size.width * 0.90,
                              child: Text(
                                "아침",
                                style: TextStyle(
                                  backgroundColor: Colors.white,
                                  fontFamily: 'Arial Black',
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    width: 1,
                                    color: Colors.grey,
                                  ),
                                ),
                                child: InkWell(
                                  child: Icon(Icons.autorenew),
                                  onTap: () {
                                    setState(() {
                                      loadingText(1);
                                    });
                                    initnewsAsynkALl1();
                                  },
                                ))
                          ]))
                    ]),
                Container(
                    margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                    alignment: Alignment(-0.9, 0.0),

                    //Spacer(),
                    height: 40,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border(
                          top: BorderSide(
                            color: Colors.grey,
                          ),
                          // bottom: BorderSide(
                          //   color : Colors.grey,f
                          // ),
                        )),
                    child: Row(children: [
                      Container(
                          padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                          width: 360,
                          child: Text(
                            breakfast + "(${(originalFood1![0]) ?? 0}g)",
                            style: TextStyle(
                              backgroundColor: Colors.white,
                              fontFamily: 'RobotoSlab',
                              //fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          )),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 2,
                            color: Colors.grey,
                          ),
                        ),
                        child: InkWell(
                          child: Text(' + '),
                          onTap: () {
                            _navigateAndDisplaySelection(context, "breakfast1");
                            /*Navigator.of(context).push(MaterialPageRoute<void>(
                                fullscreenDialog: true,
                                builder: (BuildContext context) {
                                  return MainFoodMenu.setDayMeal(
                                      breakfast); //220823 홍석준 아침 전달
                                }));*/
                          },
                        ),
                      )
                    ])),
                Container(
                    margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                    alignment: Alignment(-0.9, 0.0),

                    //Spacer(),
                    height: 40,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border(
                          top: BorderSide(
                            color: Colors.grey,
                          ),
                          // bottom: BorderSide(
                          //   color : Colors.grey,
                          // ),
                        )),
                    child: Row(children: [
                      Container(
                        padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                        width: 360,
                        child: Text(
                          news[0][1] + "(${(originalFood1![1]) ?? 0}g)",
                          style: TextStyle(
                            backgroundColor: Colors.white,
                            fontFamily: 'RobotoSlab',
                            //fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 2,
                            color: Colors.grey,
                          ),
                        ),
                        child: InkWell(
                          child: Text(' + '),
                          onTap: () {
                            _navigateAndDisplaySelection(context, "breakfast2");
                            // Navigator.of(context).push(MaterialPageRoute<void>(
                            //     fullscreenDialog: true,
                            //     builder: (BuildContext context) {
                            //       return MainFoodMenu.setDayMeal(
                            //           news[0][1]); //220823 홍석준 아침 전달
                            //     }));
                          },
                        ),
                      )
                    ])),
                Container(
                    margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                    alignment: Alignment(-0.9, 0.0),

                    //Spacer(),
                    height: 40,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border(
                          top: BorderSide(
                            color: Colors.grey,
                          ),
                          // s
                        )),
                    child: Row(children: [
                      Container(
                        padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                        width: 360,
                        child: Text(
                          news[0][2] + "(${(originalFood1![2]) ?? 0}g)",
                          style: TextStyle(
                            backgroundColor: Colors.white,
                            fontFamily: 'RobotoSlab',
                            //fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 2,
                              color: Colors.grey,
                            ),
                          ),
                          child: InkWell(
                            child: Text(' + '),
                            onTap: () {
                              _navigateAndDisplaySelection(context, "breakfast3");
                              // Navigator.of(context).push(MaterialPageRoute<void>(
                              //     fullscreenDialog: true,
                              //     builder: (BuildContext context) {
                              //       return MainFoodMenu.setDayMeal(
                              //           news[0][2]); //220823 홍석준 아침 전달
                              //     }));
                            },
                          ))
                    ])),
                Container(
                    margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                    alignment: Alignment(-0.9, 0.0),

                    //Spacer(),
                    height: 60,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border(
                          top: BorderSide(
                            color: Colors.grey,
                          ),
                          bottom: BorderSide(
                            color: Colors.grey,
                          ),
                        )),
                    child: Row(children: [
                      Container(
                        padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                        width: 360,
                        child: Text(
                          '전체 칼로리 : ' +
                              news[0][3].toString() +
                              "\n영양소 : " +
                              news[0][4].toString(),
                          style: TextStyle(
                            backgroundColor: Colors.white,
                            fontFamily: 'RobotoSlab',
                            //fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                          decoration: BoxDecoration(
                            // border: Border.all(
                            //   width: 2,
                            //   color: Colors.grey,
                            // ),
                          ),
                          child: InkWell(
                            child: Icon(Icons.zoom_in),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => DetailScreen(
                                        name1: breakfast,
                                        name2: news[0][1],
                                        name3: news[0][2],
                                        servingsize1: originalFood[0]
                                        ["SERVING_SIZE"],
                                        servingsize2: originalFood[1]
                                        ["SERVING_SIZE"],
                                        servingsize3: originalFood[2]
                                        ["SERVING_SIZE"],
                                        carbohydrate1: originalFood[0]
                                        ["CARBOHYDRATE"],
                                        carbohydrate2: originalFood[1]
                                        ["CARBOHYDRATE"],
                                        carbohydrate3: originalFood[2]
                                        ["CARBOHYDRATE"],
                                        protein1: originalFood[0]["PROTEIN"],
                                        protein2: originalFood[1]["PROTEIN"],
                                        protein3: originalFood[2]["PROTEIN"],
                                        fat1: originalFood[0]["FAT"],
                                        fat2: originalFood[1]["FAT"],
                                        fat3: originalFood[2]["FAT"],
                                        sugars1: originalFood[0]["SUGARS"],
                                        sugars2: originalFood[1]["SUGARS"],
                                        sugars3: originalFood[2]["SUGARS"],
                                        sodium1: originalFood[0]["SODIUM"],
                                        sodium2: originalFood[1]["SODIUM"],
                                        sodium3: originalFood[2]["SODIUM"],
                                        cholesterol1: originalFood[0]
                                        ["CHOLESTEROL"],
                                        cholesterol2: originalFood[1]
                                        ["CHOLESTEROL"],
                                        cholesterol3: originalFood[2]
                                        ["CHOLESTEROL"],
                                        saturatedfatty1: originalFood[0]
                                        ["SATURATED_FATTY_ACIDS"],
                                        saturatedfatty2: originalFood[1]
                                        ["SATURATED_FATTY_ACIDS"],
                                        saturatedfatty3: originalFood[2]
                                        ["SATURATED_FATTY_ACIDS"],
                                        transfat1: originalFood[0]["TRANS_FAT"],
                                        transfat2: originalFood[1]["TRANS_FAT"],
                                        transfat3: originalFood[2]["TRANS_FAT"],
                                        kcal1: originalFood[0]["KCAL"],
                                        kcal2: originalFood[1]["KCAL"],
                                        kcal3: originalFood[2]["KCAL"],
                                      )));
                            },
                          )),
                    ])),
                Container(
                    margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                    child: ElevatedButton(
                      child: Text("'" + "$breakfast" + "' 새로운 조합 가져오기"),
                      onPressed: () {
                        setState(() {
                          initnewsAsynk();
                          loadingText(1);
                        });

                      },
                    ))
                // Container(
                //   child : ElevatedButton(
                //     child: Text("전송"),
                //     onPressed: () {
                //       print("print");
                //     },
                //   ),
                // )
              ])),

          SliverToBoxAdapter(
              child: Column(children: [
                Column(
                  //mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                          alignment: Alignment(-0.9, 0.0),

                          //Spacer(),
                          height: 40,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border(
                                top: BorderSide(
                                  color: Colors.grey,
                                ),
                                bottom: BorderSide(
                                  color: Colors.grey,
                                ),
                              )),
                          child: Row(children: [
                            Container(
                              alignment: Alignment(-0.97, 0.0),
                              width: MediaQuery.of(context).size.width * 0.90,
                              child: Text(
                                "점심",
                                style: TextStyle(
                                  backgroundColor: Colors.white,
                                  fontFamily: 'Arial Black',
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    width: 1,
                                    color: Colors.grey,
                                  ),
                                ),
                                child: InkWell(
                                  child: Icon(Icons.autorenew),
                                  onTap: () {
                                    setState(() {
                                      loadingText(2);
                                    });
                                    initnewsAsynkALl2();
                                  },
                                ))
                          ]))
                    ]),
                Container(
                    margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                    alignment: Alignment(-0.9, 0.0),

                    //Spacer(),
                    height: 40,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border(
                          top: BorderSide(
                            color: Colors.grey,
                          ),
                          // bottom: BorderSide(
                          //   color : Colors.grey,
                          // ),
                        )),
                    child: Row(children: [
                      Container(
                        padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                        width: 360,
                        child: Text(
                          lunch + "(${(originalFood2![0]) ?? 0}g)",
                          style: TextStyle(
                            backgroundColor: Colors.white,
                            fontFamily: 'RobotoSlab',
                            //fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 2,
                            color: Colors.grey,
                          ),
                        ),
                        child: InkWell(
                          child: Text(' + '),
                          onTap: () {
                            _navigateAndDisplaySelection(context, "lunch1");
                            /*Navigator.of(context).push(MaterialPageRoute<void>(
                                fullscreenDialog: true,
                                builder: (BuildContext context) {
                                  return MainFoodMenu.setDayMeal(
                                      lunch); //220823 홍석준 아침 전달
                                }));*/
                          },
                        ),
                      )
                    ])),
                Container(
                    margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                    alignment: Alignment(-0.9, 0.0),

                    //Spacer(),
                    height: 40,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border(
                          top: BorderSide(
                            color: Colors.grey,
                          ),
                          // bottom: BorderSide(
                          //   color : Colors.grey,
                          // ),
                        )),
                    child: Row(children: [
                      Container(
                        padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                        width: 360,
                        child: Text(
                          news[1][1] + "(${(originalFood2![1]) ?? 0}g)",
                          style: TextStyle(
                            backgroundColor: Colors.white,
                            fontFamily: 'RobotoSlab',
                            //fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 2,
                              color: Colors.grey,
                            ),
                          ),
                          child: InkWell(
                            child: Text(' + '),
                            onTap: () {
                              _navigateAndDisplaySelection(context, "lunch2");
                              // Navigator.of(context).push(MaterialPageRoute<void>(
                              //     fullscreenDialog: true,
                              //     builder: (BuildContext context) {
                              //       return MainFoodMenu.setDayMeal(
                              //           news[1][1]); //220823 홍석준 아침 전달
                              //     }));
                            },
                          ))
                    ])),
                Container(
                    margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                    alignment: Alignment(-0.9, 0.0),

                    //Spacer(),
                    height: 40,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border(
                          top: BorderSide(
                            color: Colors.grey,
                          ),
                          bottom: BorderSide(
                            color: Colors.grey,
                          ),
                        )),
                    child: Row(children: [
                      Container(
                        padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                        width: 360,
                        child: Text(
                          news[1][2] + "(${(originalFood2![2]) ?? 0}g)",
                          style: TextStyle(
                            backgroundColor: Colors.white,
                            fontFamily: 'RobotoSlab',
                            //fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 2,
                            color: Colors.grey,
                          ),
                        ),
                        child: InkWell(
                          child: Text(' + '),
                          onTap: () {
                            _navigateAndDisplaySelection(context, "lunch3");
                            // Navigator.of(context).push(MaterialPageRoute<void>(
                            //     fullscreenDialog: true,
                            //     builder: (BuildContext context) {
                            //       return MainFoodMenu.setDayMeal(
                            //           news[1][2]); //220823 홍석준 아침 전달
                            //     }));
                          },
                        ),
                      )
                    ])),
                Container(
                    margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                    alignment: Alignment(-0.9, 0.0),

                    //Spacer(),
                    height: 60,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border(
                          top: BorderSide(
                            color: Colors.grey,
                          ),
                          bottom: BorderSide(
                            color: Colors.grey,
                          ),
                        )),
                    child: Row(children: [
                      Container(
                        padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                        width: 360,
                        child: Text(
                          '전체 칼로리 : ' +
                              news[1][3].toString() +
                              "\n영양소 : " +
                              news[1][4].toString(),
                          style: TextStyle(
                            backgroundColor: Colors.white,
                            fontFamily: 'RobotoSlab',
                            //fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                          decoration: BoxDecoration(
                            // border: Border.all(
                            //   width: 2,
                            //   color: Colors.grey,
                            // ),
                          ),
                          child: InkWell(
                            child: Icon(Icons.zoom_in),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => DetailScreen(
                                        name1: lunch,
                                        name2: news[1][1],
                                        name3: news[1][2],
                                        kcal1: originalFood[3]["KCAL"],
                                        kcal2: originalFood[4]["KCAL"],
                                        kcal3: originalFood[5]["KCAL"],
                                        servingsize1: originalFood[3]
                                        ["SERVING_SIZE"],
                                        servingsize2: originalFood[4]
                                        ["SERVING_SIZE"],
                                        servingsize3: originalFood[5]
                                        ["SERVING_SIZE"],
                                        carbohydrate1: originalFood[3]
                                        ["CARBOHYDRATE"],
                                        carbohydrate2: originalFood[4]
                                        ["CARBOHYDRATE"],
                                        carbohydrate3: originalFood[5]
                                        ["CARBOHYDRATE"],
                                        protein1: originalFood[3]["PROTEIN"],
                                        protein2: originalFood[4]["PROTEIN"],
                                        protein3: originalFood[5]["PROTEIN"],
                                        fat1: originalFood[3]["FAT"],
                                        fat2: originalFood[4]["FAT"],
                                        fat3: originalFood[5]["FAT"],
                                        sugars1: originalFood[3]["SUGARS"],
                                        sugars2: originalFood[4]["SUGARS"],
                                        sugars3: originalFood[5]["SUGARS"],
                                        sodium1: originalFood[3]["SODIUM"],
                                        sodium2: originalFood[4]["SODIUM"],
                                        sodium3: originalFood[5]["SODIUM"],
                                        cholesterol1: originalFood[3]
                                        ["CHOLESTEROL"],
                                        cholesterol2: originalFood[4]
                                        ["CHOLESTEROL"],
                                        cholesterol3: originalFood[5]
                                        ["CHOLESTEROL"],
                                        saturatedfatty1: originalFood[3]
                                        ["SATURATED_FATTY_ACIDS"],
                                        saturatedfatty2: originalFood[4]
                                        ["SATURATED_FATTY_ACIDS"],
                                        saturatedfatty3: originalFood[5]
                                        ["SATURATED_FATTY_ACIDS"],
                                        transfat1: originalFood[3]["TRANS_FAT"],
                                        transfat2: originalFood[4]["TRANS_FAT"],
                                        transfat3: originalFood[5]["TRANS_FAT"],
                                      )));
                            },
                          ))
                    ])),
                Container(
                    margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                    child: ElevatedButton(
                      child: Text("'" + "$lunch" + "' 새로운 조합 가져오기"),
                      onPressed: () {
                        setState(() {
                          loadingText(2);
                        });
                        initnewsAsynk2();
                      },
                    )),
              ])),

          SliverToBoxAdapter(
              child: Column(children: [
                Column(
                  //mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                          alignment: Alignment(-0.9, 0.0),

                          //Spacer(),
                          height: 40,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border(
                                top: BorderSide(
                                  color: Colors.grey,
                                ),
                                bottom: BorderSide(
                                  color: Colors.grey,
                                ),
                              )),
                          child: Row(children: [
                            Container(
                              alignment: Alignment(-0.97, 0.0),
                              width: MediaQuery.of(context).size.width * 0.90,
                              child: Text(
                                "저녁",
                                style: TextStyle(
                                  backgroundColor: Colors.white,
                                  fontFamily: 'Arial Black',
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    width: 1,
                                    color: Colors.grey,
                                  ),
                                ),
                                child: InkWell(
                                  child: Icon(Icons.autorenew),
                                  onTap: () {
                                    setState(() {
                                      loadingText(3);
                                    });
                                    initnewsAsynkALl3();
                                  },
                                ))
                          ]))
                    ]),
                Container(
                    margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                    alignment: Alignment(-0.9, 0.0),

                    //Spacer(),
                    height: 40,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border(
                          top: BorderSide(
                            color: Colors.grey,
                          ),
                          // bottom: BorderSide(
                          //   color : Colors.grey,
                          // ),
                        )),
                    child: Row(children: [
                      Container(
                        padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                        width: 360,
                        child: Text(
                          dinner + "(${(originalFood3![0]) ?? 0}g)",
                          style: TextStyle(
                            backgroundColor: Colors.white,
                            fontFamily: 'RobotoSlab',
                            //fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 2,
                              color: Colors.grey,
                            ),
                          ),
                          child: InkWell(
                            child: Text(' + '),
                            onTap: () {
                              _navigateAndDisplaySelection(context, "dinner1");
                              /* Navigator.of(context).push(MaterialPageRoute<void>(
                                  fullscreenDialog: true,
                                  builder: (BuildContext context) {
                                    return MainFoodMenu.setDayMeal(
                                        dinner); //220823 홍석준 아침 전달
                                  }));*/
                            },
                          ))
                    ])),
                Container(
                    margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                    alignment: Alignment(-0.9, 0.0),

                    //Spacer(),
                    height: 40,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border(
                          top: BorderSide(
                            color: Colors.grey,
                          ),
                          // bottom: BorderSide(
                          //   color : Colors.grey,
                          // ),
                        )),
                    child: Row(children: [
                      Container(
                        padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                        width: 360,
                        //height: 30,
                        child: Text(
                          news[2][1] + "(${(originalFood3![1]) ?? 0}g)",
                          style: TextStyle(
                            backgroundColor: Colors.white,
                            fontFamily: 'RobotoSlab',
                            //fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                          alignment: Alignment(0.9, 0.0),
                          height: 20,
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 2,
                              color: Colors.grey,
                            ),
                          ),
                          child: InkWell(
                            child: Text(' + '),
                            onTap: () {
                              _navigateAndDisplaySelection(context, "dinner2");
                              // Navigator.of(context).push(MaterialPageRoute<void>(
                              //     fullscreenDialog: true,
                              //     builder: (BuildContext context) {
                              //       return MainFoodMenu.setDayMeal(
                              //           news[2][1]); //220823 홍석준 아침 전달
                              //     }));
                            },
                          ))
                    ])),
                Container(
                    margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                    alignment: Alignment(-0.9, 0.0),

                    //Spacer(),
                    height: 40,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border(
                          top: BorderSide(
                            color: Colors.grey,
                          ),
                          bottom: BorderSide(
                            color: Colors.grey,
                          ),
                        )),
                    child: Row(children: [
                      Container(
                        padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                        width: 360,
                        child: Text(
                          news[2][2] + "(${(originalFood3![2]) ?? 0}g)",
                          style: TextStyle(
                            backgroundColor: Colors.white,
                            fontFamily: 'RobotoSlab',
                            //fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 2,
                              color: Colors.grey,
                            ),
                          ),
                          child: InkWell(
                            child: Text(' + '),
                            onTap: () {
                              _navigateAndDisplaySelection(context, "dinner3");
                              // Navigator.of(context).push(MaterialPageRoute<void>(
                              //     fullscreenDialog: true,
                              //     builder: (BuildContext context) {
                              //       return MainFoodMenu.setDayMeal(
                              //           news[2][2]); //220823 홍석준 아침 전달
                              //     }));
                            },
                          ))
                    ])),
                Container(
                    margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                    alignment: Alignment(-0.9, 0.0),

                    //Spacer(),
                    height: 60,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border(
                          top: BorderSide(
                            color: Colors.grey,
                          ),
                          bottom: BorderSide(
                            color: Colors.grey,
                          ),
                        )),
                    child: Row(children: [
                      Container(
                        alignment: Alignment(-0.9, 0.0),
                        width: 360,
                        child: Text(
                          '전체 칼로리 : ' +
                              news[2][3].toString() +
                              "\n영양소 : " +
                              news[2][4].toString(),
                          style: TextStyle(
                            backgroundColor: Colors.white,
                            fontFamily: 'RobotoSlab',
                            //fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                          decoration: BoxDecoration(
                            // border: Border.all(
                            //   width: 2,
                            //   color: Colors.grey,
                            // ),
                          ),
                          child: InkWell(
                            child: Icon(Icons.zoom_in),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => DetailScreen(
                                        name1: dinner,
                                        name2: news[2][1],
                                        name3: news[2][2],
                                        kcal1: originalFood[6]["KCAL"],
                                        kcal2: originalFood[7]["KCAL"],
                                        kcal3: originalFood[8]["KCAL"],
                                        servingsize1: originalFood[6]
                                        ["SERVING_SIZE"],
                                        servingsize2: originalFood[7]
                                        ["SERVING_SIZE"],
                                        servingsize3: originalFood[8]
                                        ["SERVING_SIZE"],
                                        carbohydrate1: originalFood[6]
                                        ["CARBOHYDRATE"],
                                        carbohydrate2: originalFood[7]
                                        ["CARBOHYDRATE"],
                                        carbohydrate3: originalFood[8]
                                        ["CARBOHYDRATE"],
                                        protein1: originalFood[6]["PROTEIN"],
                                        protein2: originalFood[7]["PROTEIN"],
                                        protein3: originalFood[8]["PROTEIN"],
                                        fat1: originalFood[6]["FAT"],
                                        fat2: originalFood[7]["FAT"],
                                        fat3: originalFood[8]["FAT"],
                                        sugars1: originalFood[6]["SUGARS"],
                                        sugars2: originalFood[7]["SUGARS"],
                                        sugars3: originalFood[8]["SUGARS"],
                                        sodium1: originalFood[6]["SODIUM"],
                                        sodium2: originalFood[7]["SODIUM"],
                                        sodium3: originalFood[8]["SODIUM"],
                                        cholesterol1: originalFood[6]
                                        ["CHOLESTEROL"],
                                        cholesterol2: originalFood[7]
                                        ["CHOLESTEROL"],
                                        cholesterol3: originalFood[8]
                                        ["CHOLESTEROL"],
                                        saturatedfatty1: originalFood[6]
                                        ["SATURATED_FATTY_ACIDS"],
                                        saturatedfatty2: originalFood[7]
                                        ["SATURATED_FATTY_ACIDS"],
                                        saturatedfatty3: originalFood[8]
                                        ["SATURATED_FATTY_ACIDS"],
                                        transfat1: originalFood[6]["TRANS_FAT"],
                                        transfat2: originalFood[7]["TRANS_FAT"],
                                        transfat3: originalFood[8]["TRANS_FAT"],
                                      )));
                            },
                          ))
                    ])),
                Container(
                    margin: EdgeInsets.fromLTRB(0, 0, 0, 20),
                    child: ElevatedButton(
                      child: Text("'" + "$dinner" + "' 새로운 조합 가져오기"),
                      onPressed: () {
                        setState(() {
                          loadingText(3);
                        });
                        initnewsAsynk3();
                      },
                    )
                ),
                ElevatedButton(
                  child: Text("수정완료"),
                  onPressed: () {
                    // double score = calcScore();
                    // String gnb;
                    // if (score <= 79)
                    //   gnb = "GOOD";
                    // else if (score <= 120)
                    //   gnb = "NORMAL";
                    // else
                    //   gnb = "BAD";
                    // print('칼크스코어: '+gnb);
                    /********************************************************************/
                    Navigator.pop(
                        context, SendData(news, breakfast, lunch, dinner,originalFood1,originalFood2,originalFood3));
                    updateNewFoodAndProduct(originalFood);
                    //updateNewMeal(news);// 새로운 식단 업데이트
                    //updateDishAsync(newDishList)
                    print("음식과,식단 업데이트 그리고 product request");
                    //whatIsChange = [0,0,0,0,0,0,0,0,0];
                  }, /********************************************************************/
                )
              ])),

        ],
      ),
    );
  }

/********************************************************************/
  Future initNews5() async {
    print(uri5);
    UpdateProviders newsProvider5 = UpdateProviders(uri5);
    newsProvider5.getNews();
  }

  Future initNews6() async {
    UpdateProviders newsProvider6 = UpdateProviders(uri6);

    newsProvider6.getNews();
    print("식단저장!!");
  }

  updateNewFoodAndProductAsynk() async {
    await initNews5().then((_) {
      setState(() {});
    });
  }

  updateDishAsync() async {
    await initNews6().then((_) {
      setState(() {});
    });
  }

  void updateNewFoodAndProduct(List<dynamic> data) {
    //data = [CATEGORY,GROUP_NAME,DESC_KOR,SERVING_SIZE,KCAL,CARBOHYDRATE,PROTEIN,FAT,SUGARS,SODIUM,CHOLESTEROL,SATURATED_FATTY_ACIDS,TRANS_FAT]
    //       [CATEGORY,GROUP_NAME,DESC_KOR,SERVING_SIZE,KCAL,CARBOHYDRATE,PROTEIN,FAT,SUGARS,SODIUM,CHOLESTEROL,SATURATED_FATTY_ACIDS,TRANS_FAT]
    //       ...
    //       [CATEGORY,GROUP_NAME,DESC_KOR,SERVING_SIZE,KCAL,CARBOHYDRATE,PROTEIN,FAT,SUGARS,SODIUM,CHOLESTEROL,SATURATED_FATTY_ACIDS,TRANS_FAT]
    int n = data.length-1;
    print(whatIsChange);
    print("f");
    print(data.length);
    print("함수실행");
    for(int i = 0; i< 9; i++) {
      if (whatIsChange[i] == 1) { //변경된 적이 있을 경우
        print("uri 실행 ");
        print(n);
        String category ="side";
        if (n == 2 || n == 4 || n == 6) {
          category = "side";
        } else if (n == 1 || n == 3 || n == 5) {
          category = "main";
        } else
          category = "meal";
        print(category);
        uri5 = Uri.parse('http://222.107.249.189:9990/save' +
            '/$category' +
            '/${data[i]['GROUP_NAME']}' +
            '/${data[i]['DESC_KOR']}' +
            '/${data[i]['SERVING_SIZE']}' +
            '/${data[i]['KCAL']}' +
            '/${data[i]['CARBOHYDRATE']}' +
            '/${data[i]['PROTEIN']}' +
            '/${data[i]['FAT']}' +
            '/${data[i]['SUGARS']}' +
            '/${data[i]['SODIUM']}' +
            '/${data[i]['CHOLESTEROL']}' +
            '/${data[i]['SATURATED_FATTY_ACIDS']}' +
            '/${data[i]['TRANS_FAT']}');
        updateNewFoodAndProductAsynk();
        print("싱크실행");
      }else{
        print("0dla");
      }
    }
  }

  void updateNewMeal(List<dynamic> data) {
    // data = [meal, main, side, total_kcal,score]
    //        ...
    //        [meal, main, side, total_kcal,score]

    int n = data.length;
    for(int i=0; i<3; i++) {

      uri6 = Uri.parse('http://222.107.249.189:9990/api/updateMeal' +
          '/${data[i][0]}' +
          '/${data[i][1]}' +
          '/${data[i][2]}' +
          '/${data[i][3]}' +
          '/${calcScore()}');
      updateDishAsync();

    }
  }
/********************************************************************/
}

// Countn(int _daycount){
//
//     if(this._daycount>20){
//       Text("브론즈");
//     }
//   }

// class Count extends StatefulWidget {
//   const Count({Key? key}) : super(key: key);
//
//   @override
//   State<Count> createState() => _CountState();
// }

// class _CountState extends State<Count> {
//   int _daycount=0;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: ElevatedButton(
//           child: Text(
//             '식단 시작 일수: d-day + $_daycount',
//             style: TextStyle(
//               fontFamily: 'RobotoSlab', fontSize: 25,fontWeight: FontWeight.bold
//           ),),
//           onPressed: () {
//             setState(() { // setState() 추가.
//               _daycount++;
//             });
//           },
//         ),
//       ),
//     );
//   }
// }

enum LegendShape { circle, rectangle }

class DetailScreen extends StatelessWidget {
  DetailScreen({
    Key? key,
    required this.kcal1,
    required this.kcal2,
    required this.kcal3,
    required this.name1,
    required this.name2,
    required this.name3,
    required this.servingsize1,
    required this.servingsize2,
    required this.servingsize3,
    required this.carbohydrate1,
    required this.carbohydrate2,
    required this.carbohydrate3,
    required this.protein1,
    required this.protein2,
    required this.protein3,
    required this.fat1,
    required this.fat2,
    required this.fat3,
    required this.sugars1,
    required this.sugars2,
    required this.sugars3,
    required this.sodium1,
    required this.sodium2,
    required this.sodium3,
    required this.cholesterol1,
    required this.cholesterol2,
    required this.cholesterol3,
    required this.saturatedfatty1,
    required this.saturatedfatty2,
    required this.saturatedfatty3,
    required this.transfat1,
    required this.transfat2,
    required this.transfat3,
  }) : super(key: key);

  final kcal1, kcal2, kcal3;
  final name1, name2, name3;
  final servingsize1, servingsize2, servingsize3;
  final carbohydrate1, carbohydrate2, carbohydrate3;
  final protein1, protein2, protein3;
  final fat1, fat2, fat3;
  final sugars1, sugars2, sugars3;
  final sodium1, sodium2, sodium3;
  final cholesterol1, cholesterol2, cholesterol3;
  final saturatedfatty1, saturatedfatty2, saturatedfatty3;
  final transfat1, transfat2, transfat3;

  final dataMap = <String, double>{
    "탄수화물(g)": 0,
    "단백질(g)": 0,
    "지방(g)": 0,
    "당(g)": 0,
    "나트륨(g)": 0,
    // "콜레스테롤": 0,
    // "트랜스지방": 0
  };

  final colorList = <Color>[
    const Color(0xfffdcb6e),
    const Color(0xff0984e3),
    const Color(0xfffd79a8),
    const Color(0xffe17055),
    const Color(0xff6c5ce7),
  ];

  final gradientList = <List<Color>>[
    [
      const Color.fromRGBO(223, 250, 92, 1),
      const Color.fromRGBO(129, 250, 112, 1),
    ],
    [
      const Color.fromRGBO(129, 182, 205, 1),
      const Color.fromRGBO(91, 253, 199, 1),
    ],
    [
      const Color.fromRGBO(175, 63, 62, 1.0),
      const Color.fromRGBO(254, 154, 92, 1),
    ]
  ];


  ChartType? _chartType = ChartType.disc;
  double? _ringStrokeWidth = 32;
  double? _chartLegendSpacing = 32;

  bool _showLegendsInRow = false;
  bool _showLegends = true;

  bool _showChartValueBackground = true;
  bool _showChartValues = true;
  bool _showChartValuesInPercentage = false;
  bool _showChartValuesOutside = false;

  bool _showGradientColors = false;

  LegendShape? _legendShape = LegendShape.circle;
  LegendPosition? _legendPosition = LegendPosition.right;

  @override
  Widget build(BuildContext context) {

    dataMap["탄수화물(g)"] = carbohydrate1 + carbohydrate2 + carbohydrate3;
    dataMap["단백질(g)"] = protein1 + protein2 + protein3;
    dataMap["지방(g)"] = fat1 + fat2 + fat3;
    dataMap["당(g)"] = sugars1 + sugars2 + sugars3;
    dataMap["나트륨(g)"] = (sodium1 + sodium2 + sodium3) / 100;
    // dataMap["콜레스테롤"] = (cholesterol1 + cholesterol2 + cholesterol3) / 100;
    // dataMap["트랜스지방"] = transfat1 + transfat2 + transfat3;

    final chart = PieChart(
      key: ValueKey(0),
      dataMap: dataMap,
      animationDuration: const Duration(milliseconds: 1000),
      chartLegendSpacing: _chartLegendSpacing!,
      chartRadius: math.min(MediaQuery.of(context).size.width / 2, 300),
      colorList: colorList,
      initialAngleInDegree: 0,
      chartType: _chartType!,
      legendOptions: LegendOptions(
        showLegendsInRow: _showLegendsInRow,
        legendPosition: _legendPosition!,
        showLegends: _showLegends,
        legendShape: _legendShape == LegendShape.circle
            ? BoxShape.circle
            : BoxShape.rectangle,
        legendTextStyle: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      chartValuesOptions: ChartValuesOptions(
        showChartValueBackground: _showChartValueBackground,
        showChartValues: _showChartValues,
        showChartValuesInPercentage: _showChartValuesInPercentage,
        showChartValuesOutside: _showChartValuesOutside,
      ),
      ringStrokeWidth: _ringStrokeWidth!,
      emptyColor: Colors.grey,
      gradientList: _showGradientColors ? gradientList : null,
      emptyColorGradient: const [
        Color(0xff6c5ce7),
        Colors.blue,
      ],
      baseChartColor: Colors.transparent,
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        elevation: 0,
        title: Column(
          children: [
            Text(
              "식단 상세 정보       ",
              style: TextStyle(
                color: Colors.black,
                fontFamily: 'RobotoSlab',
                fontSize: 25,
              ),
            ),
            Align(
              alignment: Alignment.center,
            )
          ],
        ),
      ),
      body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: chart,
          // child: Text(
          //   "---------------------------------------------\n${name1}\n---------------------------------------------\n칼로리: ${kcal1}kcal\n탄수화물: ${carbohydrate1}g\n단백질: ${protein1}g\n지방: ${fat1}g\n당: ${sugars1}g\n나트륨: ${sodium1}mg\n콜레스테롤: ${cholesterol1}mg\n트랜스지방: ${transfat1}g\n"
          //       "---------------------------------------------\n${name2}\n---------------------------------------------\n칼로리: ${kcal2}kcal\n탄수화물: ${carbohydrate2}g\n단백질: ${protein2}g\n지방: ${fat2}g\n당: ${sugars2}g\n나트륨: ${sodium2}mg\n콜레스테롤: ${cholesterol2}mg\n트랜스지방: ${transfat2}g\n"
          //       "---------------------------------------------\n${name3}\n---------------------------------------------\n칼로리: ${kcal3}kcal\n탄수화물: ${carbohydrate3}g\n단백질: ${protein3}g\n지방: ${fat3}g\n당: ${sugars3}g\n나트륨: ${sodium3}mg\n콜레스테롤: ${cholesterol3}mg\n트랜스지방: ${transfat3}g\n",
          //   style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,),textAlign: TextAlign.center,
          // )
      ),
    );
  }
}

class IndicatorDot extends StatelessWidget {
  const IndicatorDot({Key? key, required this.isActive}) : super(key: key);
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 4,
      width: 8,
      decoration: BoxDecoration(
          color: isActive ? Colors.white70 : Colors.lightGreenAccent,
          borderRadius: BorderRadius.all(Radius.circular(12))),
    );
  }
}

