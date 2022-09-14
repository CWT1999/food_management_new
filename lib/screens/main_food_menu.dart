import 'package:flutter/material.dart';
import 'package:food_management/data/food_model.dart';
import '../data/providers.dart';
import 'package:food_management/screens/main_home.dart';

class MainFoodMenu extends StatefulWidget {
  String selectedFood = ''; //받아온 음식 220829 홍석준
  MainFoodMenu({Key? key}) : super(key: key); //Const 삭제
  MainFoodMenu.setDayMeal(this.selectedFood);

  @override
  State<MainFoodMenu> createState() => _MainFoodMenuState();
}

class _MainFoodMenuState extends State<MainFoodMenu> {
  late Future<Food> futureFood;
  String selectedFood = '';

  final myController = TextEditingController();

  // 기존에 승훈이 코드
  // static List<Food> main_foods_list = [
  //   Food(
  //     "닭가슴살",
  //     15,
  //     150,
  //   ),
  //   Food(
  //     "현미밥",
  //     30,
  //     300,
  //   ),
  //   Food(
  //     "햄버거",
  //     50,
  //     500,
  //   ),
  // ];
  //
  // List<Food> display_list = List.from(main_foods_list);
  //
  // void updateList(String value) {
  //   setState(() {
  //     display_list = main_foods_list.where((element) => element.food_title!.toLowerCase().contains(value.toLowerCase())).toList();
  //   });
  // }
  //
  // final TextEditingController _filter = TextEditingController();
  // FocusNode focusNode = FocusNode();
  // String _searchText = "";
  //
  // _MainFoodMenuState() {
  //   _filter.addListener(() {
  //     setState(() {
  //       _searchText = _filter.text;
  //     });
  //   });
  // }

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the
    // widget tree.
    myController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    selectedFood = widget.selectedFood; //받아온 음식 전달 220829홍석준
  }

  void _onLoading() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
            child: new Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            new CircularProgressIndicator(),
            new Text("Loading"),
          ],
        ));
      },
    );
    new Future.delayed(new Duration(seconds: 3), () {
      Navigator.pop(context);
      _onLoading();
    });
  }

  // If you want to have the option of reloading the API in response to an InheritedWidget changing,
  // put the call into the didChangeDependencies() method
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    futureFood = fetchFood('');
  }

  // Update Food List
  void updateList(String foodName) {
    print('updateList()');
    setState(() {
      futureFood = fetchFood(foodName);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        elevation: 0,
        title: Column(
          children: [
            Text(
              selectedFood+" 변경       ",
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
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Serch for a Food",
              style: TextStyle(
                color: Colors.black,
                fontSize: 22.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            TextField(
              onSubmitted: (String foodName) {
                updateList(foodName);
              },
              style: TextStyle(color: Colors.black),
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey,
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  hintText: "검색",
                  prefixIcon: Icon(Icons.search),
                  prefixIconColor: Colors.white),
            ),
            SizedBox(
              height: 20.0,
            ),
            Expanded(
              child: FutureBuilder<Food>(
                future: futureFood,
                builder: (context, snapshot) {
                  if (snapshot.data?.i2790?.row == null) {
                    return Text('음식을 검색해 주세요.');
                  } else {
                    return ListView.builder(
                      itemCount: snapshot.data?.i2790?.row?.length,
                      itemBuilder: (context, index) {
                        // print(foodIterable?.elementAt(index));
                        return ListTile(
                          title: Text(
                              '${snapshot.data?.i2790?.row?.map((futureFood) => futureFood.dESCKOR).elementAt(index)}'),
                          onTap: () {
                            Navigator.pop(
                                context,
                                snapshot.data?.i2790?.row
                                    ?.map((futureFood) => futureFood)
                                    .elementAt(index));
                          },
                          subtitle: Text(
                              '${snapshot.data?.i2790?.row?.map((futureFood) => futureFood.nUTRCONT1).elementAt(index)} kcal'),
                          trailing: Text(
                              '1인분 양: ${snapshot.data?.i2790?.row?.map((futureFood) => futureFood.sERVINGSIZE).elementAt(index)}g',
                              style: TextStyle(color: Colors.amber)),
                        );
                      },
                    );
                  }
                  // By default, show a loading spinner.
                  return const CircularProgressIndicator();
                },

                // 기존에 승훈이 코드
                // itemBuilder: (context, index) => ListTile(
                //   contentPadding: EdgeInsets.all(8.0),
                //   title: Text(
                //     display_list[index].food_title!,
                //     style: TextStyle(
                //         color: Colors.black, fontWeight: FontWeight.bold),
                //   ),
                //   subtitle: Text(
                //     'kcal ${display_list[index].food_kcal}',
                //     style: TextStyle(color: Colors.black),
                //   ),
                //   trailing: Text(
                //     'protein ${display_list[index].food_protein}',
                //     style: TextStyle(color: Colors.amber),
                //   ),
                //   //leading: Image.network('')
                // ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/* CustomScrollView(slivers: [ //이 아래부터는 넷플 검색창
        SliverToBoxAdapter(
          child: Container(
              child: Column(
            children: [
              Padding(padding: EdgeInsets.all(5)),
              Container(
                color: Colors.white,
                padding: EdgeInsets.fromLTRB(
                  5,
                  10,
                  5,
                  10,
                ),
                child: Row(
                  children: [
                    Expanded(
                      flex: 6,
                      child: TextField(
                        focusNode: focusNode,
                        style: TextStyle(
                          fontSize: 20,
                        ),
                        autofocus: true,
                        controller: _filter,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.grey,
                          prefixIcon: Icon(
                            Icons.search,
                            color: Colors.black,
                            size: 20,
                          ),
                          suffixIcon: focusNode.hasFocus
                              ? IconButton(
                                  onPressed: () {
                                    setState(() {
                                      _filter.clear();
                                      _searchText = "";
                                    });
                                  },
                                  icon: Icon(
                                    Icons.cancel,
                                    size: 20,
                                  ),
                                )
                              : Container(),
                          hintText: "검색",
                          labelStyle: TextStyle(color: Colors.white),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.transparent),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.transparent),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.transparent),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                        ),
                      ),
                    ),
                    focusNode.hasFocus
                        ? Expanded(
                            child: TextButton(
                              child: Text('취소'),
                              onPressed: () {
                                setState(() {
                                  _filter.clear();
                                  _searchText = "";
                                  focusNode.unfocus();
                                });
                              },
                            ),
                          )
                        : Expanded(
                            child: Container(),
                            flex: 0,
                          )
                  ],
                ),
              ),
            ],
          )),
        ),
      ]),*/
