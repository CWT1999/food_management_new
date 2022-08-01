import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_management/data/food.dart';
import 'main_food_menu.dart';


class MainHome extends StatefulWidget {
  const MainHome({Key? key}) : super(key: key);

  @override
  State<MainHome> createState() => _MainHomeState();
}

class _MainHomeState extends State<MainHome> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  "AutoKit",
                  style: TextStyle(
                    fontFamily: 'RobotoSlab', fontSize: 25, color: Colors.black
                  ),
                )
              ],
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            sliver: SliverToBoxAdapter(
              child: ImageCarousel(),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.all(16.0),
            sliver: SliverToBoxAdapter(
                child: Row(
                      children: [
                        Text("My Menu",
                        style: TextStyle(
                          fontFamily: 'RobotoSlab', fontSize: 25,fontWeight: FontWeight.bold
                        ),),
                  ],
                ),
              ),
            ),
          SliverToBoxAdapter(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(),
                Text("아침 식단"),
                Container(
                  child: Text("순두부찌개"),
                ),
                InkWell(
                  child: Icon(Icons.add),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute<Null>(
                        fullscreenDialog: true,
                        builder:(BuildContext context){
                          return MainFoodMenu();
                        }));
                    //Navigator.of(context).popUntil(ModalRoute.withName("/MainFoodMenu"));
                       },
                )
              ],
            ),
          )
        ],
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
          borderRadius: BorderRadius.all(Radius.circular(12))
      ),
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
            children: [PageView.builder(
              itemCount: foodImages.length,
              onPageChanged: (value) {
                setState(() {
                  _currentPage = value;
                });
              },
              itemBuilder: (context, index) => Image.asset(foodImages[index])
              ,),
              Positioned(
                  bottom: 16.0,
                  right: 16.0,
                  child: Row(
                      children: List.generate(
                        foodImages.length,
                            (index) => Padding(
                              padding: const EdgeInsets.only(left: 16.0 / 4),
                              child: IndicatorDot(
                                  isActive: index == _currentPage),
                            ),
                      )
                  )
              )
              ,
            ]
        )
    );
  }
}

