import 'package:flutter/material.dart';



class NotVendorScreen extends StatefulWidget {
  const NotVendorScreen({ Key key }) : super(key: key);

  @override
  _NotVendorScreenState createState() => _NotVendorScreenState();
}

class _NotVendorScreenState extends State<NotVendorScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Container(
      child: Center(
        child: Text('Oops You are not Register as Vendor!',style: TextStyle(fontSize: 26,color: Colors.red),),
      ),
    ) ,
    );
    
    
     
  }
}