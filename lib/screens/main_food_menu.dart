import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/material/text_button.dart';
import 'package:food_management/data/food.dart';
import 'package:food_management/widget/bottom_bar.dart';



class MainFoodMenu extends StatefulWidget {
  const MainFoodMenu({Key? key}) : super(key: key);

  @override
  State<MainFoodMenu> createState() => _MainFoodMenuState();
}

class _MainFoodMenuState extends State<MainFoodMenu> {
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
  void initState(){
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: Colors.green,
              elevation: 0,
              title: Column(
                children: [
                  Text(
                    "오토키트",
                    style: TextStyle(color: Colors.black, fontFamily: 'RobotoSlab', fontSize: 25, ),
                  ),
                  Align(
                    alignment: Alignment.center,
                  )
                ],
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                child: Column(
                children: [
                  Padding(padding: EdgeInsets.all(5)),
                  Container(
                    color: Colors.white,
                    padding: EdgeInsets.fromLTRB(5, 10, 5, 10,),
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
                                  :Container(),
                              hintText: "검색",
                              labelStyle: TextStyle(color: Colors.white),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.transparent),
                                  borderRadius: BorderRadius.all(Radius.circular(10))),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.transparent),
                                  borderRadius: BorderRadius.all(Radius.circular(10))),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.transparent),
                                  borderRadius: BorderRadius.all(Radius.circular(10))),
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
                            :Expanded(child: Container(),flex: 0,)
                      ],
                    ),
                  )
                ],

                    )
                ),
              ),
          ]
      ),
    );
  }
}