import 'package:flutter/material.dart';

class Screen1 extends StatefulWidget {
  const Screen1({Key? key}) : super(key: key);

  @override
  State<Screen1> createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.pink[100],
      child: Center(
        child: Column(
          children: [
            Image.asset(
              'icon_images/white_check.png',
              height: 400,
              width: 400,
            ),
            const Text( "  ",
                style:
                TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white)),
            const Text( "Add New Records!",
                style:
                TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white)),
            const Text( "Take your attendance easily just by adding your name and phone number!",
                style:
                TextStyle(fontSize: 20, fontWeight: FontWeight.normal, color: Colors.white)),
          ],
        ),
        //Text('Screen 1'),
        //put images or description here
      ),
    );
  }
}
