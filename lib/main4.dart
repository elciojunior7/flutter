import 'package:flutter/material.dart';

void main() {
  runApp(Recipe());
}

class Recipe extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Receitas da Vovó',
      home: Scaffold(
          appBar: AppBar(
            title: Text('Country'),
          ),
          body: Container(
            margin: EdgeInsets.all(30),
            alignment: Alignment.center,
            child: Column(
              children: [
                Padding(
                    padding: EdgeInsets.only(bottom: 20),
                    child: Image.asset(
                      'assets/images/argentina.jpg',
                      width: 250,
                    )),
                Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Text(
                    "Argentina",
                    style: TextStyle(
                        color: Colors.brown,
                        fontWeight: FontWeight.w900,
                        fontSize: 20),
                  ),
                ),
                Padding(
                    padding: EdgeInsets.only(left: 5.0, right: 5.0),
                    child: Text(
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi in sapien sed quam finibus imperdiet. Donec libero erat, vehicula nec arcu cursus, eleifend efficitur diam. Donec lobortis elit vel bibendum tempor. Praesent iaculis sapien non facilisis cursus. Sed nec justo in ex ultrices malesuada. Maecenas sagittis dui et tellus imperdiet, nec ornare odio varius. Suspendisse bibendum arcu consequat libero commodo, vitae placerat est consectetur. Aliquam blandit ne.",
                        style: TextStyle(color: Colors.black, fontSize: 12))),
                SizedBox(height: 10),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.star, color: Colors.blue[500]),
                    Icon(Icons.star, color: Colors.blue[500]),
                    Icon(Icons.star, color: Colors.blue[500]),
                    Icon(Icons.star, color: Colors.black),
                    Icon(Icons.star, color: Colors.black),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Icon(Icons.airplanemode_active, color: Colors.blue[500]),
                        Text("Travel"),
                        Text("1h")
                      ],
                    ),
                    Column(
                      children: [
                        Icon(Icons.language_rounded, color: Colors.blue[500]),
                        Text("Language"),
                        Text("Spanish")
                      ],
                    ),
                    Column(
                      children: [
                        Icon(Icons.restaurant, color: Colors.blue[500]),
                        Text("Culinary"),
                        Text("Meat")
                      ],
                    )
                  ],
                )
              ],
            ),
          )),
    );
  }
}
