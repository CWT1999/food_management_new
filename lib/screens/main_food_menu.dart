import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/material/text_button.dart';
import 'package:food_management/data/food.dart';
import 'package:food_management/data/food_model.dart';
import 'package:food_management/widget/bottom_bar.dart';

class MainFoodMenu extends StatefulWidget {
  const MainFoodMenu({Key? key}) : super(key: key);

  @override
  State<MainFoodMenu> createState() => _MainFoodMenuState();
}

class _MainFoodMenuState extends State<MainFoodMenu> {
  static List<FoodModel> main_foods_list = [
    FoodModel(
      "닭가슴살",
      15,
      150,
    ),
    FoodModel(
      "현미밥",
      30,
      300,
    ),
    FoodModel(
      "햄버거",
      50,
      500,
    ),
  ];

  List<FoodModel> display_list = List.from(main_foods_list);

  void updateList(String value) {
    setState(() {
      display_list = main_foods_list
          .where((element) =>
              element.food_title!.toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }

  final TextEditingController _filter = TextEditingController();
  FocusNode focusNode = FocusNode();
  String _searchText = "";

  _MainFoodMenuState() {
    _filter.addListener(() {
      setState(() {
        _searchText = _filter.text;
      });
    });
  }

  @override
  void initState() {
    super.initState();
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
              "AutoKit",
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
              onChanged: (value) => updateList(value),
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
              child: ListView.builder(
                itemCount: display_list.length,
                itemBuilder: (context, index) => ListTile(
                    contentPadding: EdgeInsets.all(8.0),
                    title: Text(
                      display_list[index].food_title!,
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text("kcal "+
                      '${display_list[index].food_kcal}',
                      style: TextStyle(color: Colors.black),
                    ),
                    trailing: Text("protein "+
                      "${display_list[index].food_protein}",
                      style: TextStyle(color: Colors.amber),
                    ),
                    //leading: Image.network('')
                ),
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
