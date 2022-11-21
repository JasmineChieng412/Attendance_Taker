import 'package:attendance/users.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SelectedRecord extends StatefulWidget {
  const SelectedRecord({Key? key}) : super(key: key);

  @override
  State<SelectedRecord> createState() => _SelectedRecordState();
}

class _SelectedRecordState extends State<SelectedRecord> {
  @override
  Widget build(BuildContext context) {
    final user = ModalRoute.of(context)!.settings.arguments as Users;

    return Scaffold(
      appBar: AppBar(
        title: Text(user.name),
        backgroundColor: Colors.blue,
      ),
      body:ListView(
        itemExtent: 40.0,
        shrinkWrap: true,
        children: [
          Text("Name:"),
          Text(user.name, style: TextStyle(fontSize: 20 ),),
          Text("Phone:"),
          Text(user.phone, style: TextStyle(fontSize: 20 ),),
          Text("Check-In:"),
          Text(DateFormat('yyyy-MM-dd HH:mm:ss').format(user.checkIn), style: TextStyle(fontSize: 20),),
        ],
      ),
    );
  }
}
