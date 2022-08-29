import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_management/data/food.dart';
import 'main_food_menu.dart';
import 'package:food_management/data/food_recommend_api/meal_recommend.dart';
import 'package:food_management/data/food_recommend_api/food_recommend.dart';
class MainHome extends StatefulWidget {
  const MainHome({Key? key}) : super(key: key);

  @override
  State<MainHome> createState() => _MainHomeState();
}

class _MainHomeState extends State<MainHome> {
  //220823 홍석준 아침,점심,저녁 전달을 위한 리스트화
  static String breakfast = '영양돌솥밥';
  static String lunch = '부대찌개';
  static String dinner = '생선모듬초밥';

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
        //API를 위해 220822 initState() 수정
        setState(() {
          isLoading = false;
        });
      });
    }
  }

  initnewsAsynk2() async {
    await initNews2().then((_) {
      //API를 위해 220822 initState() 수정
      setState(() {
        isLoading2 = false;
      });
    });
  }

  initnewsAsynk3() async {
    await initNews3().then((_) {
      //API를 위해 220822 initState() 수정
      setState(() {
        isLoading3 = false;
      });
    });
  }

  initnewsAsynk4() async {
    await initNews4().then((_) {
      //API를 위해 220822 initState() 수정
      setState(() {
        isLoading4 = false;
      });
    });
  }

  void loadingText(int index) {
    switch (index) {
      case 1:
        news[0] = ['loading...', 'loading...', 'loading...','loading...','loading...'];
        break;
      case 2:
        news[1] = ['loading...', 'loading...', 'loading...','loading...','loading...'];
        break;
      case 3:
        news[2] = ['loading...', 'loading...', 'loading...','loading...','loading...'];
        break;
      case 123:
        news[0] = ['loading...', 'loading...', 'loading...','loading...','loading...'];
        news[1] = ['loading...', 'loading...', 'loading...','loading...','loading...'];
        news[2] = ['loading...', 'loading...', 'loading...','loading...','loading...'];
        break;
    }
  }

  void initState() {
    super.initState();
    uri4 = Uri.parse('http://222.107.249.189:9990/api/meal');
    initnewsAsynk4();
    isLoading = false;
    isLoading2 = false;
    isLoading3 = false;


    // loadingText(123);
    // initnewsAsynk();
    // initnewsAsynk2();
    // initnewsAsynk3();

  }

  //dynamic news = List.generate(5, (index) => List.filled(4, "null", growable: false),growable: false);
  static List<dynamic> news = [["","","",'',''],["","","",'',''],["","","",'','']];
  // static List<dynamic> news3 = [''];
  //static List<dynamic> news2 = [''];

  late bool isLoading;
  late bool isLoading2;
  late bool isLoading3;
  late bool isLoading4;

  Future initNews() async {
    FoodRecommend newsProvider = FoodRecommend(uri);
    // NewsProviders newsProvider2 = NewsProviders(uri2);
    // NewsProviders newsProvider3 = NewsProviders(uri3);
    print("g");
    news[0] = await newsProvider.getNews();
    //saveBreakfast(news[0]);
    // news2 = await newsProvider2.getNews();
    // news3 = await newsProvider3.getNews();
    // main_foods_list = [
    //   FoodModel(
    //     news[0].title,
    //     15,
    //     150,
    //   ),
    //   FoodModel(
    //     news[1].title,
    //     30,
    //     300,
    //   ),
    //   FoodModel(
    //     news[2].title,
    //     50,
    //     500,
    //   ),
    // ];
  }



  Future initNews2() async {
    FoodRecommend newsProvider2 = FoodRecommend(uri2);

    news[1] = await newsProvider2.getNews();
  }

  Future initNews3() async {
    FoodRecommend newsProvider3 = FoodRecommend(uri3);

    news[2] = await newsProvider3.getNews();
  }

  Future initNews4() async {
    MealProviders newsProvider4 = MealProviders(uri4);

    List<dynamic> a  = await newsProvider4.getNews();
    breakfast = a[0];
    lunch = a[1];
    dinner = a[2];

    uri = Uri.parse('http://222.107.249.189:9990/api/' + breakfast);
    uri2 = Uri.parse('http://222.107.249.189:9990/api/' + lunch);
    uri3 = Uri.parse('http://222.107.249.189:9990/api/' + dinner);

    loadingText(123);
    initnewsAsynk();
    initnewsAsynk2();
    initnewsAsynk3();

  }
/*000*/

  // @override
  // void initState() {
  //   super.initState();
  // }

  int _daycount = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(0, 0, 0, 0.05),
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
          // SliverPadding(
          //   padding: EdgeInsets.all(16.0),
          //   sliver: SliverToBoxAdapter(
          //     child: Row(
          //       children: <Widget>[
          //         Text(
          //           "***님 반갑습니다",
          //           style: TextStyle(
          //             backgroundColor: Colors.white,
          //             fontFamily: 'RobotoSlab',
          //             fontSize: 25,
          //             fontWeight: FontWeight.bold,
          //           ),
          //         ),
          //       ],
          //     ),
          //   ),
          // ),
          // SliverToBoxAdapter(
          //   child: Column(
          //     children: [
          //       Row(
          //         children: [
          //           SizedBox(
          //             width: 30,
          //           ),
          //           Text('D-day+$_daycount'),
          //           ElevatedButton(
          //               onPressed: () {
          //                 setState(() {
          //                   // setState() 추가.
          //                   _daycount++;
          //                 });
          //               },
          //               style: ElevatedButton.styleFrom(
          //                   shape: RoundedRectangleBorder(
          //                       borderRadius: BorderRadius.circular(5)),
          //                   minimumSize: Size(20, 20)),
          //               child: Icon(Icons.add)),
          //           ElevatedButton(
          //               onPressed: () {
          //                 setState(() {
          //                   if (_daycount != 0) {
          //                     // setState() 추가.
          //                     _daycount--;
          //                   }
          //                 });
          //               },
          //               style: ElevatedButton.styleFrom(
          //                   shape: RoundedRectangleBorder(
          //                       borderRadius: BorderRadius.circular(5)),
          //                   minimumSize: Size(20, 20)),
          //               child: Icon(Icons.remove)),
          //           SizedBox(
          //             width: 30,
          //           ),
          //         ],
          //       ),
          //     ],
          //   ),
          // ),
          // SliverPadding(
          //   padding: EdgeInsets.all(16.0),
          //   sliver: SliverToBoxAdapter(
          //     child: Row(
          //       children: [
          //         Text("My Menu",
          //           style: TextStyle(
          //               fontFamily: 'RobotoSlab',
          //               fontSize: 25,
          //               fontWeight: FontWeight.bold
          //           ),),
          //       ],
          //     ),
          //   ),
          // ),

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
                              alignment: Alignment(-0.9, 0.0),
                              width: 320,
                              child: Text(
                                "***님 반갑습니다",
                                style: TextStyle(
                                  backgroundColor: Colors.white,
                                  fontFamily: 'RobotoSlab',
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ]))
                    ]),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                  alignment: Alignment(-0.9, 0.0),

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
                      Text('D-day+$_daycount'),
                      ElevatedButton(
                          onPressed: () {
                            setState(() {
                              // setState() 추가.
                              _daycount++;
                            });
                          },
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5)),
                              minimumSize: Size(20, 20)),
                          child: Icon(Icons.add)),
                      ElevatedButton(
                          onPressed: () {
                            setState(() {
                              if (_daycount != 0) {
                                // setState() 추가.
                                _daycount--;
                              }
                            });
                          },
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5)),
                              minimumSize: Size(20, 20)),
                          child: Icon(Icons.remove)),
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
                                    initnewsAsynk();
                                  },
                                )
                            )
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
                          alignment: Alignment(-0.9, 0.0),
                          width: 360,
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
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 2,
                            color: Colors.grey,
                          ),
                        ),
                        child: InkWell(
                          child: Text(' + '),
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute<void>(
                                fullscreenDialog: true,
                                builder: (BuildContext context) {
                                  return MainFoodMenu.setDayMeal(
                                      breakfast); //220823 홍석준 아침 전달
                                }));
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
                        alignment: Alignment(-0.9, 0.0),
                        width: 360,
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
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 2,
                            color: Colors.grey,
                          ),
                        ),
                        child: InkWell(
                          child: Text(' + '),
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute<void>(
                                fullscreenDialog: true,
                                builder: (BuildContext context) {
                                  return MainFoodMenu.setDayMeal(
                                      news[0][1]); //220823 홍석준 아침 전달
                                }));
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
                        alignment: Alignment(-0.9, 0.0),
                        width: 360,
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
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 2,
                              color: Colors.grey,
                            ),
                          ),
                          child: InkWell(
                            child: Text(' + '),
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute<void>(
                                  fullscreenDialog: true,
                                  builder: (BuildContext context) {
                                    return MainFoodMenu.setDayMeal(
                                        news[0][2]); //220823 홍석준 아침 전달
                                  }));
                            },
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
                          '전체 칼로리 : '+news[0][3].toString()+"\n영양소 : "+news[0][4].toString(),
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
                              Navigator.of(context).push(MaterialPageRoute<void>(
                                  fullscreenDialog: true,
                                  builder: (BuildContext context) {
                                    return MainFoodMenu.setDayMeal(
                                        news[0][2]); //220823 홍석준 아침 전달
                                  }));
                            },
                          )
                      )
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
                                "점심",
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

                                    initnewsAsynk2();
                                  },
                                )
                            )
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
                        alignment: Alignment(-0.9, 0.0),
                        width: 360,
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
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 2,
                            color: Colors.grey,
                          ),
                        ),
                        child: InkWell(
                          child: Text(' + '),
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute<void>(
                                fullscreenDialog: true,
                                builder: (BuildContext context) {
                                  return MainFoodMenu.setDayMeal(
                                      lunch); //220823 홍석준 아침 전달
                                }));
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
                        alignment: Alignment(-0.9, 0.0),
                        width: 360,
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
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 2,
                              color: Colors.grey,
                            ),
                          ),
                          child: InkWell(
                            child: Text(' + '),
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute<void>(
                                  fullscreenDialog: true,
                                  builder: (BuildContext context) {
                                    return MainFoodMenu.setDayMeal(
                                        news[1][1]); //220823 홍석준 아침 전달
                                  }));
                            },
                          )
                      )
                    ])),
                Container(
                    margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
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
                        alignment: Alignment(-0.9, 0.0),
                        width: 360,
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
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 2,
                            color: Colors.grey,
                          ),
                        ),
                        child: InkWell(
                          child: Text(' + '),
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute<void>(
                                fullscreenDialog: true,
                                builder: (BuildContext context) {
                                  return MainFoodMenu.setDayMeal(
                                      news[1][2]); //220823 홍석준 아침 전달
                                }));
                          },
                        ),
                      )
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

                                    initnewsAsynk3();
                                  },
                                )
                            )
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
                        alignment: Alignment(-0.9, 0.0),
                        width: 360,
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
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 2,
                              color: Colors.grey,
                            ),
                          ),
                          child: InkWell(
                            child: Text(' + '),
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute<void>(
                                  fullscreenDialog: true,
                                  builder: (BuildContext context) {
                                    return MainFoodMenu.setDayMeal(
                                        dinner); //220823 홍석준 아침 전달
                                  }));
                            },
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
                        alignment: Alignment(-0.9, 0.0),
                        width: MediaQuery.of(context).size.width*0.92,
                        height: 30,
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
                              Navigator.of(context).push(MaterialPageRoute<void>(
                                  fullscreenDialog: true,
                                  builder: (BuildContext context) {
                                    return MainFoodMenu.setDayMeal(
                                        news[2][1]); //220823 홍석준 아침 전달
                                  }));
                            },
                          )
                      )
                    ])),
                Container(
                    margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
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
                        alignment: Alignment(-0.9, 0.0),
                        width: 360,
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
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 2,
                              color: Colors.grey,
                            ),
                          ),
                          child: InkWell(
                            child: Text(' + '),
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute<void>(
                                  fullscreenDialog: true,
                                  builder: (BuildContext context) {
                                    return MainFoodMenu.setDayMeal(
                                        news[2][2]); //220823 홍석준 아침 전달
                                  }));
                            },
                          )
                      )
                    ])),
              ])),

          // SliverToBoxAdapter(
          //   child: Column(
          //     children: [
          //       Row(
          //         mainAxisAlignment: MainAxisAlignment.center,
          //         children: [
          //           Container(
          //               alignment: Alignment(0.0, 0.0),
          //
          //               //Spacer(),
          //               width: 85,
          //               height: 40,
          //               decoration: BoxDecoration(
          //                   color: Colors.white,
          //                   border: Border(
          //                     top: BorderSide(
          //                       color: Colors.grey,
          //                     ),
          //                     bottom: BorderSide(
          //                       color: Colors.grey,
          //                     ),
          //                   )),
          //               child: Text("아침 식단")),
          //           Spacer(),
          //           Container(
          //               alignment: Alignment(0.0, 0.0),
          //               //Spacer(),
          //               width: 85,
          //               height: 40,
          //               decoration: BoxDecoration(
          //                   color: Colors.white,
          //                   border: Border(
          //                     top: BorderSide(
          //                       color: Colors.grey,
          //                     ),
          //                     bottom: BorderSide(
          //                       color: Colors.grey,
          //                     ),
          //                   )),
          //               child: InkWell(
          //                 child: Text(breakfast),
          //                 onTap: () {
          //                   Navigator.of(context).push(MaterialPageRoute<void>(
          //                       fullscreenDialog: true,
          //                       builder: (BuildContext context) {
          //                         return MainFoodMenu.setDayMeal(
          //                             breakfast); //220823 홍석준 아침 전달
          //                       }));
          //                 },
          //               )), //220823 홍석준 변수로 변경
          //           Spacer(),
          //           Container(
          //               alignment: Alignment(0.0, 0.0),
          //               //Spacer(),
          //               width: 85,
          //               height: 40,
          //               decoration: BoxDecoration(
          //                   color: Colors.white,
          //                   border: Border(
          //                     top: BorderSide(
          //                       color: Colors.grey,
          //                     ),
          //                     bottom: BorderSide(
          //                       color: Colors.grey,
          //                     ),
          //                   )),
          //               child: InkWell(
          //                 child: Text(news[1]),
          //                 onTap: () {
          //                   Navigator.of(context).push(MaterialPageRoute<void>(
          //                       fullscreenDialog: true,
          //                       builder: (BuildContext context) {
          //                         return MainFoodMenu.setDayMeal(
          //                             news[1]); //220823 홍석준 아침 전달
          //                       }));
          //                 },
          //               )),
          //           Spacer(),
          //           Container(
          //               alignment: Alignment(0.0, 0.0),
          //               //Spacer(),
          //               width: 85,
          //               height: 40,
          //               decoration: BoxDecoration(
          //                   color: Colors.white,
          //                   border: Border(
          //                     top: BorderSide(
          //                       color: Colors.grey,
          //                     ),
          //                     bottom: BorderSide(
          //                       color: Colors.grey,
          //                     ),
          //                   )),
          //               child: InkWell(
          //                 child: Text(news[2]),
          //                 onTap: () {
          //                   Navigator.of(context).push(MaterialPageRoute<void>(
          //                       fullscreenDialog: true,
          //                       builder: (BuildContext context) {
          //                         return MainFoodMenu.setDayMeal(
          //                             news[2]); //220823 홍석준 아침 전달
          //                       }));
          //                 },
          //               )),
          //           Spacer(),
          //           Container(
          //               alignment: Alignment(0.0, 0.0),
          //               //Spacer(),
          //               width: 40,
          //               height: 40,
          //               decoration: BoxDecoration(
          //                   color: Colors.white,
          //                   border: Border(
          //                     top: BorderSide(
          //                       color: Colors.grey,
          //                     ),
          //                     bottom: BorderSide(
          //                       color: Colors.grey,
          //                     ),
          //                   )),
          //               child: InkWell(
          //                 child: Text('NEW'),
          //                 onTap: () {
          //                   setState(() {
          //                     loadingText(1);
          //                   });
          //
          //                   initnewsAsynk();
          //                 },
          //               )),
          //         ],
          //       ),
          //       Row(
          //         mainAxisSize: MainAxisSize.max,
          //         mainAxisAlignment: MainAxisAlignment.center,
          //         children: [
          //           Container(
          //               alignment: Alignment(0.0, 0.0),
          //               //Spacer(),
          //               width: 80,
          //               height: 50,
          //               color: Colors.white,
          //               child: Text("점심 식단")),
          //           Spacer(),
          //           Container(
          //               alignment: Alignment(0.0, 0.0),
          //               //Spacer(),
          //               decoration: BoxDecoration(
          //                 border: Border.all(),
          //               ),
          //               width: 80,
          //               height: 50,
          //               //color : Colors.blue,
          //               child: InkWell(
          //                 child: Text(lunch),
          //                 onTap: () {
          //                   Navigator.of(context).push(MaterialPageRoute<void>(
          //                       fullscreenDialog: true,
          //                       builder: (BuildContext context) {
          //                         return MainFoodMenu.setDayMeal(
          //                             lunch); //220823 홍석준 아침 전달
          //                       }));
          //                 },
          //               )), //220823 홍석준 변수로 변경
          //           Spacer(),
          //           Container(
          //               alignment: Alignment(0.0, 0.0),
          //               //Spacer(),
          //               width: 80,
          //               height: 50,
          //               //color : Colors.blue,
          //               child: InkWell(
          //                 child: Text(news2[1]),
          //                 onTap: () {
          //                   Navigator.of(context).push(MaterialPageRoute<void>(
          //                       fullscreenDialog: true,
          //                       builder: (BuildContext context) {
          //                         return MainFoodMenu.setDayMeal(
          //                             news2[1]); //220823 홍석준 아침 전달
          //                       }));
          //                 },
          //               )),
          //           Spacer(),
          //           Container(
          //               alignment: Alignment(0.0, 0.0),
          //               //Spacer(),
          //               width: 80,
          //               height: 50,
          //               //color : Colors.blue,
          //               child: InkWell(
          //                 child: Text(news2[2]),
          //                 onTap: () {
          //                   Navigator.of(context).push(MaterialPageRoute<void>(
          //                       fullscreenDialog: true,
          //                       builder: (BuildContext context) {
          //                         return MainFoodMenu.setDayMeal(
          //                             news2[2]); //220823 홍석준 아침 전달
          //                       }));
          //                 },
          //               )),
          //           Container(
          //               alignment: Alignment(0.0, 0.0),
          //               //Spacer(),
          //               width: 40,
          //               height: 50,
          //               //color : Colors.brown,
          //               child: InkWell(
          //                 child: Text('NEW'),
          //                 onTap: () {
          //                   setState(() {
          //                     loadingText(1);
          //                   });
          //
          //                   initnewsAsynk();
          //                 },
          //               )),
          //         ],
          //       ),
          //       Row(
          //         mainAxisSize: MainAxisSize.min,
          //         mainAxisAlignment: MainAxisAlignment.center,
          //         children: [
          //           Container(
          //               alignment: Alignment(0.0, 0.0),
          //               //Spacer(),
          //               width: 80,
          //               height: 50,
          //               //color : Colors.red,
          //               child: Text("저녁 식단")),
          //           Spacer(),
          //           Container(
          //               alignment: Alignment(0.0, 0.0),
          //               //Spacer(),
          //               width: 80,
          //               height: 50,
          //               //color : Colors.blue,
          //               child: InkWell(
          //                 child: Text(dinner),
          //                 onTap: () {
          //                   Navigator.of(context).push(MaterialPageRoute<void>(
          //                       fullscreenDialog: true,
          //                       builder: (BuildContext context) {
          //                         return MainFoodMenu.setDayMeal(
          //                             dinner); //220823 홍석준 아침 전달
          //                       }));
          //                 },
          //               )), //220823 홍석준 변수로 변경
          //           Spacer(),
          //           Container(
          //               alignment: Alignment(0.0, 0.0),
          //               //Spacer(),
          //               width: 80,
          //               height: 50,
          //               //color : Colors.blue,
          //               child: InkWell(
          //                 child: Text(news3[1]),
          //                 onTap: () {
          //                   Navigator.of(context).push(MaterialPageRoute<void>(
          //                       fullscreenDialog: true,
          //                       builder: (BuildContext context) {
          //                         return MainFoodMenu.setDayMeal(
          //                             news3[1]); //220823 홍석준 아침 전달
          //                       }));
          //                 },
          //               )),
          //           Spacer(),
          //           Container(
          //               alignment: Alignment(0.0, 0.0),
          //               //Spacer(),
          //               width: 80,
          //               height: 50,
          //               //color : Colors.blue,
          //               child: InkWell(
          //                 child: Text(news3[2]),
          //                 onTap: () {
          //                   Navigator.of(context).push(MaterialPageRoute<void>(
          //                       fullscreenDialog: true,
          //                       builder: (BuildContext context) {
          //                         return MainFoodMenu.setDayMeal(
          //                             news3[2]); //220823 홍석준 아침 전달
          //                       }));
          //                 },
          //               )),
          //           Container(
          //               alignment: Alignment(0.0, 0.0),
          //               //Spacer(),
          //               width: 40,
          //               height: 50,
          //               //color : Colors.brown,
          //               child: InkWell(
          //                 child: Text('NEW'),
          //                 onTap: () {
          //                   setState(() {
          //                     loadingText(1);
          //                   });
          //
          //                   initnewsAsynk();
          //                 },
          //               )),
          //         ],
          //       ),
          //     ],
          //   ),
          // ),
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            sliver: SliverToBoxAdapter(
              child: ImageCarousel(),
            ),
          ),
          // SliverPadding(
          //   padding: EdgeInsets.all(16.0),
          //   sliver: SliverToBoxAdapter(
          //     child: Row(
          //       children: [
          //         Count(),
          //       ],
          //     ),
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

class ImageCarousel extends StatefulWidget {
  const ImageCarousel({Key? key}) : super(key: key);

  @override
  State<ImageCarousel> createState() => _ImageCarouselState();
}

class _ImageCarouselState extends State<ImageCarousel> {
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
        aspectRatio: 1.335,
        child: Stack(
          //fit: StackFit.expand,
            alignment: Alignment.bottomRight,
            children: [
              PageView.builder(
                itemCount: foodImages.length,
                onPageChanged: (value) {
                  setState(() {
                    _currentPage = value;
                  });
                },
                itemBuilder: (context, index) => Image.asset(foodImages[index]),
              ),
              Positioned(
                  bottom: 16.0,
                  right: 16.0,
                  child: Row(
                      children: List.generate(
                        foodImages.length,
                            (index) => Padding(
                          padding: const EdgeInsets.only(left: 16.0 / 4),
                          child: IndicatorDot(isActive: index == _currentPage),
                        ),
                      ))),
            ]));
  }
}
