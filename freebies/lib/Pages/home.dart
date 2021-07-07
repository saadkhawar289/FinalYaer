// import '../Widgets/Cards/logout.dart';

import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:freebies/Widgets/WidgetsControllers/productWidget.dart';
import 'package:scoped_model/scoped_model.dart';
import '../Scoped-Model/mainModel.dart';

class AllProductPage extends StatefulWidget {
  final MainModel model;


  AllProductPage(this.model);

  @override
  State<StatefulWidget> createState() {
    return _AllProductPageState();
  }
}

class _AllProductPageState extends State<AllProductPage> {
  @override
  initState() {
    widget.model.fetchProducts();
//widget.model.wallet=(widget.model.singleUser.wallet) as int;
    super.initState();
  }

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
            leading: Icon(Icons.shopping_cart_rounded),
            title: Text('Cart'),
            onTap: () {
              Navigator.pushNamed(context, '/productEdit');
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.favorite),
            title: Text('Wish List'),
            onTap: () {
              Navigator.pushNamed(context, '/aboutUS');
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.pan_tool),
            title: Text('Logout'),
            onTap: () {
              Navigator.pushNamed(context, '/privacy');
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.pan_tool),
            title: Text('Admin'),
            onTap: () {
              Navigator.pushNamed(context, '/admin');
            },
          ),
          //  LogoutListTile()
        ],
      ),
    );
  }

  Widget buildButtonRow(BuildContext context, String txt) {
    final double deviceHeight = MediaQuery.of(context).size.height;

    // String text = 'Products';
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(children: [
        Container(
          margin: EdgeInsets.only(top: 30.0),
          height: 40.0,
          child: Stack(children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Text(
                txt,
                style: TextStyle(
                    fontSize: deviceHeight * 0.030,
                    fontWeight: FontWeight.bold,
                    color: Colors.yellow[700]),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                margin: EdgeInsets.only(left: 30),
                height: 7,
                color: Colors.black,
                //withOpacity(0.5),
              ),
            ),
          ]),
        ),
//                 Spacer(),
//                 FlatButton(child: Text('More',
//                 style:TextStyle(fontSize: 15.0,
//                 fontWeight:FontWeight.bold,
//                 color: Colors.white,
//                 ),
//                 ),
//                 color: Colors.black,
//                 onPressed: (){
//  Navigator.pushNamed(context, '/AlRatedSS');                  },
//                 shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(30),
//                 ),
//                 ),
      ]),
    );
  }

  Widget _buildFeaturedProductsList(BuildContext context) {
    return ScopedModelDescendant<MainModel>(
        builder: (BuildContext context, Widget child, MainModel model) {
      Widget content = Center(child: Text('No product found'));
      String typeOfCard = 'UserMode';

      if (model.allproducts.length > 0 && !model.isLoading) {
        content = Products(typeOfCard, context);
      } else if (model.isLoading) {
        content = Center(child: CircularProgressIndicator());
      }
      return RefreshIndicator(
          onRefresh: model.fetchProducts,
          child:
              content); // this is used to refresh the page by swiping down the screen
    });
  }

  Widget _buildProductsList(BuildContext context) {
    return ScopedModelDescendant<MainModel>(
        builder: (BuildContext context, Widget child, MainModel model) {
      Widget content = Center(child: Text('No product found'));
      String typeOfCard = 'zzzz';

      if (model.allproducts.length > 0 && !model.isLoading) {
        content = Products(typeOfCard, context);
      } else if (model.isLoading) {
        content = Center(child: CircularProgressIndicator());
      }
      return RefreshIndicator(
          onRefresh: model.fetchProducts,
          child:
              content); // this is used to refresh the page by swiping down the screen
    });
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
        child: Text('FreeBiees',
            style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
                color: Color(0xFFFF335C))),
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
                      Text('Entertainment'),
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
        return  Text(model.wallet==null?0.toString():model.wallet.toString(),style: TextStyle(color: Color(0xFFFF335C),fontSize: 18,fontWeight:FontWeight.bold ));
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
                      Text('Cart'),
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
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget mobileAppBar() {
    final double deviceWidth = MediaQuery.of(context).size.width;

    return AppBar(
      toolbarHeight: 120,
      backgroundColor: Colors.grey[850],
      //   backgroundColor: Color(0xff36332e),
      elevation: 0,
      //centerTitle:true ,
      title: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
        child: Text('FreeBiees',
            style: TextStyle(
                fontSize: deviceWidth * 0.045,
                fontWeight: FontWeight.bold,
                color: Color(0xFFFF335C))),
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
                      Text(
                        'Games',
                        style: TextStyle(fontSize: deviceWidth * 0.030),
                      ),
                      GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, '/AllVedios');
                          },
                          child: Icon(
                            Icons.extension_sharp,
                            color: Colors.yellow,
                          ))
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 18),
                  child: Row(
                    children: [
                      Text(
                        'Wallet',
                        style: TextStyle(fontSize: deviceWidth * 0.030),
                      ),
                      Icon(Icons.account_balance_wallet, color: Colors.yellow)
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final double deviceHeight = MediaQuery.of(context).size.height;
    final double deviceWidth = MediaQuery.of(context).size.width;

    final double targetHeight =
        deviceHeight > 700.0 ? deviceHeight * 0.45 : deviceHeight * 0.45;
//final double targetPadding = deviceWidth - targetWidth;

    //   final double targetheight= deviceHeight * 0.60;
    return Scaffold(
        backgroundColor: Colors.white,
        drawer: deviceWidth < 500 ? _buildDrawer(context) : null,
        appBar: deviceWidth < 500 ? mobileAppBar() : webAppBar(),
        body: SafeArea(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: LayoutBuilder(builder: (context, constraints) {
//                    if(constraints.maxWidth<=320){
// return Container(child: Text('data'),);
//                    }
//               else if(constraints.maxWidth<=720){
// return Container(child: Text('data222222'),);
//               }
//               else{
// return Text('fuck');
//               }
              return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 25,
                    ),
                    Center(
                        child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(28),
                        color: Colors.amber,
                      ),
                      height: deviceWidth < 650
                          ? deviceHeight * 0.20
                          : deviceHeight * 0.66,
                      width: deviceWidth * 0.75,
                      child: Carousel(
                        autoplayDuration: Duration(milliseconds: 2500),
                        //  boxFit: BoxFit.cover,
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
                              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSDT1-fmn2GJM9xT0jXf4adtqmiRVBD8iqZRQ&usqp=CAU'),
                          NetworkImage(
                              'https://mrlaptop.pk/wp-content/uploads/2019/11/HP-15-Dw0078-laptop-price-in-pakistan.jpg'),
                          NetworkImage(
                              'https://www.phoneworld.com.pk/wp-content/uploads/2017/06/Here-is-the-Complete-List-of-Laptop-Prices-in-Pakistan-2017.jpg')
                        ],
                      ),
                    )),
                    SizedBox(
                      height: 25,
                    ),
                    Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: buildButtonRow(context, 'Featured Products')
                        //Text('Featured Products', style: TextStyle(fontFamily: 'Oswald', color: Colors.amber,fontSize: deviceHeight*0.030,fontWeight:FontWeight.bold),
                        //),

                        ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: deviceWidth > 800 ? 70 : 20,
                          vertical: 50),
                      child: Container(
                        height: constraints.maxHeight >= 800
                            ? deviceHeight * 0.45
                            : deviceHeight * 0.47,
                        color: Colors.yellow[100],
                        child: Container(
                          decoration: BoxDecoration(),
                          height: 50,
                          child: _buildFeaturedProductsList(context),
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(color: Colors.white),
                      child: buildButtonRow(context, 'Product'),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: deviceWidth > 800 ? 70 : 30),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Container(
                          height: deviceWidth <= 500
                              ? deviceHeight * 0.50
                              : deviceHeight * 0.70,
                          color: Colors.grey[50],
                          width: deviceWidth,
                          child: Container(
                            decoration: BoxDecoration(
                                // border: Border.all(width: 2,),
                                // color:Colors.yellow,
                                ),
                            child: _buildProductsList(context),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 15),
                    Container(
                      height: 50,
                      color: Colors.black,
                      width: deviceWidth,
                      child: Column(
                        children: [
                          Center(
                              child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Text(
                              'Copyright \u00a9  FreeBies',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                              ),
                            ),
                          )),

                          //      Text('targetheight ''$targetHeight'.toString() ),
                          //      Text('totalheight ''$deviceHeight'.toString() ),
                          //  Text('totalwidth ''$deviceWidth'.toString())
                        ],
                      ),
                    ),
                  ]);
            }),
          ),
        ));
  }
}
