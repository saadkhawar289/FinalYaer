

import 'package:flutter/material.dart';

class User {
  final String pass;
final String id;
final String name;
final String email;
final String number;
final String image;
final String wallet; 
final String address;
final String cnic;
final String token;
final bool isProvider;
final String fireBaseID;
 bool isAccepted;




  User({
    @required this.pass,
    @required this.isAccepted,
    @required this.id,
    @required this.fireBaseID,
    @required this.name,
    @required this.email,
     @required this.image,
     @required this.number,
     @required this.wallet,
    @required this.address,
     @required this.cnic,
     @required this.token,
     @required this.isProvider
   // @required this. subServices,
  });
}
