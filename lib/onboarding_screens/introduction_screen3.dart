import 'package:flutter/material.dart';

class Screen3 extends StatefulWidget {
  const Screen3({Key? key}) : super(key: key);

  @override
  State<Screen3> createState() => _Screen1State();
}

class _Screen1State extends State<Screen3> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue[100],
      child: Center(
        child: Column(
          children: [
            Image.asset(
              'icon_images/white_qnMark.png',
              height: 400,
              width: 400,
            ),
            const Text( "  ",
                style:
                TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white)),
            Text( "Review Guide!",
                style:
                TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white)),
            Text( "You may review this again if you forget how the app works!",
                style:
                TextStyle(fontSize: 20, fontWeight: FontWeight.normal, color: Colors.white)),
          ],
        ),
      ),
    );
  }
}