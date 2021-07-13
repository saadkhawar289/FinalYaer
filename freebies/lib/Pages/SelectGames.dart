




import 'package:flutter/material.dart';
import 'package:freebies/Widgets/WidgetsControllers/GameController.dart';
import 'package:freebies/Widgets/WidgetsControllers/productWidget.dart';
import 'package:scoped_model/scoped_model.dart';
import '../Scoped-Model/mainModel.dart';



class GameSelection extends StatefulWidget {
final MainModel model;

  GameSelection(this.model);

@override
  State<StatefulWidget> createState() {
    
    return _GameSelectionPageState();
  }
}
class _GameSelectionPageState extends State <GameSelection>{
@override
initState(){
  widget.model.fetchGames();


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
Widget _buildFeaturedProductsList(BuildContext context){

    return ScopedModelDescendant<MainModel>(builder: (BuildContext context, Widget child, MainModel model){
      Widget content = Center(child:Text('No Games Available'));
      

      if(model.allGames.length > 0 && !model.isLoading) {
          content = GameController();
      }
      else if(model.isLoading){
        content = Center(child:CircularProgressIndicator());

      }
      return RefreshIndicator( onRefresh:model.fetchProducts,child: content);// this is used to refresh the page by swiping down the screen
    }
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
//   @override
//   Widget build(BuildContext context) {
//  final double deviceHeight = MediaQuery.of(context).size.height;
//  final double deviceWidth = MediaQuery.of(context).size.width;

// final double  targetHeight = deviceHeight > 700.0
//         ? deviceHeight *
//             0.45
//         : deviceHeight *
//             0.45;  
// //final double targetPadding = deviceWidth - targetWidth;


//      //   final double targetheight= deviceHeight * 0.60;
//     return Scaffold(
//        backgroundColor: Colors.white,
     

//         appBar:deviceWidth < 500 ? mobileAppBar(): webAppBar(),
        
//          body:SafeArea(
//                     child: SingleChildScrollView(
//             scrollDirection: Axis.vertical,
//                child: LayoutBuilder(
//                  builder: (context, constraints) {

//                    return Column(crossAxisAlignment:CrossAxisAlignment.start, 
//                    children:[
                   
              
//                    Padding(
//                      padding:  EdgeInsets.symmetric(horizontal: deviceWidth > 800? 70: 30,vertical: 50),
//                      child: Container(
//                        height:deviceHeight >=800 ? deviceHeight*0.60:deviceHeight*0.47,
//                       color: Colors.grey[50],
//                        child:Container(decoration: BoxDecoration(
                         
//                         ),
//                       height: 50,
//                        child:_buildFeaturedProductsList(context),
//                        ),
//                      ),
//                    ),
                   
                    
//                    Container(
                   
//                      height: 50,color: Colors.black ,width: deviceWidth,  child: Column(children: [

                       
//                           Center(child: Padding(
//                             padding: const EdgeInsets.symmetric(vertical: 10),
//                             child: Text('Copyright \u00a9  FreeBies',style: TextStyle(color: Colors.white,fontSize: 18,),),
//                           )),
               
//                    ],),),
                 
//               ]
//              );
//                  }
//                ),
           
//            ),
//          )
//          );
           
//   }


}}




