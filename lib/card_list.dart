import 'package:flutter/material.dart';
import 'package:submission/food_detail.dart';


class CardList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
                ))
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
            // if (constraints.maxWidth < 900) {
            return GridView.count(
              crossAxisCount: 2,
              childAspectRatio: 0.80,
              mainAxisSpacing: 1.0,
              crossAxisSpacing: 1.0,
              children: _generateContainers(context),
            );
          }
        // },
      ),
    );
  }
  List<Widget> _generateContainers(BuildContext context) {
    return List<Widget>.generate(20, (index) {
      return Container(
        padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
        // height: 220,
        // width: double.maxFinite,
        child: Stack(
          children: <Widget>[
            Align(
              // alignment: Alignment.centerRight,
              child: Stack(
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return DetailScreen();
                      }));
                    },
                    child: Card(
                      // semanticContainer: true,
                      child: Stack(
                      children: [
                      Align(
                        alignment: Alignment.topCenter,
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 130),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset('images/burger.jpg', height: 300, width: 250,),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 50, left: 15),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Pizza',
                            style: TextStyle(fontFamily: 'Nexa', fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 100, left: 15),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Chicken, Cheese',
                            style: TextStyle(fontFamily: 'Nexa', fontSize: 15, fontStyle: FontStyle.normal),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10, left: 15),
                        child: Align(
                          alignment: Alignment.bottomLeft,
                          child: Text(
                            '\$\8',
                            style: TextStyle(fontFamily: 'Nexa', fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      ],
                    ),
                    // clipBehavior: Clip.antiAliasWithSaveLayer,
                    shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0)
                    ),
                    elevation: 5,
                    // margin: EdgeInsets.all(10),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    });
  }
}