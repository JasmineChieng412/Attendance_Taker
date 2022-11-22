import 'package:flutter/material.dart';

class Screen2 extends StatefulWidget {
  const Screen2({Key? key}) : super(key: key);

  @override
  State<Screen2> createState() => _Screen1State();
}

class _Screen1State extends State<Screen2> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.deepOrange[100],
      child: Center(
        child: Column(
          children: [
            Image.asset(
              'icon_images/white_checkList.png',
              height: 500,
              width: 500,
            ),
            const Text( "Check the Records!",
                style:
                TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white)),
            const Text( "Inspect a list of attendees who had checked-in with the app and find specific info with just a search!",
                style:
                TextStyle(fontSize: 20, fontWeight: FontWeight.normal, color: Colors.white)),
          ],
        ),
      ),
    );
  }
}