import 'package:flutter/material.dart';
import 'package:food_management/data/food_model.dart';
import 'package:pie_chart/pie_chart.dart';
import '../data/providers.dart';
import '../data/food_model.dart' as fd;
import 'main_home_edit.dart';
import 'dart:math' as math;


class MainFoodMenu2 extends StatefulWidget {
  const MainFoodMenu2({Key? key}) : super(key: key);

  @override
  State<MainFoodMenu2> createState() => _MainFoodMenu2State();
}

class _MainFoodMenu2State extends State<MainFoodMenu2>
    with AutomaticKeepAliveClientMixin<MainFoodMenu2> {
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
              selectedFood + " 변경",
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
              "Serch for a Food information",
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

  DetailScreen({Key? key, required this.food}) : super(key: key);

  final fd.Row? food;

  @override
  Widget build(BuildContext context) {

    dataMap["탄수화물(g)"] = double.parse((food?.nUTRCONT2).toString());
    dataMap["단백질(g)"] = double.parse((food?.nUTRCONT3).toString());
    dataMap["지방(g)"] =  double.parse((food?.nUTRCONT4).toString());
    dataMap["당(g)"] =  double.parse((food?.nUTRCONT5).toString());
    dataMap["나트륨(g)"] = double.parse((food?.nUTRCONT6).toString()) / 100;
    // dataMap["콜레스테롤"] = double.parse((food?.nUTRCONT7).toString()) / 100;
    // dataMap["트랜스지방"] = food?.nUTRCONT9 as double;

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
              "${food?.dESCKOR}         ",
              style: TextStyle(
                color: Colors.black,
                fontFamily: 'Arial Black',
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
        //     "${food?.dESCKOR}\n 1회 제공량: ${food?.sERVINGSIZE}g\n 칼로리: ${food?.nUTRCONT1}kcal\n 탄수화물: ${food?.nUTRCONT2}g\n 단백질: ${food?.nUTRCONT3}g\n 지방: ${food?.nUTRCONT4}g\n 당류: ${food?.nUTRCONT5}g\n 나트륨: ${food?.nUTRCONT6}mg\n 콜레스테롤: ${food?.nUTRCONT7}mg\n 포화지방산: ${food?.nUTRCONT8}g\n 트랜스지방: ${food?.nUTRCONT9}g",
        // style: TextStyle(fontSize:20)
        // ),

      ),
    );
  }
}