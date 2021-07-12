import 'dart:async';

import 'package:flutter/material.dart';
import 'package:freebies/Pages/Login.dart';
import 'package:freebies/Pages/home.dart';
import 'package:freebies/Widgets/Cards/CartTile.dart';
import 'package:scoped_model/scoped_model.dart';

import '../Scoped-Model/mainModel.dart';

class Cart extends StatefulWidget {
  final MainModel model;
  Cart(this.model);

  @override
  State<StatefulWidget> createState() {
    return _CartPageState();
  }
}

class _CartPageState extends State<Cart> {
  final Map<String, dynamic> _formData = {
    'onlinePayment': false,
    'Wallet': false,
  };
  final TextEditingController _walletAmountController = TextEditingController();
  bool loading = false;
  bool _walletTextField = false;
  var zz;
  @override
  initState() {
    //widget.model.allProvidersForAdmin();
    super.initState();
  }

  Widget _acceptOnlinePayment() {
    return SwitchListTile(
      activeColor: Colors.green,
      value: _formData['onlinePayment'],
      onChanged: (bool value) {
        setState(() {
          _formData['onlinePayment'] = value;
        });
      },
      title: GestureDetector(
        onTap: () {},
        child: Text('pay from Card',
            style:
                TextStyle(fontWeight: FontWeight.normal, color: Colors.black)),
      ),
    );
  }

  Widget webAppBar() {
    return AppBar(
      toolbarHeight: 120,
      automaticallyImplyLeading: true,
      backgroundColor: Colors.black,
      //grey[850],
      //   backgroundColor: Color(0xff36332e),
      elevation: 0,
      //centerTitle:true ,
      title: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 70, vertical: 30),
        child:
        //  Container(
        //   height: 70,
        //   width: 90,
        //   child:Image.asset('assets/logoo.jpeg'))
        
        // Text('FreeBiees',
        //     style: TextStyle(
        //         fontSize: 30.0,
        //         fontWeight: FontWeight.bold,
        //         color: Color(0xFFFF335C))),
  GestureDetector(
          onTap: (){
Navigator.pushNamed(context, "/homes");

          },
          child: Image(image:AssetImage('assets/Untitled.png',),height: MediaQuery.of(context).size.height*0.12,width:MediaQuery.of(context).size.width*0.05 ,fit:BoxFit.fill ,)),
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
                  child: Row(
                    children: [
                      Text('ENTERTAINMENT'),
                      GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, '/entertainment');
                          },
                          child: Icon(
                            Icons.extension_sharp,
                            color: Colors.yellow,
                          ))
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 58),
                  child: Row(
                    children: [

 ScopedModelDescendant<MainModel>(
      builder: (BuildContext context, Widget child, MainModel model) {
        return  Text(model.wallet==null?'WALLET'.toString():model.wallet.toString(),style: TextStyle(color: Colors.white,fontSize: 14, ));
      },
    ),


                     // Text(widget.model.wallet==null?'':widget.model.wallet.toString(),style: TextStyle(color: Color(0xFFFF335C),fontSize: 18,fontWeight:FontWeight.bold ),),
                      GestureDetector(
                          onTap: () {
                            //   Navigator.pushNamed(context, '/games');
                          },
                          child: Icon(Icons.account_balance_wallet,
                              color: Colors.yellow))
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 58),
                  child: Row(
                    children: [
                      widget.model.singleUser==null? Text('LOGIN'):Text('LOGOUT'),
                      GestureDetector(
                          onTap: () {
                            if(widget.model.singleUser==null){
Navigator.pushNamed(context, '/auth');
                            }
                            else{
                              widget.model.logout();
                              Navigator.pushReplacementNamed(context, '/homes');
                            }
                               
                          },
                          child: Icon(Icons.supervised_user_circle,
                              color: Colors.yellow))
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 58),
                  child: Row(
                    children: [
                      Text('CART'),
                      GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, '/cart');
                          },
                          child: Icon(
                            Icons.shopping_cart,
                            color: Colors.yellow,
                          ))
                    ],
                  ),
                ),
                  Padding(
                  padding: const EdgeInsets.only(right: 58),
                  child: Visibility(
                    visible:widget.model.singleUser==null?false:true,
                    child: Row(
                      children: [
                        Text('ORDERS'),
                        GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, '/UserDashBoard');
                            },
                            child: Icon(
                              Icons.book,
                              color: Colors.yellow,
                            ))
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

    Widget mobileAppBar() {
    final double deviceWidth = MediaQuery.of(context).size.width;
final targetWidth=deviceWidth<650?deviceWidth*0.30:0.30;
    return AppBar(
      toolbarHeight: 120,
      backgroundColor: Colors.black,
      //   backgroundColor: Color(0xff36332e),
      elevation: 0,
      //centerTitle:true ,
      title: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
        child:         Image(image:AssetImage('assets/Untitled.png',),height: MediaQuery.of(context).size.height*0.12,width:targetWidth ,fit:BoxFit.fill ,),

      ),
      actions: <Widget>[
        // Container(
        //   child: SingleChildScrollView(
        //     scrollDirection: Axis.horizontal,
        //     child:
        //   ),
      
      ],
    );
  }

   Widget _buildDrawer(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          AppBar(
            backgroundColor: Color(0xff36332e),
            automaticallyImplyLeading:
                false, // this for the button to hide when drawer is open
            title: ScopedModelDescendant<MainModel>(
      builder: (BuildContext context, Widget child, MainModel model) {
        return  Text(model.wallet==null?'WALLET'.toString():model.wallet.toString(),style: TextStyle(color: Colors.white,fontSize: 14, ));
      },
    ),
          ),

          ListTile(
            leading: Icon(Icons.shopping_cart_rounded),
            title: Text('Cart'),
            onTap: () {
              Navigator.pushNamed(context, '/cart');
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.favorite),
            title:widget.model.singleUser==null? Text('LOGIN'):Text('LOGOUT'),

            onTap: () {
                 if(widget.model.singleUser==null){
Navigator.pushNamed(context, '/auth');
                            }
                            else{
                              widget.model.logout();
                              Navigator.pushReplacementNamed(context, '/homes');
                            }
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.pan_tool),
            title: Text('Orders'),
            onTap: () {
              Navigator.pushNamed(context, '/privacy');
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.pan_tool),
            title: Text('Entertainment'),
            onTap: () {
              Navigator.pushNamed(context, '/entertainment');
            },
          ),
          //  LogoutListTile()
        ],
      ),
    );
  }

  Widget _acceptFromWallet() {
    return SwitchListTile(
      activeColor: Colors.green,
      value: _formData['Wallet'],
      onChanged: (bool value) {
        setState(() {
          _formData['Wallet'] = value;
          if (value) {
            _walletTextField = true;
          } else {
            _walletTextField = false;
          }
        });
      },
      title: GestureDetector(
        onTap: () {},
        child: Text('pay From Wallet',
            style:
                TextStyle(fontWeight: FontWeight.normal, color: Colors.black)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final double deviceHeight = MediaQuery.of(context).size.height;
    final double deviceWidth = MediaQuery.of(context).size.width;

    var walletamount = _walletAmountController.text;

    return ScopedModelDescendant<MainModel>(
      builder: (BuildContext context, Widget child, MainModel model) {
        return Scaffold(
            drawer: deviceWidth <= 650 ? _buildDrawer(context) : null,
        appBar: deviceWidth < 650 ? mobileAppBar() : webAppBar(),
            body: model.cartItems.length == 0
                ? Scaffold(body: Center(child: Text("Cart Empty")))
                : Center(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 30),
                              child: Text('Your Cart Items',
                                  style: TextStyle(
                                      fontSize: 25.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black)),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            /// idr main info box aye ga
                            //   al
                            alignment: Alignment.topCenter,
                            margin: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 30),
                            // //padding:EdgeInsets.all(8.8),
                            height: deviceHeight * 0.60,
                            width: deviceWidth * 0.90, //searchbox height
                            decoration: BoxDecoration(
                              color: Color(0xffFAFBFD),
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                    offset: Offset(0, 10),
                                    blurRadius: 30,
                                    color: Color(0xff36332e))
                              ],
                            ),

                            child: ListView.builder(
                              shrinkWrap: true,
                              addAutomaticKeepAlives: true,
                              scrollDirection: Axis.vertical,
                              itemBuilder: (BuildContext context, int index) {
                                //  bill=(bill) + (total);
                                //  print('bill');
                                //  print(bill);
                                var xx;
                                return Container(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text((xx = index + 1).toString(),
                                          style: TextStyle(
                                              fontSize: 15.0,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black)),
                                      CartTile(model.cartItems[index], index),
                                      IconButton(
                                          hoverColor: Colors.green,
                                          splashRadius: 30,
                                          icon: Icon(
                                            Icons.delete,
                                            color: Colors.red,
                                          ),
                                          onPressed: () {
                                            setState(() {
                                              model.totalBill = model
                                                      .totalBill -
                                                  model.cartItems[index].price;
                                              model.cartItems.removeAt(index);
                                            });
                                          }),
                                    ],
                                  ),
                                );
                              },
                              itemCount: model.cartItems.length,
                            ),
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 30, vertical: 30),
                              child: Text('Summary',
                                  style: TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black)),
                            ),
                          ),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                Container(

                                    /// idr main info box aye ga
                                    alignment: Alignment.topLeft,
                                    margin: EdgeInsets.symmetric(
                                        horizontal: deviceWidth < 600
                                            ? deviceWidth * 0.05
                                            : deviceWidth * 0.13),
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 0),
                                    width: deviceWidth < 650
                                        ? deviceWidth * 0.43
                                        : deviceWidth * 0.30,
                                    height: deviceWidth <= 650
                                        ? deviceHeight * 0.35
                                        : deviceHeight * 0.42,
                                    decoration: BoxDecoration(
                                      color: Color(0xffFAFBFD),
                                      borderRadius: BorderRadius.circular(20),
                                      boxShadow: [
                                        BoxShadow(
                                            offset: Offset(0, 10),
                                            blurRadius: 10,
                                            color: Color(0xff36332e))
                                      ],
                                    ),
                                    child: loading
                                        ? Center(
                                            child: CircularProgressIndicator())
                                        : Center(
                                            child: Column(
                                              children: [
                                                Column(
                                                  children: [
                                                    SizedBox(
                                                      height: 30,
                                                    ),
                                                    Center(
                                                      child: Row(
                                                        children: [
                                                          Expanded(
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsets.all(
                                                                      deviceWidth <
                                                                              600
                                                                          ? 10
                                                                          : 28),
                                                              child: Text(
                                                                  'Total Amount ',
                                                                  style: TextStyle(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      color: Colors
                                                                          .black)),
                                                            ),
                                                          ),
                                                          SizedBox(width: 25),
                                                          Expanded(
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsets.all(
                                                                      deviceWidth <
                                                                              600
                                                                          ? 10
                                                                          : 28),
                                                              child: Text(
                                                                  '${model.totalBill.toString()} RS',
                                                                  style: TextStyle(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      color: Colors
                                                                          .green)),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Row(
                                                      children: [
                                                        Expanded(
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsets.all(
                                                                    deviceWidth <
                                                                            600
                                                                        ? 10
                                                                        : 28),
                                                            child: Text(
                                                                'Wallet',
                                                                style: TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    color: Colors
                                                                        .black)),
                                                          ),
                                                        ),
                                                        SizedBox(width: 25),
                                                        Expanded(
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsets.all(
                                                                    deviceWidth <
                                                                            600
                                                                        ? 10
                                                                        : 28),
                                                            child: Text(
                                                                '-- ${_walletAmountController.text}',
                                                                style: TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    color: Colors
                                                                        .black)),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              18.0),
                                                      child: Divider(
                                                        color: Colors.amber,
                                                        height: 2,
                                                      ),
                                                    ),
                                                    Row(
                                                      children: [
                                                        Expanded(
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsets.all(
                                                                    deviceWidth <
                                                                            600
                                                                        ? 10
                                                                        : 28),
                                                            child: Text(
                                                                'Sub-Total ',
                                                                style: TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    color: Colors
                                                                            .red[
                                                                        700])),
                                                          ),
                                                        ),
                                                        SizedBox(width: 25),
                                                        Expanded(
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsets.all(
                                                                    deviceWidth <
                                                                            600
                                                                        ? 10
                                                                        : 28),
                                                            child: Text(
                                                                '${model.subtotal.toString()} RS',
                                                                style: TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    color: Colors
                                                                        .red)),
                                                          ),
                                                        ),
                                                      ],
                                                    ),

                                                    //  SizedBox(height:18),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          )),
                                          Container(

                                    /// idr main info box aye ga
                                   // alignment: Alignment.topLeft,
                                    // margin: EdgeInsets.symmetric(
                                    //     horizontal: deviceWidth < 600
                                    //         ? deviceWidth * 0.05
                                    //         : deviceWidth * 0.13),
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 0),
                                    width: deviceWidth < 650
                                        ? deviceWidth * 0.33
                                        : deviceWidth * 0.20,
                                    height: deviceWidth <= 650
                                        ? deviceHeight * 0.30
                                        : deviceHeight * 0.22,
                                    decoration: BoxDecoration(
                                      color: Color(0xffFAFBFD),
                                      borderRadius: BorderRadius.circular(20),
                                      boxShadow: [
                                        BoxShadow(
                                            offset: Offset(0, 10),
                                            blurRadius: 10,
                                            color: Color(0xff36332e))
                                      ],
                                    ),
                                    child:Padding(
                                  padding: const EdgeInsets.all(0),
                                  child: Container(
                                      width: deviceWidth < 650
                                          ? deviceWidth * 0.30
                                          : deviceWidth * 0.25,
                                      height: deviceWidth < 650
                                          ? deviceHeight * 0.40
                                          : deviceHeight * 0.25,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),

                                        border: Border.all(
                                            width: 2, color: Colors.red),
                                        // color:Colors.white54,
                                      ),
                                      child: Column(
                                        children: [
                                         // _acceptOnlinePayment(),
                                          _acceptFromWallet(),
                                          Visibility(
                                              visible: _walletTextField,
                                              child: Center(
                                                  child: TextField(
                                                maxLines: 1,
                                                keyboardType:
                                                    TextInputType.number,
                                                controller:
                                                    _walletAmountController,
                                                decoration: InputDecoration(
                                                    labelText:
                                                        'Enter Amount From Wallet'),
                                                onEditingComplete: () {
                                                  var val= _walletAmountController.text.toString();
                                                 int enterdAmount =int.parse(val);
                                                 print(enterdAmount);
if(model.singleUser!=null){
  if (model.wallet!=0 && enterdAmount <=  model.wallet) {
                                                    setState(() {
                                                    loading = true;

                                                    walletamount =
                                                        _walletAmountController
                                                            .text;
                                                    var xx =
                                                        int.parse(walletamount);
                                                    var zz = model.totalBill;
                                                    model.subtotal = zz - xx;
                                                    loading = false;
                                                  });
                                                  } 
                                                  else{
                                                                                        showDialog(
            context: context,
              builder: (BuildContext context) {
              return AlertDialog(
                title: Text('An Error Occured'),
                content:Text('Insufficent Balance') ,
                actions: [
                  FlatButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text('Okay'))
                ],
              );
            },
            );
                  
                                                  }




}
                                                  else {
                                                    showDialog(
            context: context,
              builder: (BuildContext context) {
              return AlertDialog(
                title: Text('An Error Occured'),
                content:Text('You are not logedin') ,
                actions: [
                  FlatButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text('Okay'))
                ],
              );
            },
            );
                                                  }
                                                  
                                                },
                                              )))
                                        ],
                                      )),
                                ),),
                                
                              ],
                            ),
                          ),
                          Align(
                            alignment: deviceWidth < 600
                                ? Alignment.center
                                : Alignment.bottomRight,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: Colors.grey[850],
                                ),
                                width: deviceWidth < 600
                                    ? deviceWidth * 0.50
                                    : deviceWidth * 0.15,
                                height: deviceWidth < 600
                                    ? deviceHeight * 0.05
                                    : deviceHeight * 0.10,
                                margin: EdgeInsets.only(top: 20, right: 30),
                                child: Center(
                                    child: FlatButton(
                                        
                                        child: Text('Checkout',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.yellow)),
                                        onPressed: () async {
                                          if (model.singleUser == null) {
                                            print('object');

                                            Navigator.push(context,
                                                MaterialPageRoute(
                                              builder: (BuildContext context) {
                                                return Login(
                                                    navigation: 'From Cart');
                                              },
                                            ));
                                          } else {
                                            if(walletamount.isNotEmpty){
                                              int billAmount=int.parse(walletamount);
                                              model.wallet=model.wallet-billAmount;
                                                model.deductFromUSerWallet(model.singleUser).then((value) => {
                                                      
                                                    if(value){
                                                        model.placeOrder(model.cartItems,model.providerids,model.singleUser.fireBaseID,model.totalBill,TimeOfDay.now().toString(),DateTime.now().toString())
                                                                                                              }
                                                      else{
                                                        print(value)

                                                                                                              }




                                                });
                                                //place order
                                            //navigate to my orders
                                            }
                                            else{
print('saaad in cart');
                                            }

                                          }
                                          //             //  var ff= amount*100;
                                          //             //  int fts=ff.toInt();
                                          //       // String ss=fts.toString();

                                          //                 var response = await StripeService.payWithNewCard(
                                          //         amount:ss,
                                          //          currency:'GBP',
                                          //       );

                                          //       if (response.message == 'Transaction successful') {

                                          //               print('order placed');
                                          //               showDialog(
                                          //           context: context,
                                          //           builder: (BuildContext context) {
                                          //             return AlertDialog(
                                          //               title: Text('Confirmation!',style:TextStyle(fontSize:23.0, fontWeight:FontWeight.bold,color: Colors.black )),
                                          //               content: Text('Order Has been Sucessfully placed ',style:TextStyle(fontSize:20.0, fontWeight:FontWeight.w400,color: Colors.green )),
                                          //               actions: <Widget>[
                                          //                 ScopedModelDescendant<MainModel>(
                                          //   builder: (BuildContext context, Widget child, MainModel model) {
                                          //     return  FlatButton(
                                          //                   onPressed: () =>_submitForm(model.placeOrder),
                                          //                   child: Text('Okay',style:TextStyle(fontSize:20.0, fontWeight:FontWeight.bold,color: Colors.green )),
                                          //                 );
                                          //   },
                                          // )

                                          //               ],
                                          //             );
                                          //           });

                                          //        // Navigator.pushReplacementNamed(context, '/Services');
                                          //       }
                                          //        else  {

                                          //          showDialog(
                                          //           context: context,
                                          //           builder: (BuildContext context) {
                                          //             return AlertDialog(
                                          //               title: Text('Error!',style:TextStyle(fontSize:23.0, fontWeight:FontWeight.bold,color: Colors.black )),
                                          //               content: Text('Order Has not been Sucessfully placed ',style:TextStyle(fontSize:20.0, fontWeight:FontWeight.w400,color: Colors.green )),
                                          //               actions: <Widget>[
                                          //                 ScopedModelDescendant<MainModel>(
                                          //   builder: (BuildContext context, Widget child, MainModel model) {
                                          //     return  FlatButton(
                                          //                   onPressed: () =>Navigator.pop(context),
                                          //                   child: Text('Okay',style:TextStyle(fontSize:20.0, fontWeight:FontWeight.bold,color: Colors.green )),
                                          //                 );
                                          //   },
                                          // )

                                          //               ],
                                          //             );
                                          //           });

                                          //           }
                                        })),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Container(
                            height: 50,
                            color: Colors.black,
                            width: deviceWidth,
                            child: Column(
                              children: [
                                Center(
                                    child: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 10),
                                  child: Text(
                                    'Copyright \u00a9  FreeBies',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                    ),
                                  ),
                                )),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ));
      },
    );
  }
}
