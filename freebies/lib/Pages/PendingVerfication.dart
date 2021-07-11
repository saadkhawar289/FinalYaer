import 'package:flutter/material.dart';



class PendingVerification extends StatefulWidget {
  const PendingVerification({ Key key }) : super(key: key);

  @override
  _PendingVerificationScreenState createState() => _PendingVerificationScreenState();
}

class _PendingVerificationScreenState extends State<PendingVerification> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
      child: Center(
        child: Text('Your request to register as vendor is pending',style: TextStyle(fontSize: 26,color: Colors.red),),
      ),
    ) ,
    );
    
   
  }
}