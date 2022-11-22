import 'package:attendance/attendance_record.dart';
import 'package:attendance/introduction_screen.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class DashboardOptions extends StatefulWidget {
  const DashboardOptions({Key? key}) : super(key: key);

  @override
  _DashboardOptionsState createState() => _DashboardOptionsState();
}

class _DashboardOptionsState extends State<DashboardOptions> {
  Card makeDashboardItem(String title, String iconImage, int index) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.all(8),
      child: GestureDetector(
       child: Container( decoration: index == 0 || index == 3 || index == 4
            ? BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          gradient: const LinearGradient(
            begin: FractionalOffset(0.0, 0.0),
            end: FractionalOffset(3.0, -1.0),
            colors: [
              Color(0xFF004B8D),
              Color(0xFFffffff),
            ],
          ),
          boxShadow: const [
            BoxShadow(
              color: Colors.white,
              blurRadius: 3,
              offset: Offset(2, 2),
            )
          ],
        )
            : BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          gradient: const LinearGradient(
            begin: FractionalOffset(0.0, 0.0),
            end: FractionalOffset(3.0, -1.0),
            colors: [
              Colors.purple,
              Colors.amber,
            ],
          ),
          boxShadow: const [
            BoxShadow(
              color: Colors.white,
              blurRadius: 3,
              offset: Offset(2, 2),
            )
          ],
        ),
        child: InkWell(
          onTap: () {
            if (index == 0) {
              Fluttertoast.showToast(
                msg: "This task is unavailable",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.CENTER,
                timeInSecForIosWeb: 3,
                backgroundColor: Colors.deepPurpleAccent,
                textColor: Colors.white,
                fontSize: 15.0,
              );
            }
            if (index == 1) {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context){
                      return AttendanceRecord();
                    }
                ),
              );
            }
            if (index == 2) {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context){
                      return IntroductionScreen();
                    }
                ),
              );
            }
          },
          splashColor: Colors.deepOrange,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            verticalDirection: VerticalDirection.down,
            children: [
              const SizedBox(height: 50),
              Center(
                child: Image.asset(
                  iconImage,
                  height: 35,
                  width: 35,
                ),
              ),
              const SizedBox(height: 20),
              Center(
                child: Text(
                  title,
                  style: const TextStyle(
                      fontSize: 21,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurpleAccent[100],
      body: Column(
        children: [
          const SizedBox(height: 100),
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const <Widget>[
                    Text(
                      "Welcome to Attendance Taker!",
                      style:
                      TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                    SizedBox(height: 4),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              padding: const EdgeInsets.all(2),
              children: [
                makeDashboardItem("Check-In", "icon_images/white_check.png", 0),
                makeDashboardItem("Attendance Record", "icon_images/white_checkList.png", 1),
                makeDashboardItem("How-To","icon_images/white_qnMark.png", 2),
              ],
            ),
          ),
        ],
      ),
    );
  }
}