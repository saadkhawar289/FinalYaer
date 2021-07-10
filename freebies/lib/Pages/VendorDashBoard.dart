import 'dart:async';

import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:freebies/Models/Product.dart';
import 'package:freebies/Models/User.dart';
import 'package:scoped_model/scoped_model.dart';
import '../Scoped-Model/mainModel.dart';

class VendorDashboard extends StatefulWidget {
  
//  final User user;
//   VendorDashboard(
    
//     this.user
//   );

  @override
  State<StatefulWidget> createState() {
    return _VendorDashboardPageState();
  }
}

class _VendorDashboardPageState extends State<VendorDashboard> {
  @override
  initState() {
    //widget.model.fetchProducts();

    super.initState();
  }
bool loading=false;
  Widget _buildDrawer(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          AppBar(
            backgroundColor: Color(0xff36332e),
            automaticallyImplyLeading:
                false, // this for the button to hide when drawer is open
            title: Text('Choose'),
          ),

          ListTile(
            leading: Icon(Icons.edit),
            title: Text('Edit Product'),
            onTap: () {
              Navigator.pushNamed(context, '/productEdit');
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.assignment),
            title: Text('About Us'),
            onTap: () {
              Navigator.pushNamed(context, '/aboutUS');
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.pan_tool),
            title: Text('Privacy Policies'),
            onTap: () {
              Navigator.pushNamed(context, '/privacy');
            },
          ),
          Divider(),
          //  LogoutListTile()
        ],
      ),
    );
  }

  int _counter = 1;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      if (_counter == 0) {
        _counter = 1;
      } else
        _counter--;
    });
  }

  Widget webPageContent() {
    final double deviceWidth = MediaQuery.of(context).size.width;
    final double deviceHeight = MediaQuery.of(context).size.height;

    final double targetWidth =
        deviceWidth > 550.0 ? deviceWidth*0.20 : deviceWidth * 0.20;

    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Padding(
                //   padding: const EdgeInsets.symmetric(
                //     horizontal: 80,
                //   ),
                //   child: Container(
                //     margin: EdgeInsets.only(top: 130),
                //     width: targetWidth,
                //     height: deviceHeight * 0.60,
                //     color: Colors.white,
                //     child: Carousel(
                //       borderRadius: true,
                //       boxFit: BoxFit.contain,
                //       autoplay: true,
                //       animationCurve: Curves.bounceOut,
                //       animationDuration: Duration(milliseconds: 1500),
                //       dotSize: 6.0,
                //       dotIncreasedColor: Color(0xFFFF335C),
                //       dotBgColor: Colors.yellow,
                //       dotPosition: DotPosition.topRight,
                //       dotVerticalPadding: 10.0,
                //       showIndicator: true,
                //       indicatorBgPadding: 7.0,
                //       images: [
                //         NetworkImage(
                //             'https://m.media-amazon.com/images/S/aplus-media/sc/a829e124-4375-41c4-b0be-e699ebb974b2.__CR0,0,220,220_PT0_SX220_V1___.jpg'),
                //         NetworkImage(
                //             'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQubf5b89mP5fjIfUYGvtak5L0w1m0p2wLj0g&usqp=CAU'),
                //         NetworkImage(
                //             'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSDT1-fmn2GJM9xT0jXf4adtqmiRVBD8iqZRQ&usqp=CAU')
                //         // ExactAssetImage("assets/bbb.jpg"),
                //       ],
                //     ),
                //   ),
                //   //  Container(width: targetWidth,height: deviceHeight*0.60,child: Image.asset('assets/bbb.jpg',fit: BoxFit.fitHeight,)
                //   //  )
                // ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.03),
                  child: Container(
                    margin: EdgeInsets.only(top: 0),
                    color: Colors.white,
                    width: targetWidth,
                    height: //300,
                        deviceHeight * 0.55,
                    child: Padding(
                      padding:  EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width*0.05, vertical: 20),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Column(
                         crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            CircleAvatar(backgroundImage: AssetImage('assets/logoo.jpeg'), radius: MediaQuery.of(context).size.width*0.030,foregroundImage:AssetImage('assets/bbb.jpg') ,),
                                                        SizedBox(height: 20),

                            Text('widget.product.tittle',
                                style: TextStyle(
                                    fontSize: deviceWidth * 0.010,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black)),
                            SizedBox(height: 10),
                            Divider(
                              thickness: 3,
                              indent: 20,
                              endIndent: 30,
                            ),
                            SizedBox(height: 20),
                           Align(alignment: Alignment.centerLeft,
                              child:Row(
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child:  Text('Bussiness Name:',
                                  style: TextStyle(
                                      fontSize: deviceWidth * 0.010,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.yellow)),),
                                  Expanded(
                                    flex: 1,
                                    child: Text('childzzzzzzzzzzz'))
                                ],
                              )
                            ),
                            SizedBox(height: 10),
                           
                            Align(alignment: Alignment.centerLeft,
                              child:Row(
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child:  Text('Phone Number:',
                                  style: TextStyle(
                                      fontSize: deviceWidth * 0.010,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.yellow)),),
                                  Expanded(
                                    flex: 1,
                                    child: Text('childzzzzzzzzzzz'))
                                ],
                              )
                            ),
                                                        SizedBox(height: 10),

                            Align(alignment: Alignment.centerLeft,
                              child:Row(
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child:  Text('Address:',
                                  style: TextStyle(
                                      fontSize: deviceWidth * 0.010,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.yellow)),),
                                  Expanded(
                                    flex: 1,
                                    child: Text('childzzzzzzzzzzz'))
                                ],
                              )
                            ),
                                                        SizedBox(height: 10),

                            
                            Align(alignment: Alignment.centerLeft,
                              child:Row(
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child:  Text('Email:',
                                  style: TextStyle(
                                      fontSize: deviceWidth * 0.010,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.yellow)),),
                                  Expanded(
                                    flex: 1,
                                    child: Text('childzzzzzzzzzzz'))
                                ],
                              )
                            ),
                            SizedBox(height: 05),
                            Divider(
                              thickness: 3,
                              indent: 20,
                              endIndent: 30,
                            ),
                           
                            Text('About Comapny',
                                style: TextStyle(
                                    fontSize: deviceWidth * 0.010,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.black)),
                            SizedBox(height: 10),
                           Align(alignment: Alignment.centerLeft,
                              child:Row(
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child:  Text('Email:',
                                  style: TextStyle(
                                      fontSize: deviceWidth * 0.010,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.yellow)),),
                                  Expanded(
                                    flex: 1,
                                    child: Text('childzzzzzzzzzzz',style: TextStyle(
                                      fontSize: deviceWidth * 0.010,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.yellow),),)
                                ],
                              )
                            ),

                            //ListTileStyle.drawer
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 14),
                  child: Column(
                    children: [
                      Padding(
                        padding:  EdgeInsets.only(left:MediaQuery.of(context).size.width*0.65,top:MediaQuery.of(context).size.height*0.010),
                        child: Container(
                          height: 30,
                          width: 30,
                          child: Align( 
                          alignment: Alignment.bottomRight,
                          child: FloatingActionButton(onPressed: (){},child: Icon(Icons.add),tooltip: 'Add Products',)),
                     
                          color: Colors.red,
                        ),
                      ),
                        
                     
                        
                    
                      Container(
                        width: deviceWidth * 0.68,
                        margin: EdgeInsets.only(top: 30),
                        height: deviceHeight <= 800
                            ? deviceHeight * 0.65
                            : deviceHeight * 0.99,
                        decoration: BoxDecoration(
                          border: Border.all(width: 2, color: Colors.black),
                          color: Colors.white,
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(28.0),
                              child: Row(
                                children: [
                                  Text('Name'),
                                  Spacer(),
                                  Text('Hp Laptop')
                                ],
                              ),
                            ),
                            Divider(
                              thickness: 2,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(28.0),
                              child: Row(
                                children: [Text('Price'), Spacer(), Text('250')],
                              ),
                            ),
                            Divider(
                              thickness: 2,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(28.0),
                              child: Row(
                                children: [
                                  Text('Quantity'),
                                  Spacer(),
                                  GestureDetector(
                                      onTap: () {
                                        _decrementCounter();
                                      },
                                      child: Icon(Icons.arrow_back_ios_sharp,
                                          color: Colors.greenAccent[700])),
                                  Text(_counter.toString()),
                                  GestureDetector(
                                      onTap: () {
                                        _incrementCounter();
                                      },
                                      child: Icon(
                                        Icons.arrow_forward_ios,
                                        color: Colors.greenAccent[700],
                                      ))
                                ],
                              ),
                            ),



ScopedModelDescendant<MainModel>(
      builder: (BuildContext context, Widget child, MainModel model) {
        return model.isLoading
            ? Center(child: CircularProgressIndicator())
            : ElevatedButton(
                              child:loading==false? Text("Add to Cart"):CircularProgressIndicator(),
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.resolveWith<Color>(
                                  (Set<MaterialState> states) {
                                    if (states.contains(MaterialState.hovered)) {
                                      return Colors.green;
                                    } else {
                                      return Color(0xFFFF335C);
                                    }
                                  },
                                ),
                              ),
                              onPressed: () {
                                setState(() {
                                  loading =true;
                                                               Timer(Duration(seconds: 2), (){

                                    
                                  
                                try {
                                        if(model.cartItems.contains('cartItem')){
                                          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                      title: Text('Product Already Added'),
                      content: Text('Please Try another product'),
                      actions: <Widget>[
                        FlatButton(
                          onPressed: () =>{
                             setState(() {
                                  loading=false;  
                                  }),
                             Navigator.of(context).pop(),
                          },
                          child: Text('Okay'),
                        )
                      ],
                );
              });
                                        }
                                        else{
//model.addToCart('cartItem');
loading=false;

                                        }


                                  
                                  
                                // print(widcartItems.length);
                                } catch (e) {
                                  print('Not ok');
                                  print(e);
                                }
                              });

                                });
                                
                              },
                            );
      },
    ),














                            
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
         
                    SizedBox(height: 200,),
                  //  Container(
                   
                  //    height: 50,color: Colors.black ,width: deviceWidth,  child: Column(children: [

                       
                  //         Center(child: Padding(
                  //           padding: const EdgeInsets.symmetric(vertical: 10),
                  //           child: Text('Copyright \u00a9  FreeBies',style: TextStyle(color: Colors.white,fontSize: 18,),),
                  //         )),
                           
                         
                  
                  // //      Text('targetheight ''$targetHeight'.toString() ),
                  // //      Text('totalheight ''$deviceHeight'.toString() ),
                  // //  Text('totalwidth ''$deviceWidth'.toString())
                  //  ],),),
        ],
      ),
    );
  }

  Widget mobilepageContent(BuildContext context) {
    final double deviceWidth = MediaQuery.of(context).size.width;
    final double deviceHeight = MediaQuery.of(context).size.height;

    final double targetWidth =
        deviceWidth > 550.0 ? deviceWidth * 0.99 : deviceWidth * 0.99;

    final double targetHeight =
        deviceWidth > 550.0 ? deviceWidth * 0.99 : deviceWidth * 0.99;

    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(0.0),
              child: Container(
                color: Colors.white,
                width: targetWidth,
                height: deviceHeight * 0.35,
                child: Container(
                  width: targetWidth,
                  height: deviceHeight * 0.60,
                  child: Carousel(
                    autoplayDuration: Duration(milliseconds: 1000),
                    boxFit: BoxFit.contain,
                    autoplay: true,
                    animationCurve: Curves.fastOutSlowIn,
                    animationDuration: Duration(milliseconds: 1000),
                    dotSize: 6.0,
                    dotIncreasedColor: Color(0xFFFF335C),
                    dotBgColor: Colors.transparent,
                    dotPosition: DotPosition.topRight,
                    dotVerticalPadding: 10.0,
                    showIndicator: true,
                    indicatorBgPadding: 7.0,
                    images: [
                      NetworkImage(
                          'https://m.media-amazon.com/images/S/aplus-media/sc/a829e124-4375-41c4-b0be-e699ebb974b2.__CR0,0,220,220_PT0_SX220_V1___.jpg'),
                      NetworkImage(
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQubf5b89mP5fjIfUYGvtak5L0w1m0p2wLj0g&usqp=CAU'),
                      NetworkImage(
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSDT1-fmn2GJM9xT0jXf4adtqmiRVBD8iqZRQ&usqp=CAU')
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(0.0),
              child: Container(
                width: targetWidth,
                //  height: deviceHeight*0.90,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 50, vertical: 50),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text('widget.product.tittle',
                            style: TextStyle(
                                fontSize: deviceWidth * 0.040,
                                fontWeight: FontWeight.bold,
                                color: Colors.black)),
                        SizedBox(height: 10),
                        Divider(),
                        SizedBox(height: 10),
                        Text('Reviews',
                            style: TextStyle(
                                fontSize: deviceWidth * 0.030,
                                fontWeight: FontWeight.normal,
                                color: Colors.grey)),
                        SizedBox(height: 10),
                        Divider(),
                        SizedBox(height: 10),
                        Text('widget.product.price.toString()',
                            style: TextStyle(
                                fontSize: deviceWidth * 0.030,
                                fontWeight: FontWeight.bold,
                                color: Colors.yellow)),
                        SizedBox(height: 10),
                        Divider(),
                        SizedBox(height: 10),
                        Text('Descripition ',
                            style: TextStyle(
                                fontSize: deviceWidth * 0.030,
                                fontWeight: FontWeight.normal,
                                color: Colors.black)),
                        SizedBox(height: 10),
                        Divider(),
                        SizedBox(height: 10),
                        Text('widget.product.description',
                            style: TextStyle(
                                fontSize: deviceWidth * 0.030,
                                fontWeight: FontWeight.normal,
                                color: Colors.black)),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(24),
              child: Container(
                width: deviceWidth * 0.70,
                height: deviceHeight <= 800
                    ? deviceHeight * 0.43
                    : deviceHeight * 0.45,
                decoration: BoxDecoration(
                  border: Border.all(width: 2, color: Colors.black),
                  // color:Colors.white54,
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(28.0),
                      child: Row(
                        children: [Text('Name'), Spacer(), Text('widget.product.tittle')],
                      ),
                    ),
                    Divider(
                      thickness: 2,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(28.0),
                      child: Row(
                        children: [Text('Price'), Spacer(), Text('widget.product.price.toString()')],
                      ),
                    ),
                    Divider(
                      thickness: 2,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(28.0),
                      child: Row(
                        children: [
                          Text('Quantity'),
                          Spacer(),
                          GestureDetector(
                              onTap: () {
                                _decrementCounter();
                              },
                              child: Icon(Icons.arrow_back_ios_sharp)),
                          Text(_counter.toString()),
                          GestureDetector(
                              onTap: () {
                                _incrementCounter();
                              },
                              child: Icon(
                                Icons.arrow_forward_ios,
                              ))
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 61,
                      child: ScopedModelDescendant<MainModel>(
      builder: (BuildContext context, Widget child, MainModel model) {
        return model.isLoading
            ? Center(child: CircularProgressIndicator())
            : RaisedButton(
                color: Theme.of(context).accentColor,
                textColor: Colors.white,
                child: Text('SAVE'),
                onPressed:(){
                 
                  
                  
                  
                }  
                  
                   
              );
      },
    ) ,
                      // child: ElevatedButton(

                      //   child: Text("Add to Cart"),
                      //   style: ButtonStyle(
                          
                      //     backgroundColor:
                      //         MaterialStateProperty.resolveWith<Color>(
                      //       (Set<MaterialState> states) {
                      //         if (states.contains(MaterialState.hovered)) {
                      //           return Colors.green;
                      //         } else {
                      //           return Color(0xFFFF335C);
                      //         }
                      //       },
                      //     ),
                          
                      //   ),
                      //   onPressed: () {
                      //    setState(() {
                      //      loading=true;
                      //      Timer(Duration(seconds: 2), (){

                      //       try {
                      //         widget.model.add();
                      //         print('good ');
                      //         loading=false;
                      //         print(widget.model.cartItems.length);
                      //       } catch (e) {
                      //         print('Not ok');
                      //         print(e);
                      //       }
                      //     });
                      //    });
                      //   },
                      // ),
                    ),
                   
                  ],
                ),
              ),
            ),
            Container(
              height: 30,
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final double deviceHeight = MediaQuery.of(context).size.height;
    final double deviceWidth = MediaQuery.of(context).size.width;
    final double targetHeight =
        deviceHeight > 550.0 ? 420.0 : deviceHeight * 0.60;
//   final double targetheight= deviceHeight * 0.60;
    return Scaffold(
        drawer: deviceWidth < 500 ? _buildDrawer(context) : null,
        backgroundColor: Colors.white,
        appBar: deviceWidth > 500
            ? AppBar(
                toolbarHeight: 120,
                backgroundColor: Colors.grey[850],
                //   backgroundColor: Color(0xff36332e),

                elevation: 0,
                title: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 70, vertical: 30),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/homes');
                    },
                    child: Text('FreeBiees',
                        style: TextStyle(
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFFFF335C))),
                  ),
                ),
                actions: <Widget>[
                  Container(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 58),
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 58),
                                  child: Row(
                                    children: [
                                      Text('Games'),
                                      Icon(
                                        Icons.games,
                                        color: Color(0xFFFF335C),
                                      )
                                    ],
                                  ),
                                ),
                                Text(MediaQuery.of(context).size.height.toString()),
                                Icon(Icons.account_balance_wallet,
                                    color: Color(0xFFFF335C))
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 58),
                            child: Row(
                              children: [
                                Text('SIGN IN'),
                                Icon(Icons.supervised_user_circle,
                                    color: Colors.yellow)
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 58),
                            child: Row(
                              children: [
                                Text('Cart'),
                                GestureDetector(
                                  onTap: () {
                                    
                                  },
                                  child: Icon(
                                    Icons.shopping_cart,
                                    color: Colors.yellow,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              )
            : AppBar(
                toolbarHeight: 120,
                backgroundColor: Colors.grey[850],
                //   backgroundColor: Color(0xff36332e),
                elevation: 0,
                //centerTitle:true ,
                title: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
                  child: Text('FreeBiees',
                      style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white)),
                ),
                actions: <Widget>[
                  Container(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 18),
                            child: Row(
                              children: [
                                Text('Games'),
                                Icon(
                                  Icons.games,
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 18),
                            child: Row(
                              children: [
                                Text('Wallet'),
                                Icon(Icons.account_balance_wallet)
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              bottomNavigationBar: Container(
                   
                     height: 50,color: Colors.black ,width: deviceWidth,  child: Column(children: [

                       
                          Center(child: Padding(
                        
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Text('Copyright \u00a9  FreeBies ',style: TextStyle(color: Colors.white,fontSize: 18,),),
                          )),
                           
                         
                  
                  //      Text('targetheight ''$targetHeight'.toString() ),
                  //      Text('totalheight ''$deviceHeight'.toString() ),
                  //  Text('totalwidth ''$deviceWidth'.toString())
                   ],),),
        body: SafeArea(child: LayoutBuilder(builder: (context, constraints) {
          if (constraints.maxWidth <= 600) {
            return mobilepageContent(context);
          } else if (constraints.maxWidth <= 720) {
            return mobilepageContent(context);
          } else {
            return webPageContent();
          }
        })));
  }
}
