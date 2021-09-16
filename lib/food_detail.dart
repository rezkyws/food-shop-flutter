import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Detail Food'),
      // ),
      body: SafeArea(
        child: SingleChildScrollView(
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
                    Stack(
                      children: [
                        CustomPaint(
                          size: Size(200,100),
                          painter: CirclePainter(),
                        ),
                        QuantityButton(),
                            // Positioned(
                            //     left: 100,
                            //     child: Icon(Icons.home, color: Colors.black, size: 20,)
                            // ),
                      ],
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
          ),
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

class QuantityButton extends StatefulWidget {
  const QuantityButton({Key? key}) : super(key: key);

  @override
  _QuantityButtonState createState() => _QuantityButtonState();
}

class _QuantityButtonState extends State<QuantityButton> {
  final _formKey = GlobalKey<FormState>();
  // TextEditingController myController = TextEditingController()..text = _quantity.toString();
  // int _quantity = 0;

  TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller.text = "0"; // Setting the initial value for the field.
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: EdgeInsets.only(top: 20),
          child: IconButton(
              onPressed: () {
                int currentValue = int.parse(_controller.text);
                setState(() {
                  if(currentValue > 0) {
                    currentValue--;
                    _controller.text = currentValue.toString();
                  }
                });
              },
              icon: Icon(
                Icons.remove,
                color: Colors.white,
              )
          ),
        ),
        Container(
          padding: EdgeInsets.only(top: 10),
          width: 85,
          height: 50,
          child: TextFormField(
            controller: _controller,
            textAlign: TextAlign.center,
            autocorrect: false,// to get rid span warning
            keyboardType: TextInputType.visiblePassword, // to get rid span warning
            key: _formKey,
            // keyboardType: TextInputType.number,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.digitsOnly
            ], // Only numbers can be enter
            // maxLength: 10,
            decoration: InputDecoration(
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.orange),
                ),
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.orange)
                )
            ),
            // onChanged: (text) {
            //   setState(() {
            //     _quantity = int.parse(text);
            //   });
            // },
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 20),
          child: IconButton(
              onPressed: () {
                int currentValue = int.parse(_controller.text);
                setState(() {
                  currentValue++;
                  _controller.text = currentValue.toString();
                });
              },
              icon: Icon(
                Icons.add,
                color: Colors.white,
              )
          ),
        ),
      ]
    );
  }
}
