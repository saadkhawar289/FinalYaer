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
    if(widget.model.singleUser == null){
      print('simple products');
 widget.model.fetchWhishlitProducts();

    }
else{
        print('wishlist products');
widget.model.fetchProducts();
}

   
//widget.model.wallet=int.parse(widget.model.singleUser.wallet) ;
    super.initState();
  }
TextEditingController _emailController= TextEditingController();
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
                    color: Colors.yellow),
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
        Image(image:AssetImage('assets/Untitled.png',),height: MediaQuery.of(context).size.height*0.12,width:MediaQuery.of(context).size.width*0.05 ,fit:BoxFit.fill ,),
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
        drawer: deviceWidth <= 650 ? _buildDrawer(context) : null,
        appBar: deviceWidth < 650 ? mobileAppBar() : webAppBar(),
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
                    Center(
                      child: Padding(
                        padding: EdgeInsets.only(top: 30,left: MediaQuery.of(context).size.width*0.30,right: MediaQuery.of(context).size.width*0.30,),
                        child: Container(
                          child: TextFormField(
      decoration: InputDecoration(
        labelText: "Search",
        prefixIcon: const Icon(
          Icons.search,
          color: Colors.green,
        ),
        fillColor: Colors.white,
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Color(0xff36332e),
            width: 4.0,
          ),
          borderRadius: BorderRadius.circular(25.0),
        ),
      ),

      keyboardType: TextInputType.emailAddress,
      controller: _emailController,
      // ignore: missing_return
      validator: (String value) {
        if (_emailController.text.isEmpty ||
            !RegExp(r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
                .hasMatch(value)) {
          return 'Please enter a valid email';
        }
      },
      onSaved: (String value) {
      //  _formData['email'] = value;
      },
    )
                        
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Center(
                        child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(28),
                        //color: Colors.amber,
                      ),
                      height: deviceWidth < 650
                          ? deviceHeight * 0.20
                          : deviceHeight * 0.45,
                      width: deviceWidth * 0.85,
                      child: Carousel(
                      //  autoplayDuration: Duration(milliseconds: 2500),
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
                               'https://mir-s3-cdn-cf.behance.net/project_modules/1400/8951ab101866185.5f294eb94154d.png',scale: 2),
                              
                              NetworkImage('https://i.pinimg.com/originals/4e/02/b9/4e02b987da9d2c3a8c27abc9afb3746a.jpg')
                              
                          // NetworkImage(
                          //     'data:image/jpeg;base64,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     X,qcx0ya+u4 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'),
                          // NetworkImage(
                          //     'https://mrlaptop.pk/wp-content/uploads/2019/11/HP-15-Dw0078-laptop-price-in-pakistan.jpg'),
                          //  NetworkImage(
                          //      'https://www.phoneworld.com.pk/wp-content/uploads/2017/06/Here-is-the-Complete-List-of-Laptop-Prices-in-Pakistan-2017.jpg')
                        ],
                      ),
                    )),
                    SizedBox(
                      height: 25,
                    ),
                    Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: buildButtonRow(context, 'FEATURE PRODUCTS')
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
                        color: Colors.grey[400],
                        child: Container(
                          decoration: BoxDecoration(),
                          height: 50,
                          child: _buildFeaturedProductsList(context),
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(color: Colors.white),
                      child: buildButtonRow(context, 'PRODUCTS'),
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
                          color: Colors.grey[400],
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
