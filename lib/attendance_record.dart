import 'package:attendance/selected_record.dart';
import 'package:attendance/users.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'database_helper.dart';


class AttendanceRecord extends StatefulWidget {


  @override
  State<AttendanceRecord> createState() => _AttendanceRecordState();
}

class _AttendanceRecordState extends State<AttendanceRecord> {
  TextEditingController? _textEditingController = TextEditingController();
  ScrollController? _scrollController = ScrollController();

/*List<Users>? userList = [
  Users( '0133555888',  'Ben',  DateTime.now()),
  Users( '0187522677',  'Will', DateTime.now()),
  Users( '0152131113',  'Chan Saw Lin',  DateTime.now()),
  ];
   List<Users> searchUserList = [
     Users( '0133555888',  'Ben',  DateTime.now()),
     Users( '0187522677',  'Will', DateTime.now()),
     Users( '0152131113',  'Chan Saw Lin',  DateTime.now()),
   ];
  late DatabaseHelper db;

  Future<int> _createUsers() async {
    Users user1 =
    Users( '0133555888', 'Ben', DateTime.now());
    Users user2 =
    Users('0187522677', 'Will', DateTime.now());

    userList = [user1, user2];
    return await db.insertUsers(userList!);
  }*/

  List<Users> userList = [
    // Users(id: '1', name: 'Jason', checkIn: DateTime.now()),
    Users(phone: '0133555888', name: 'Ben', checkIn: DateTime.now()),
    Users(phone: '0187522677', name: 'Will', checkIn: DateTime.now()),
    Users(phone: '0152131113', name: 'Chan Saw Lin', checkIn: DateTime.now()),
    Users(phone: '0161231346', name: 'Lee Saw Loy', checkIn: DateTime.now()),
    Users(phone: '0158398109', name: 'Khaw Tong Lin', checkIn: DateTime.now()),
    Users(phone: '0168279101', name: 'Lim Kok Lin', checkIn: DateTime.now()),
    Users(phone: '0112731912', name: 'Low Jun Wei', checkIn: DateTime.now()),
    Users(phone: '0172332743', name: 'Yong Wei Kai', checkIn: DateTime.now()),
    Users(phone: '0191236439', name: 'Jayden Lee', checkIn: DateTime.now()),
    Users(phone: '0111931233', name: 'Kong Kah Yan', checkIn: DateTime.now()),
    Users(phone: '0162879190', name: 'Jasmine Lau', checkIn: DateTime.now()),
    Users(phone: '016783239', name: 'Chan Saw Lin', checkIn: DateTime.now()),
    Users(phone: '0155586999', name: 'Abby', checkIn: DateTime.now()),
    Users(phone: '0141452933', name: 'Peter', checkIn: DateTime.now()),
    Users(phone: '0166539975', name: 'Janice', checkIn: DateTime.now()),
    Users(phone: '0199988775', name: 'Walter', checkIn: DateTime.now()),
    Users(phone: '0132252364', name: 'Benedict', checkIn: DateTime.now()),
    Users(phone: '0199857584', name: 'Winston', checkIn: DateTime.now()),
    Users(phone: '0199857584', name: 'Mark', checkIn: DateTime.now()),
    Users(phone: '0199857584', name: 'Corry', checkIn: DateTime.now()),
    Users(phone: '0199857584', name: 'Warwick', checkIn: DateTime.now()),
    Users(phone: '0199857584', name: 'Addams', checkIn: DateTime.now()),


    // Users(id: '3', name: 'Jason', checkIn: '2022-10-25 13:21:37'),
    // Users(id: '4', name: 'May', checkIn: '2022-10-25 13:30:02'),
    //  Users(id: '5', name: 'Alan', checkIn: '2022-10-25 13:01:50'),
    // Users(id: '6', name: 'Peter', checkIn: '2022-10-25 13:07:40'),
  ];

  List<Users> searchUserList = [];
  @override
  void initState() {
    searchUserList = userList!;
    super.initState();

   /* db = DatabaseHelper();
    db.initializedDB().whenComplete(() async {
      await _createUsers();
      setState(() {});
    });*/
  }

  void _runSearch(String keyword) {
    List<Users> result = [];
    if(keyword.isEmpty) {
      result = userList!;
    }else if(keyword.toLowerCase().contains(RegExp(r'^-?[0-9]+$'))) {
      result = userList!.where((user) => user.phone.toLowerCase().contains(keyword.toLowerCase())).toList();
    }else {
      result = userList!.where((user) => user.name.toLowerCase().contains(keyword.toLowerCase())).toList();
    }

    setState(() {
      searchUserList = result;
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          decoration: BoxDecoration(color: Colors.blue.shade300),
          child: TextField(
            onChanged: (value) => _runSearch(value),
            controller: _textEditingController,
            decoration: const InputDecoration(
              border: InputBorder.none,
              errorBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              contentPadding: EdgeInsets.all(15),
              hintText: 'Search',
              suffixIcon: Icon(Icons.search_rounded)),
          ),
        ),
      ),
      body: /*FutureBuilder(
        future: db.retrieveUsers(),
        builder: (BuildContext context, AsyncSnapshot<List<Users>> snapshot) {
        if (snapshot.hasData) {*/
      NotificationListener<ScrollEndNotification>(
      child: ListView.builder(
        controller: _scrollController,
        itemCount: searchUserList.length,
        itemBuilder: (context, index) => Card(
              //margin: const EdgeInsets.all(5),
              child: ListTile(
                leading: Text(searchUserList[index].name, style: TextStyle(fontSize: 12 ),),
                title: Text(searchUserList[index].phone, style: TextStyle(fontSize: 12),),
                subtitle: Text(DateFormat('yyyy-MM-dd HH:mm:ss').format(searchUserList[index].checkIn), style: TextStyle(fontSize: 15),),

                  onTap:() {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SelectedRecord(),
                        settings: RouteSettings(
                          arguments: searchUserList[index],
                        ),
                      ),
                    );
                  },
             ),
        ),
      ),
      onNotification: (notification) {
            print(_scrollController!.position.pixels);
          print(notification.metrics.pixels);

          Fluttertoast.showToast(
            msg: "You have reached the end of the list",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 3,
            backgroundColor: Colors.deepPurpleAccent,
            textColor: Colors.white,
            fontSize: 15.0,
          );
          return true;
      },

      ),
       /* }else {
    return const Center(child: CircularProgressIndicator());}
        return const Center(child: CircularProgressIndicator()); },*/
      );
  }
}


