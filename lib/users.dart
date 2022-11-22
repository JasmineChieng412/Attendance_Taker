import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:attendance/users.dart';

class Users {
   String phone='0000000000';
   String name='noName';
   DateTime checkIn= DateTime.now(); //split into date and time
  //final String checkIn;
  //final DateTime date;
  //final DateTime time;


  Users({required this.phone, required this.name, required this.checkIn});
  Users.map(dynamic obj){
    this.name = obj['name'];
    this.phone = obj['phone'];
    this.checkIn = obj['checkIn'];
  }

  String get _name => name;
  String get _phone => phone;
  DateTime get _checkIn => checkIn;

  Map<String , dynamic> toMap(){
    var map = new Map<String , dynamic>();
    map['username'] = _name;
    map['password'] = _phone;
    map['city'] = _checkIn;
    return map;
  }

  Users.fromMap(Map<String , dynamic>map){
    this.name = map['name'];
    this.phone = map['phone'];
    this.checkIn = map['checkIn'];

  }
}