import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:freebies/Models/Vedios.dart';
import 'package:freebies/Scoped-Model/mainModel.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class YoutubeAppDemo extends StatefulWidget {
  Vedios vedio;
  @override
  _YoutubeAppDemoState createState() => _YoutubeAppDemoState();
}

class _YoutubeAppDemoState extends State<YoutubeAppDemo> {
  // ignore: close_sinks
  YoutubePlayerController _controller;
  final GlobalKey<ScaffoldState> _scaffoldState =
      new GlobalKey<ScaffoldState>();
  bool loading = false;
  bool vis = false;

  @override
  void initState() {
    super.initState();
    print(vis);
    _controller = YoutubePlayerController(
        initialVideoId: 'aKnjibWoyvc',
        params: const YoutubePlayerParams(
          enableJavaScript: true,
          autoPlay: true,
          showVideoAnnotations: false,
          showControls: false,
          strictRelatedVideos: true,
          showFullscreenButton: false,
          desktopMode: true,
          privacyEnhanced: true,

          // useHybridComposition: true,
        ))
      ..listen((event, {sss}) {
        if (event.position.inSeconds == 5 && mounted == true) {
          setState(() {
            vis = true;
       
            
          });
        }
      });
  }

  Future<bool> xx() async {
    var ss = true;
    return ss;
  }

  void ff() {
    Timer(Duration(seconds: 3), () {
      print('done');
      setState(() {
        vis = false;
        loading = false;
        _controller.drain();
        _scaffoldState.currentState.showSnackBar(SnackBar(
            elevation: 50,
            duration: Duration(seconds: 3),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
            )),
            backgroundColor: Colors.amber,
            content: Container(
              child: Row(
                children: [
                  Center(
                    child: Icon(
                      Icons.thumb_up,
                      size: 25,
                      color: Colors.blue[900],
                    ),
                  ),
                  SizedBox(
                    width: 35,
                  ),
                  Text('Deposite Successfull',
                      style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.normal,
                          color: Colors.white)),
                ],
              ),
              height: 30,
              width: 70,
            )));
      });
    });
  }

  Widget withDrawButton() {
    return Visibility(
      // maintainState: true,
      replacement: Padding(
        padding: const EdgeInsets.all(28.0),
        child: Container(),
      ),
      visible: vis,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30),
        child: Align(
            alignment: Alignment.topCenter,
            child: GestureDetector(
              onTap:(){},
              child: loading == false
              
                  ?      ScopedModelDescendant<MainModel>(
      builder: (BuildContext context, Widget child, MainModel model) {
        return model.isLoading==true?CircularProgressIndicator(): FloatingActionButton(
                      splashColor: Colors.green[700],
                      backgroundColor: Colors.red[700],
                      elevation: 100,
                      focusElevation: 150,
                      hoverColor: Colors.orange,
                      onPressed: () {
                       // model.ss(5);
                        
                            model.depositeToUserWallet(model.singleUser,sourceOfMoney: 'Vedio Points').then((value) => {
                            Navigator.pushReplacementNamed(context, '/AllVedios')
                         

                                              });
                        
                        // setState(() {
                        //   loading = true;
                        //   xx().then((_) => ff());
                        // });
                      },
                      child: Icon(
                        Icons.monetization_on_outlined,
                        size: 30,
                        color: Colors.yellow,
                      ),
                    );
                
      },
    )  : CircularProgressIndicator(),
                  
                  
                  
                  
                  
                  
                  
                  
                  
                  
                  
                  
                  
                  
                  
                  
                  
            )),
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
        return  Text(model.wallet==null?'':model.wallet.toString());
      },
    ),
                     
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

  Widget contnt() {
    final double deviceWidth = MediaQuery.of(context).size.width;
    const player = YoutubePlayerIFrame(
      aspectRatio: 16 / 9,
    );
    return YoutubePlayerControllerProvider(
      // Passing controller to widgets below.
      controller: _controller,
      child: Scaffold(
        key: _scaffoldState,
        appBar: deviceWidth > 500
            ?webAppBar()
            : AppBar(
          toolbarHeight: 120,
       backgroundColor:Colors.grey[850],
       //   backgroundColor: Color(0xff36332e),
          elevation: 0,
          //centerTitle:true ,
          title: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 30),
            child: Text('FreeBiees', 
            style:TextStyle(fontSize:deviceWidth*0.045, fontWeight:FontWeight.bold,color: Color(0xFFFF335C) )),
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
                Text('Games',style: TextStyle(fontSize:deviceWidth*0.030),),
                 GestureDetector(onTap: (){
                  Navigator.pushNamed(context, '/entertainment');
                }, child: Icon(Icons.extension_sharp,color:Colors.yellow  ,))
            ],) ,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 18),
            child:Row(children: [
                Text('Wallet',style: TextStyle(fontSize:deviceWidth*0.030),),
                Icon(Icons.account_balance_wallet,color:Colors.yellow )
            ],) ,
          ),
       
         
                  ],
                ),
              ),
            ),
        
          ],
        ),
        body: LayoutBuilder(
          builder: (context, constraints) {
            if (kIsWeb && constraints.maxWidth > 800) {
              return SingleChildScrollView(
                child: Column(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: player,
                      height: MediaQuery.of(context).size.height * 0.65,
                      width: MediaQuery.of(context).size.width,
                    ),
                    withDrawButton()
                  ],
                ),
              );
            }
            return ListView(
              children: [player, withDrawButton()],
            );
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Widget pageContent = contnt();
    return pageContent;
  }
}
