import 'package:flutter/material.dart';


class MobileAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
          toolbarHeight: 120,
       backgroundColor:Colors.grey[850],
       //   backgroundColor: Color(0xff36332e),
          elevation: 0,
          //centerTitle:true ,
          title: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 30),
            child: Text('FreeBiees', 
            style:TextStyle(fontSize: 20.0, fontWeight:FontWeight.bold,color: Color(0xFFFF335C) )),
          ),
          actions: <Widget>[
            Container(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                              child: Row(
                  children: [
  Padding(
            padding: const EdgeInsets.only(right: 18),
            child:Row(children: [
                Text('Games'),
                 GestureDetector(onTap: (){
                  Navigator.pushNamed(context, '/vedios');
                }, child: Icon(Icons.games,color:Colors.yellow  ,))
            ],) ,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 18),
            child:Row(children: [
                Text('Wallet'),
                Icon(Icons.account_balance_wallet)
            ],) ,
          ),
       
         
                  ],
                ),
              ),
            ),
        
          ],
        );
  }
}





































