import 'package:flutter/material.dart';


class DetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Detail Food'),
      // ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Stack(
              children: [
                Image.asset('images/burger.jpg'),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.transparent,
                        child: IconButton(
                          icon: Icon(
                            Icons.navigate_before,
                            color: Colors.black,
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ),
                      FavouriteButton(),
                    ],
                  ),
                )
              ],
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.all(20),
                    child: Text(
                      'Pizza',
                      style: TextStyle(fontFamily: 'Nexa', fontSize: 35, fontWeight: FontWeight.bold),
                    ),
                  ),
                  CustomPaint(
                    size: Size(200,100),
                    painter: CirclePainter(),
                  )
                ],
              ),
            ),
            Container(
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                  style: TextStyle(fontFamily: 'Nexa', fontSize: 20, fontWeight: FontWeight.normal),
                ),
              ),
            )
          ],
        )
      )
    );
  }
}


class FavouriteButton extends StatefulWidget {
  @override
  _FavouriteButtonState createState() => _FavouriteButtonState();
}


class _FavouriteButtonState extends State<FavouriteButton> {
  bool isFavourite = false;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        isFavourite ? Icons.favorite : Icons.favorite_border,
        color: Colors.black,
      ),
      onPressed: () {
        setState(() {
          isFavourite = !isFavourite;
        });
      },
    );
  }
}


class CirclePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Colors.orange
      ..strokeWidth = 0;

    var gap = 10;
    // var smallMarkWidth = 0;

    // Offset center = Offset(size.width / 2, size.height / 2);

    // canvas.drawCircle(center, 100, paint);
    canvas.drawRRect(RRect.fromRectAndRadius(Rect.fromLTWH(size.width - 200,gap * 2,gap + 170,gap * 5,),Radius.circular(30.0)),paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
