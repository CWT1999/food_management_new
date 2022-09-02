import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_management/data/food.dart';
import 'package:food_management/screens/main_home.dart';
import 'main_food_menu.dart';
import 'package:food_management/data/food_recommend_api/meal_recommend.dart';
import 'package:food_management/data/food_recommend_api/food_recommend.dart';
class MainHomeEdit extends StatefulWidget {
  List<dynamic>? news = null;
  String? breakfast = '';
  String? lunch = '';
  String? dinner = '';
  SendData? sendData;

  MainHomeEdit({Key? key,this.news, this.breakfast, this.lunch,this.dinner }) : super(key: key){
    sendData = SendData(news, breakfast, lunch, dinner);
  }

  @override
  State<MainHomeEdit> createState() => _MainHomeEditState();
}

class SendData{
  List<dynamic>? news;
  String? breakfast;
  String? lunch;
  String? dinner;
  SendData(this.news,this.breakfast,this.lunch,this.dinner){}

}

class _MainHomeEditState extends State<MainHomeEdit> {
   List<dynamic> news = [["","","",'',''],["","","",'',''],["","","",'','']];
   String breakfast = '';
   String lunch = '';
   String dinner = '';


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
    this.news = widget.news!;
    this.breakfast = widget.breakfast!;
    this.lunch = widget.lunch!;
    this.dinner = widget.dinner!;
    uri = Uri.parse('http://222.107.249.189:9990/api/' + breakfast);
    uri2 = Uri.parse('http://222.107.249.189:9990/api/' + lunch);
    uri3 = Uri.parse('http://222.107.249.189:9990/api/' + dinner);
    uri4 = Uri.parse('http://222.107.249.189:9990/api/meal');
    // initnewsAsynk4();
    isLoading = false;
    isLoading2 = false;
    isLoading3 = false;


  }



  late bool isLoading;
  late bool isLoading2;
  late bool isLoading3;
  late bool isLoading4;

  Future initNews() async {
    FoodRecommend newsProvider = FoodRecommend(uri);
    news[0] = await newsProvider.getNews();
  }

  Future initNews2() async {
    uri2 = Uri.parse('http://222.107.249.189:9990/api/' + lunch);
    FoodRecommend newsProvider2 = FoodRecommend(uri2);

    news[1] = await newsProvider2.getNews();
  }

  Future initNews3() async {
    uri3 = Uri.parse('http://222.107.249.189:9990/api/' + dinner);
    FoodRecommend newsProvider3 = FoodRecommend(uri3);

    news[2] = await newsProvider3.getNews();
  }

  Future initNewsAll1() async {
    breakfast = 'loading..';
    MealProviders newsProvider4 = MealProviders(uri4);
    List<dynamic> a  = await newsProvider4.getNews();
    breakfast = a[0];

    uri = Uri.parse('http://222.107.249.189:9990/api/' + breakfast);
    initnewsAsynk();

  }
  Future initNewsAll2() async {
    lunch = 'loading..';
    MealProviders newsProvider4 = MealProviders(uri4);
    List<dynamic> a  = await newsProvider4.getNews();
    lunch = a[1];

    uri2 = Uri.parse('http://222.107.249.189:9990/api/' + lunch);
    initnewsAsynk2();

  }
  Future initNewsAll3() async {
    dinner = 'loading..';
    MealProviders newsProvider4 = MealProviders(uri4);
    List<dynamic> a  = await newsProvider4.getNews();
    dinner = a[2];

    uri3 = Uri.parse('http://222.107.249.189:9990/api/' + dinner);
    initnewsAsynk3();

  }

  Future initNews4() async {
    MealProviders newsProvider4 = MealProviders(uri4);

    List<dynamic> a  = await newsProvider4.getNews();
    breakfast = a[0];
    lunch = a[1];
    dinner = a[2];



    loadingText(123);
    initnewsAsynk();
    initnewsAsynk2();
    initnewsAsynk3();

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
                                    initNewsAll1();

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
                          //   color : Colors.grey,f
                          // ),
                        )),
                    child: Row(children: [
                      Container(
                          padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
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
                        padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
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
                        padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
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
                      ),

                    ])),
                Container(
                    margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                    child : ElevatedButton(
                      child: Text("'"+"$breakfast"+"' 새로운 조합 가져오기"),
                      onPressed: () {
                        setState(() {
                          loadingText(1);
                        });
                        initnewsAsynk();
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
                                    initNewsAll2();
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
                        padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
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
                        padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
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
                          '전체 칼로리 : '+news[1][3].toString()+"\n영양소 : "+news[1][4].toString(),
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
                Container(
                    margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                    child : ElevatedButton(
                      child: Text("'"+"$lunch"+"' 새로운 조합 가져오기"),
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
                                    initNewsAll3();
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
                        padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
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
                        padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                        width: MediaQuery.of(context).size.width*0.92,
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
                          '전체 칼로리 : '+news[2][3].toString()+"\n영양소 : "+news[2][4].toString(),
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
                Container(
                    margin: EdgeInsets.fromLTRB(0, 0, 0, 20),
                    child : ElevatedButton(
                      child: Text("'"+"$dinner"+"' 새로운 조합 가져오기"),
                      onPressed: () {
                        setState(() {
                          loadingText(3);
                        });
                        initnewsAsynk3();
                      },
                    )),
                Container(
                  child : ElevatedButton(
                    child: Text("수정완료"),
                    onPressed: () {
                      Navigator.pop(context, SendData(news, breakfast, lunch, dinner));
                      //updateNewFood(FoodInfomation) 새로운 음식 업데이트
                      //updateNewMeal(FoodMeals) 새로운 식단 업데이트
                      print("음식과,식단 업데이트 그리고 product request");
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

  Future initNews5() async {
    FoodRecommend newsProvider5 = FoodRecommend(uri5);
  }

  Future initNews6() async {
    FoodRecommend newsProvider6 = FoodRecommend(uri6);
  }

  Future initNews7() async {
    FoodRecommend newsProvider7 = FoodRecommend(uri7);
  }
  void updateNewFood(String data){
    uri5 = Uri.parse('http://222.107.249.189:9990/api/updateFood'+'$data');
    uri6 = Uri.parse('http://222.107.249.189:9990/api/updateMeal'+'$data');
    uri7 = Uri.parse('http://222.107.249.189:9990/api/productFood');

  }
  void updateNewMeal(){

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
