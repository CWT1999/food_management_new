import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:food_management/screens/main_home_edit.dart';
import '../data/food_recommend_api/original_food_data.dart';
import '../data/food_recommend_api/serving_size.dart';
import 'main_food_menu.dart';
import 'package:food_management/data/food_recommend_api/meal_recommend.dart';
import 'package:food_management/data/food_recommend_api/food_recommend.dart'
;import 'package:firebase_auth/firebase_auth.dart';

class MainHome extends StatefulWidget {
  MainHome({Key? key}) : super(key: key);

  final user = FirebaseAuth.instance.currentUser;

  @override
  State<MainHome> createState() => _MainHomeState();
}

class _MainHomeState extends State<MainHome> with AutomaticKeepAliveClientMixin<MainHome> {

  @override
  bool get wantKeepAlive => true;

  //220823 홍석준 아침,점심,저녁 전달을 위한 리스트화
  String breakfast = '영양돌솥밥';
  String lunch = '부대찌개';
  String dinner = '생선모듬초밥';
  dynamic originalFood1 = [0,0,0];
  dynamic originalFood2 = [0,0,0];
  dynamic originalFood3 = [0,0,0];
  initOriginalAsynk0() async{
    await initOriginal0();
  }
  initOriginalAsynk1() async{
    await initOriginal1();
  }
  initOriginalAsynk2() async{
    await initOriginal2();
  }


  Future initOriginal0() async{
    ServingProvider orignialProvider1 = ServingProvider(uri8);
    dynamic a = await orignialProvider1.getNews();
    print(originalFood1);

    setState(() {
      originalFood1 = a;
    });
    //print(originalFood![0]['SERVING_SIZE']);
    //print(originalFood[0]['KCAL']);
  }
  Future initOriginal1() async{
    ServingProvider orignialProvider2 = ServingProvider(uri8);
    dynamic a = await orignialProvider2.getNews();
    print(originalFood2);

    setState(() {
      originalFood2 = a;
    });
    //print(originalFood![0]['SERVING_SIZE']);
    //print(originalFood[0]['KCAL']);
  }
  Future initOriginal2() async{
    ServingProvider orignialProvider3 = ServingProvider(uri8);
    dynamic a = await orignialProvider3.getNews();
    print(originalFood3);

    setState(() {
      originalFood3 = a;
    });
    //print(originalFood![0]['SERVING_SIZE']);
    //print(originalFood[0]['KCAL']);
  }


  Uri uri8 = Uri.parse('');
  Future<void> _navigateAndDisplaySelection_breackfast(
      BuildContext context) async {
    final result = await Navigator.push(
        context, MaterialPageRoute(builder: (context) => MainFoodMenu()));

    var foodName = '${result.dESCKOR}';

    setState(() {
      breakfast = foodName;
    });
  }


  Future<void> _navigateAndDisplaySelection_lunch(BuildContext context) async {
    final result = await Navigator.push(
        context, MaterialPageRoute(builder: (context) => MainFoodMenu()));

    var foodName = '${result.dESCKOR}';

    setState(() {
      lunch = foodName;
    });
  }

  Future<void> _navigateAndDisplaySelection_dinner(BuildContext context) async {
    final result = await Navigator.push(
        context, MaterialPageRoute(builder: (context) => MainFoodMenu()));

    var foodName = '${result.dESCKOR}';

    setState(() {
      dinner = foodName;
    });
  }





  //final List<String> newText = ['new', '...'];
  int idx = 0;

/*000*/
  Uri uri = Uri.parse('');
  Uri uri2 = Uri.parse('');
  Uri uri3 = Uri.parse('');
  Uri uri4 = Uri.parse('');

  initnewsAsynk() async {
    if (isLoading == false) {
      isLoading = true;
      await initNews().then((_) {

        setState(() {
          isLoading = false;
        });
      });
    }
  }

  initnewsAsynk2() async {
    await initNews2().then((_) {

      setState(() {
        isLoading2 = false;
      });
    });
  }

  initnewsAsynk3() async {
    await initNews3().then((_) {

      setState(() {
        isLoading3 = false;
      });
    });
  }

  initnewsAsynk4() async {

    await initNews4().then((_) {

      setState(() {
        isLoading4 = false;

      });

    });

    //Navigator.of(context).pop();

  }

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
        break;
      case 2:
        news[1] = [
          'loading...',
          'loading...',
          'loading...',
          'loading...',
          'loading...'
        ];
        break;
      case 3:
        news[2] = [
          'loading...',
          'loading...',
          'loading...',
          'loading...',
          'loading...'
        ];
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
        break;
    }
  }

  _showDialog()  {
    //await Future.delayed(Duration(milliseconds: 1000));
    showDialog(
        context: context,
        builder: (BuildContext context) {

          Future.delayed(Duration(seconds: 15), () {
            Navigator.pop(context);
          });


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
  }
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async{
    //위젯을 바로실행시키기 위해 이 함수가 필요하다.
      await _showDialog();
    });
    super.initState();

    //uri4 = Uri.parse('http://222.107.249.189:9990/api/meal');
    initnewsAsynk4();

    isLoading = false;
    isLoading2 = false;
    isLoading3 = false;
  }


  List<dynamic> news = [["","","",'',''],["","","",'',''],["","","",'','']];

  late bool isLoading;
  late bool isLoading2;
  late bool isLoading3;
  late bool isLoading4;

  Future initNews() async {
    FoodRecommend newsProvider = FoodRecommend(uri);
    news[0] = await newsProvider.getNews();
  }

  Future initNews2() async {
    FoodRecommend newsProvider2 = FoodRecommend(uri2);

    news[1] = await newsProvider2.getNews();
  }

  Future initNews3() async {
    FoodRecommend newsProvider3 = FoodRecommend(uri3);

    news[2] = await newsProvider3.getNews();
  }

  Future initNewsAll1() async {
    //아침 한번에 받아오기
    breakfast = 'loading..';
    uri4 = Uri.parse('http://222.107.249.189:9990/api/updateOneDish');
    FoodRecommend newsProvider4 = FoodRecommend(uri4);
    List<dynamic> result = await newsProvider4.getNews();

    setState(() {
      news[0] = result;
      breakfast =  news[0][0];
      uri8 = Uri.parse('http://222.107.249.189:9990/api/nutrient/'+breakfast+'/'+news[0][1]+'/'+news[0][2]);
      initOriginalAsynk0();

    });

  }
  Future initNewsAll2() async {
    //점심 한번에 받아오기
    lunch = 'loading..';
    uri4 = Uri.parse('http://222.107.249.189:9990/api/updateOneDish');
    FoodRecommend newsProvider5 = FoodRecommend(uri4);
    List<dynamic> result2 = await newsProvider5.getNews();
    setState(() {
      news[1] = result2;
      lunch =  news[1][0];
      uri8 = Uri.parse('http://222.107.249.189:9990/api/nutrient/'+lunch+'/'+news[1][1]+'/'+news[1][2]);
      initOriginalAsynk1();
    });

  }
  Future initNewsAll3() async {
    //저녁 한번에 받아오기
    uri4 = Uri.parse('http://222.107.249.189:9990/api/updateOneDish');
    dinner = 'loading..';

    FoodRecommend newsProvider6 = FoodRecommend(uri4);
    List<dynamic> result3 = await newsProvider6.getNews();
    setState(() {
      news[2] = result3;
      dinner =  news[2][0];
      uri8 = Uri.parse('http://222.107.249.189:9990/api/nutrient/'+dinner+'/'+news[2][1]+'/'+news[2][2]);
      initOriginalAsynk2();
    });
  }
  Future initNews4() async {
    // MealProviders newsProvider4 = MealProviders(uri4);
    //
    // List<dynamic> a  = await newsProvider4.getNews();
    // breakfast = a[0];
    // lunch = a[1];
    // dinner = a[2];
    //
    // uri = Uri.parse('http://222.107.249.189:9990/api/' + a[0]);
    // uri2 = Uri.parse('http://222.107.249.189:9990/api/' + a[1]);
    // uri3 = Uri.parse('http://222.107.249.189:9990/api/' + a[2]);
    //
    // loadingText(123);
    // initnewsAsynk();
    // initnewsAsynk2();
    // initnewsAsynk3();
    loadingText(123);
    initNewsAll1();
    initNewsAll2();
    initNewsAll3();







  }

  void responseData(SendData sendData){
    this.news = sendData.news!;
    this.breakfast = sendData.breakfast!;
    this.lunch = sendData.lunch!;
    this.dinner = sendData.dinner!;
  }

  int _daycount = 0;

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
                      fontFamily: 'RobotoSlab',
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
                          margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                          //alignment: Alignment(-0.9, 0.0),

                          //Spacer(),
                          height: 60,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border(
                                top: BorderSide(
                                  color: Colors.grey,
                                ),
                                // bottom: BorderSide(
                                //   color: Colors.grey,
                                // ),
                              )),
                          child: Row(children: [
                            Container(
                              alignment: Alignment(-0.7,0),
                              width: 320,
                              child: Text(
                                "${widget.user?.email}님 \n 반갑습니다",
                                style: TextStyle(
                                  backgroundColor: Colors.white,
                                  fontFamily: 'RobotoSlab',
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ]))
                    ]),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                  alignment: Alignment(-0.0, 0.0),

                  //Spacer(),
                  height: 40,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border(
                        // top: BorderSide(
                        //   color: Colors.grey,
                        // ),
                        bottom: BorderSide(
                          color: Colors.grey,
                        ),
                      )),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 30,
                      ),
                      SizedBox(
                        width: 30,
                      ),
                    ],
                  ),),
              ])),

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
                          child: Text(
                              "MY menu",
                              style: TextStyle(
                                backgroundColor: Colors.white,
                                fontFamily: 'RobotoSlab',
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
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
                          alignment: Alignment(-0.0, 0.0),

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
                              width: MediaQuery.of(context).size.width*0.90,
                              child: Text(
                                "아침",
                                style: TextStyle(
                                  backgroundColor: Colors.white,
                                  fontFamily: 'RobotoSlab',
                                  //fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),

                          ]))
                    ]),
                Container(
                    margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                    alignment: Alignment(-0.0, 0.0),

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
                          //width: 100,
                          child: Text(
                            breakfast,
                            style: TextStyle(
                              backgroundColor: Colors.white,
                              fontFamily: 'RobotoSlab',
                              //fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                      ),
                    Container(
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                        //width: 100,
                        child: Text(
                          "(${(originalFood1[0])?? 0}g)",
                          style: TextStyle(
                            backgroundColor: Colors.white,
                            fontFamily: 'RobotoSlab',
                            //fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        )
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
                        //width: 360,
                        child: Text(
                          news[0][1],
                          style: TextStyle(
                            backgroundColor: Colors.white,
                            fontFamily: 'RobotoSlab',
                            //fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                          padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                          //width: 100,
                          child: Text(
                            "(${(originalFood1[1])?? 0}g)",
                            style: TextStyle(
                              backgroundColor: Colors.white,
                              fontFamily: 'RobotoSlab',
                              //fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          )
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
                        //alignment: Alignment(-0.9, 0.0),
                        padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                        //width: 360,
                        child: Text(
                          news[0][2],
                          style: TextStyle(
                            backgroundColor: Colors.white,
                            fontFamily: 'RobotoSlab',
                            //fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                          padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                          //width: 100,
                          child: Text(
                            "(${(originalFood1[2])?? 0}g)",
                            style: TextStyle(
                              backgroundColor: Colors.white,
                              fontFamily: 'RobotoSlab',
                              //fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                      )

                    ])),
                Container(
                    margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                    //alignment: Alignment(-0.9, 0.0),

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
                          '전체 칼로리 : '+news[0][3].toString()+"\n영양소 : "+news[0][4].toString(),
                          style: TextStyle(
                            backgroundColor: Colors.white,
                            fontFamily: 'RobotoSlab',
                            //fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ])),
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
                              width: MediaQuery.of(context).size.width*0.90,
                              child: Text(
                                "점심",
                                style: TextStyle(
                                  backgroundColor: Colors.white,
                                  fontFamily: 'RobotoSlab',
                                  //fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),

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
                        //width: 360,
                        child: Text(
                          lunch,
                          style: TextStyle(
                            backgroundColor: Colors.white,
                            fontFamily: 'RobotoSlab',
                            //fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                          padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                          //width: 100,
                          child: Text(
                            "(${(originalFood2[0])?? 0}g)",
                            style: TextStyle(
                              backgroundColor: Colors.white,
                              fontFamily: 'RobotoSlab',
                              //fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          )
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
                        //width: 360,
                        child: Text(
                          news[1][1],
                          style: TextStyle(
                            backgroundColor: Colors.white,
                            fontFamily: 'RobotoSlab',
                            //fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                          padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                          //width: 100,
                          child: Text(
                            "(${(originalFood2[1])?? 0}g)",
                            style: TextStyle(
                              backgroundColor: Colors.white,
                              fontFamily: 'RobotoSlab',
                              //fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          )
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
                          bottom: BorderSide(
                            color: Colors.grey,
                          ),
                        )),
                    child: Row(children: [
                      Container(
                        padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                        //width: 360,
                        child: Text(
                          news[1][2],
                          style: TextStyle(
                            backgroundColor: Colors.white,
                            fontFamily: 'RobotoSlab',
                            //fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                          padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                          //width: 100,
                          child: Text(
                            "(${(originalFood2[2])?? 0}g)",
                            style: TextStyle(
                              backgroundColor: Colors.white,
                              fontFamily: 'RobotoSlab',
                              //fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                      )
                    ])),
                Container(
                    margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
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
                          '전체 칼로리 : '+news[1][3].toString()+"\n영양소 : "+news[1][4].toString(),
                          style: TextStyle(
                            backgroundColor: Colors.white,
                            fontFamily: 'RobotoSlab',
                            //fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ])),
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
                              width: MediaQuery.of(context).size.width*0.90,
                              child: Text(
                                "저녁",
                                style: TextStyle(
                                  backgroundColor: Colors.white,
                                  fontFamily: 'RobotoSlab',
                                  //fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),

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
                        //width: 360,
                        child: Text(
                          dinner,
                          style: TextStyle(
                            backgroundColor: Colors.white,
                            fontFamily: 'RobotoSlab',
                            //fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                          padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                          //width: 100,
                          child: Text(
                            "(${(originalFood3[0])?? 0}g)",
                            style: TextStyle(
                              backgroundColor: Colors.white,
                              fontFamily: 'RobotoSlab',
                              //fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          )
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
                        //width: MediaQuery.of(context).size.width*0.92,
                        //height: 30,
                        child: Text(
                          news[2][1],
                          style: TextStyle(
                            backgroundColor: Colors.white,
                            fontFamily: 'RobotoSlab',
                            //fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                          padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                          //width: 100,
                          child: Text(
                            "(${(originalFood3[1])?? 0}g)",
                            style: TextStyle(
                              backgroundColor: Colors.white,
                              fontFamily: 'RobotoSlab',
                              //fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          )
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
                          bottom: BorderSide(
                            color: Colors.grey,
                          ),
                        )),
                    child: Row(children: [
                      Container(
                        padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                        //width: 360,
                        child: Text(
                          news[2][2],
                          style: TextStyle(
                            backgroundColor: Colors.white,
                            fontFamily: 'RobotoSlab',
                            //fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                          padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                          //width: 100,
                          child: Text(
                            "(${(originalFood3[2])?? 0}g)",
                            style: TextStyle(
                              backgroundColor: Colors.white,
                              fontFamily: 'RobotoSlab',
                              //fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                      )
                    ])),
                Container(
                    margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
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
                          '전체 칼로리 : '+news[2][3].toString()+"\n영양소 : "+news[2][4].toString(),
                          style: TextStyle(
                            backgroundColor: Colors.white,
                            fontFamily: 'RobotoSlab',
                            //fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),

                    ])),
                Container(
                  child : ElevatedButton(
                    child: Text("식단 수정"),
                    onPressed: () async{
                      final SendData returnData = await Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MainHomeEdit(news: news, breakfast: breakfast, lunch: lunch, dinner: dinner,originalFood1: originalFood1,originalFood2: originalFood2
                          ,originalFood3: originalFood3,)),
                      );
                      if( returnData != null ){
                        print("modified: $returnData");
                      }
                      setState(() {
                        responseData(returnData);
                      });
                    },

                  ),
                )
              ])),

          // SliverPadding(
          //   padding: EdgeInsets.symmetric(horizontal: 16.0),
          //   sliver: SliverToBoxAdapter(
          //     child: ImageCarousel(),
          //   ),
          // ),
        ],
      ),
    );
  }
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

// class ImageCarousel extends StatefulWidget {
//   const ImageCarousel({Key? key}) : super(key: key);
//
//   @override
//   State<ImageCarousel> createState() => _ImageCarouselState();
// }
//
// class _ImageCarouselState extends State<ImageCarousel> {
//   int _currentPage = 0;
//
//   @override
//   Widget build(BuildContext context) {
//     return AspectRatio(
//         aspectRatio: 1.335,
//         child: Stack(
//           //fit: StackFit.expand,
//             alignment: Alignment.bottomRight,
//             children: [
//               PageView.builder(
//                 itemCount: foodImages.length,
//                 onPageChanged: (value) {
//                   setState(() {
//                     _currentPage = value;
//                   });
//                 },
//                 itemBuilder: (context, index) => Image.asset(foodImages[index]),
//               ),
//               Positioned(
//                   bottom: 16.0,
//                   right: 16.0,
//                   child: Row(
//                       children: List.generate(
//                         foodImages.length,
//                             (index) => Padding(
//                           padding: const EdgeInsets.only(left: 16.0 / 4),
//                           child: IndicatorDot(isActive: index == _currentPage),
//                         ),
//                       ))),
//             ]));
//   }
//}
