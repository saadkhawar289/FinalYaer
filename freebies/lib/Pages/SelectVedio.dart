import 'package:flutter/material.dart';
import 'package:freebies/Scoped-Model/mainModel.dart';
import 'package:freebies/Widgets/WidgetsControllers/VedioWidget.dart';
import 'package:scoped_model/scoped_model.dart';

class AllVedios extends StatefulWidget {
 final MainModel model;

AllVedios(this.model);
  @override
  _AllVediosState createState() => _AllVediosState();
}

class _AllVediosState extends State<AllVedios> {

@override
initState() {
    widget.model.fetchVedios();

    super.initState();
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
                      Text('Wallet'),
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
                      Text('SIGN IN'),
                      GestureDetector(
                          onTap: () {
                            //   Navigator.pushNamed(context, '/entertainment');
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

Widget _buildFeaturedProductsList(BuildContext context) {
    return ScopedModelDescendant<MainModel>(
        builder: (BuildContext context, Widget child, MainModel model) {
      Widget content = Center(child: Text('No product found'));
     

      if (model.allvedios.length > 0 && !model.isLoading) {
        content = VedioController();
      } else if (model.isLoading) {
        content = Center(child: CircularProgressIndicator());
      }
      return RefreshIndicator(
          onRefresh: model.fetchProducts,
          child:
              content); // this is used to refresh the page by swiping down the screen
    });
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



  @override
  Widget build(BuildContext context) {
     final double deviceHeight = MediaQuery.of(context).size.height;
    final double deviceWidth = MediaQuery.of(context).size.width;

    final double targetHeight =
        deviceHeight > 700.0 ? deviceHeight * 0.45 : deviceHeight * 0.45;
    return Scaffold(
      drawer: deviceWidth < 500 ? _buildDrawer(context) : null,
        appBar: deviceWidth < 500 ? mobileAppBar() : webAppBar(),
      body: Padding(
        padding:  EdgeInsets.all(MediaQuery.of(context).size.width*0.02),
        child: Container(child: _buildFeaturedProductsList(context)),
      ),
    );
  }
}