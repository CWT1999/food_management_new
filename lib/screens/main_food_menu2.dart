import 'package:flutter/material.dart';
import 'package:food_management/data/food_model.dart';
import '../data/providers.dart';
import '../data/food_model.dart' as fd;

class MainFoodMenu2 extends StatefulWidget  {
  const MainFoodMenu2({Key? key}) : super(key: key);

  @override
  State<MainFoodMenu2> createState() => _MainFoodMenu2State();
}

class _MainFoodMenu2State extends State<MainFoodMenu2> with AutomaticKeepAliveClientMixin<MainFoodMenu2> {
  @override
  bool get wantKeepAlive => true;

  String selectedFood = '';
  late Future<Food> futureFood;

  final myController = TextEditingController();

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
              selectedFood + " 검색",
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
                            '${snapshot.data?.i2790?.row?.map((futureFood) => futureFood.dESCKOR).elementAt(index)}',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DetailScreen(
                                        food: snapshot.data?.i2790?.row
                                            ?.map((futureFood) => futureFood)
                                            .elementAt(index))));
                          },
                          subtitle: Text(
                              '${snapshot.data?.i2790?.row?.map((futureFood) => futureFood.nUTRCONT1).elementAt(index)} kcal'),
                          trailing: Text(
                              '1인분 양: ${snapshot.data?.i2790?.row?.map((futureFood) => futureFood.sERVINGSIZE).elementAt(index)}g',
                              style: TextStyle(color: Colors.orange)),
                        );
                      },
                    );
                  }
                  // By default, show a loading spinner.
                  return const CircularProgressIndicator();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DetailScreen extends StatelessWidget {
  DetailScreen({Key? key, required this.food}) : super(key: key);

  final fd.Row? food;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        elevation: 0,
        title: Column(
          children: [
            Text(
              "상세 정보         ",
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
        child: Text(
            "${food?.dESCKOR}\n 1회 제공량: ${food?.sERVINGSIZE}g\n 칼로리: ${food?.nUTRCONT1}kcal\n 탄수화물: ${food?.nUTRCONT2}g\n 단백질: ${food?.nUTRCONT3}g\n 지방: ${food?.nUTRCONT4}g\n 당류: ${food?.nUTRCONT5}g\n 나트륨: ${food?.nUTRCONT6}mg\n 콜레스테롤: ${food?.nUTRCONT7}mg\n 포화지방산: ${food?.nUTRCONT8}g\n 트랜스지방: ${food?.nUTRCONT9}g",
        style: TextStyle(fontSize:20)
        ),

      ),
    );
  }
}