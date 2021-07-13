import 'package:flutter/material.dart';
import 'package:freebies/Models/Vedios.dart';
import 'package:freebies/Pages/addvedios.dart';
import 'package:freebies/Pages/video_player_widget.dart';
import 'package:freebies/Scoped-Model/mainModel.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';




class VedioCard extends StatelessWidget {
  final Vedios vedio;
  final int vedioIndex;

  VedioCard(
    this.vedio,
    this.vedioIndex,
  );


  Widget _buildTitlePriceRow() {
    return Container(
      padding: EdgeInsets.only(top: 10.0),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
              child: Row(
         // mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
              Align(
                alignment: Alignment.topRight,
                child: Center(child: Text(vedio.tittle))),
            //   SizedBox(
            //   width: 90.0,
            // ),
              //  Text(''),
          ],
        ),
      ),
    );
  }
  DecorationImage _buildServiceBoxImage() {
    return DecorationImage(
      fit: BoxFit.fill,
      colorFilter:
          ColorFilter.mode(Colors.black.withOpacity(0.4), BlendMode.screen),
      image:
      AssetImage('assets/vedio.jpg')
      

    );
  }
Future<bool> _settProviderID(String id) async {
    final pref = await SharedPreferences
        .getInstance(); //this line allow us to get the access to the shared preffrence(3rd party PACKAGE)  which helps us in getting or allow us a storage on the device
    pref.setString('pID', id);
    return true;
  }
 

  @override
  Widget build(BuildContext context) {
    final double deviceWidth = MediaQuery.of(context)
        .size
        .width; //this line is used for getting the device size and width and save it into variable
        Size size = MediaQuery.of(context).size;

    final double targetWidth = deviceWidth > 550.0
        ? 500.0
        : deviceWidth *
            0.99; 
    return GestureDetector(
      onTap: (){
        var id= vedio.id;
        _settProviderID(id);
        print(id);
       Navigator.of(context).push(MaterialPageRoute(
            builder: (BuildContext contetxt) => YoutubeAppDemo(vedio)));
      },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(

  shadowColor: Colors.amber,elevation: 30,
        child: Column(
            children: <Widget>[
              
              Stack(children: [
                Container(
                  height: size.height * 0.20,
                  width: size.width * 0.99,
                  decoration: BoxDecoration(
                    image:_buildServiceBoxImage()
                  ),
                ),
              //  Positioned(
              //    top: 145,
              //    left: 260,
              //    child: Align(alignment: Alignment.topCenter,
              //               child: SmoothStarRating(
              //       color: Colors.amber,
              //       rating: service.rating,
              //       isReadOnly: true,
              //     ),
                  
                  
              //   ),)
                 
              ],
                            
              ),
              Center(child: _buildTitlePriceRow()),
              
//SizedBox(height: 20,),
        //       Padding(
        //         padding: const EdgeInsets.symmetric(horizontal: 100),
        //         child: Row(children: [ 
                  
        // //              FlatButton(onPressed: (){
        // //                   var id= service.providerID;
        // // _settProviderID(id);
        // // print(id);
        // // Navigator.pushNamed(context, '/ttt');
        // //              },child: Text('View All Providers ',style: TextStyle(fontFamily: 'Oswald', color: Color(0xff36332e),fontSize: 14,fontWeight:FontWeight.normal)),),
        //         SizedBox(width: 20,),
        //         Icon(Icons.person,size: 30,)
        //         ],),
                
        //       ),
         
             // Container(height: 20,)
            ],
        ),
      ),
          ),
    );
  }
}
