import 'dart:async';

import 'package:circular_countdown_timer/circular_countdown_timer.dart';

import 'package:flutter/material.dart';
import 'package:freebies/Models/Games.dart';
import 'package:scoped_model/scoped_model.dart';
import '../Scoped-Model/mainModel.dart';
import 'package:web_browser/web_browser.dart';

class GameView extends StatefulWidget {
 final Games game;
  GameView(this.game);
  @override
  State<StatefulWidget> createState() {
    return _GameViewPageState();
  }
}

class _GameViewPageState extends State<GameView> {
  CountDownController controller = CountDownController();
  final GlobalKey<ScaffoldState> _scaffoldState =
      new GlobalKey<ScaffoldState>();
  bool vis = false;
  @override
  initState() {
    //widget.model.allProvidersForAdmin();
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
                color: Colors.red[900])),
      ),
      actions: <Widget>[
        Container(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                //       Text(targetHeight.toString()),
                // SizedBox(width: 10,),
                //   sText(deviceHeight.toString()),
                //   SizedBox(width: 10,),
                //   Text(deviceWidth.toString())
                Padding(
                  padding: const EdgeInsets.only(right: 58),
                  child: Row(
                    children: [
                      Text('Games'),
                      GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, '/vedios');
                          },
                          child: Icon(
                            Icons.games,
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
                            Navigator.pushNamed(context, '/games');
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
                      Icon(Icons.supervised_user_circle, color: Colors.yellow)
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
                fontSize: 20.0,
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
                      Text('Games'),
                      GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, '/vedios');
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
    );
  }



  @override
  Widget build(BuildContext context) {
    final double deviceWidth = MediaQuery.of(context).size.width;
    WebBrowserIFrameSettings iframeSettings = WebBrowserIFrameSettings(

    );
    WebBrowserInteractionSettings interactionSettings =
        WebBrowserInteractionSettings(
      topBar: Container(child: Container()),
      bottomBar: Container(child: Container()),
    );

    return ScopedModelDescendant<MainModel>(
      builder: (BuildContext context, Widget child, MainModel model) {
        return Scaffold(
          backgroundColor: Colors.black,
      
            key: _scaffoldState,
            appBar:  AppBar(
        elevation: 0,
        backgroundColor:Colors.black,
        toolbarHeight: 120,
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
        // centerTitle: true,
      ),
            body: GestureDetector(
              onTap: () {
                print('saad');
              },
              child: WebBrowser(
                javascriptEnabled: true,
                iframeSettings: iframeSettings,
                interactionSettings: interactionSettings,
                initialUrl:widget.game.link,//'https://games.cdn.famobi.com/html5games/a/archery-world-tour/v460/?fg_domain=play.famobi.com&fg_aid=A1000-1&fg_uid=ebcb987a-3fd0-4b4a-bae6-f456fff9cac3&fg_pid=4638e320-4444-4514-81c4-d80a8c662371&fg_beat=694&original_ref=https%3A%2F%2Fhtml5games.com%2F', //'https://cdn.htmlgames.com/AlienInvaders2/',//widget.model.games.link,
                onError: (error) => print(error),
                onCreated: (contr) {
                  Timer(Duration(seconds: 8), () {
                    setState(() {
                      vis = true;
                    });
                  });
                },
              ),
            ),
            floatingActionButton: Visibility(
              visible: vis,
              child: Align(
                alignment: Alignment.bottomLeft,
                child: CircularCountDownTimer(
                  duration: Duration(minutes: 10).inMinutes,
                  initialDuration: 0,
                  controller: controller,
                  width: MediaQuery.of(context).size.width * 0.10,
                  height: MediaQuery.of(context).size.height * 0.10,
                  ringColor: Colors.grey[300],
                  ringGradient: null,
                  fillColor: Colors.red[700],
                  fillGradient: null,
                  backgroundColor: Colors.yellow,
                  backgroundGradient: null,
                  strokeWidth: 10.0,
                  strokeCap: StrokeCap.round,
                  textStyle: TextStyle(
                      fontSize: deviceWidth <= 500
                          ? deviceWidth * 0.025
                          : deviceWidth * 0.010,
                      color: Colors.red[700],
                      fontWeight: FontWeight.bold),
                  textFormat: CountdownTextFormat.MM_SS,
                  isReverse: false,
                  isReverseAnimation: false,
                  isTimerTextShown: true,
                  autoStart: true,
                  onStart: () {
                    print('Countdown Started');
                  },
                  onComplete: () async {
                    await model
                        .depositeToUserWallet(model.singleUser,
                            sourceOfMoney: 'Games Point')
                        .then((value) => {
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
                                  )))
                            });
                    //  Stack(children: [],);
                  },
                ),
              ),
            ));
      },
    );
  }
}
