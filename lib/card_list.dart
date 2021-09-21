import 'package:flutter/material.dart';
import 'package:submission/food_detail.dart';
import 'package:submission/model/food.dart';

class CardList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    /*24 is for notification bar on Android*/
    final double itemHeight = (size.height - kToolbarHeight - 144) / 2;
    final double itemWidth = size.width / 2;
    // Size screenSize = MediaQuery
    //     .of(context)
    //     .size;
    // Orientation orientation = MediaQuery.of(context).orientation;

    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.notes,
                  color: Colors.black,
                )),
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.account_circle_outlined,
                  color: Colors.black,
                )),
          ],
        ),
        // actions: <Widget>[
        //   Row(
        //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //     // crossAxisAlignment: CrossAxisAlignment.start,
        //     children: [
        //       IconButton(
        //           onPressed: () {},
        //           icon: Icon(
        //             Icons.notes,
        //             color: Colors.black,
        //           )),
        //       IconButton(
        //           onPressed: () {},
        //           icon: Icon(
        //             Icons.account_circle_outlined,
        //             color: Colors.black,
        //       ))
        //     ],
        //   )
        // ],
        // title: Text('Food List', style: TextStyle(color: Colors.black),),
        backgroundColor: Colors.white,
      ),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          if (constraints.maxWidth < 600) {
            return GridView.count(
              crossAxisCount: 2,
              childAspectRatio: (itemWidth / itemHeight),
              // childAspectRatio: 0.80,
              mainAxisSpacing: 10.0,
              crossAxisSpacing: 1.0,
              children: _generateContainers(context),
            );
          } else if (constraints.maxWidth < 900) {
            return GridView.count(
              crossAxisCount: 4,
              childAspectRatio: (itemWidth / itemHeight),
              mainAxisSpacing: 10.0,
              crossAxisSpacing: 1.0,
              children: _generateContainers(context),
            );
          } else {
            return GridView.count(
              crossAxisCount: 6,
              childAspectRatio: (itemWidth / itemHeight),
              mainAxisSpacing: 10.0,
              crossAxisSpacing: 1.0,
              children: _generateContainers(context),
            );
          }
        },
      ),
    );
  }

  List<Widget> _generateContainers(BuildContext context) {
    return List<Widget>.generate(foodList.length, (index) {
      final Food food = foodList[index];
      return Container(
        padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
        // height: 220,
        // width: double.maxFinite,
        child: GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return DetailScreen(
                food: food,
              );
            }));
          },
          child: Card(
            // semanticContainer: true,
            // child: IntrinsicHeight(
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Container(
                      padding: const EdgeInsets.only(top: 50),
                      width: MediaQuery.of(context).size.width,
                      child: FittedBox(
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(5.0),
                            child: Image.asset(food.imageAsset, height: 50,)),
                        fit: BoxFit.cover,
                      )),
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.only(left: 10),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        '',
                        style: TextStyle(
                            fontFamily: 'Nexa',
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                Expanded(
                    child: Container(
                      padding: const EdgeInsets.only(top: 10, left: 10),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          food.name,
                          style: TextStyle(
                              fontFamily: 'Nexa',
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Align(
                        alignment: Alignment.centerLeft,
                        child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: food.categories.map((category) {
                              return Text(
                                '$category, ',
                                style: TextStyle(
                                    fontFamily: 'Nexa',
                                    fontSize: 15,
                                    fontStyle: FontStyle.normal),
                              );
                            }).toList())),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 10, left: 15),
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        '\$\ ${food.price.toString()}',
                        style: TextStyle(
                            fontFamily: 'Nexa',
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            // ),
            // clipBehavior: Clip.antiAliasWithSaveLayer,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0)),
            elevation: 5,
            // margin: EdgeInsets.all(10),
          ),
        ),
      );
    });
  }
}
