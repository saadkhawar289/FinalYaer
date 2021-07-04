import 'package:flutter/material.dart';

class Navbar  extends StatelessWidget{
  
 

  Widget build(BuildContext context) {
    return  AppBar(
      toolbarHeight: 120,
        automaticallyImplyLeading: true,
       backgroundColor:Colors.black,
       //grey[850],
       //   backgroundColor: Color(0xff36332e),
          elevation: 0,
          //centerTitle:true ,
          title: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 70,vertical: 30),
            child: Text('FreeBiees', 
            style:TextStyle(fontSize: 30.0, fontWeight:FontWeight.bold,color:Colors.red[900] )),
          ),
          actions: <Widget>[
            Container(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                              child: Row(
                  children: [
              //       Text(targetHeight.toString()),
              // SizedBox(width: 10,),
              //   Text(deviceHeight.toString()),
              //   SizedBox(width: 10,),
              //   Text(deviceWidth.toString())
  Padding(
            padding: const EdgeInsets.only(right: 58),
            child:Row(children: [
                Text('Games'),
                GestureDetector(onTap: (){
                  Navigator.pushNamed(context, '/vedios');
                }, child: Icon(Icons.games,color:Colors.yellow  ,))
            ],) ,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 58),
            child:Row(children: [
                Text('Wallet'),
                Icon(Icons.account_balance_wallet,color:Colors.yellow )
            ],) ,
          ),
         Padding(
            padding: const EdgeInsets.only(right: 58),
            child:Row(children: [
                Text('SIGN IN'),
                Icon(Icons.supervised_user_circle,color:Colors.yellow )
            ],) ,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 58),
            child:Row(children: [
                Text('Cart'),
                GestureDetector(
                  onTap: (){
                    Navigator.pushNamed(context, '/cart');
                  },
                  child: Icon(Icons.shopping_cart,color:Colors.yellow, ))
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