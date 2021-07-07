import 'package:flutter/material.dart';

class Entertainment extends StatefulWidget {
  @override
  _IntertainmentState createState() => _IntertainmentState();
}

class _IntertainmentState extends State<Entertainment> {
  Widget mobilepageContent(BuildContext context) {

  final double deviceWidth = MediaQuery.of(context).size.width;
    final double deviceHeight = MediaQuery.of(context).size.height;


    return SingleChildScrollView(
          child: Column(
        children: [
         Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                          width: 2,
                          color: Colors.red,
                        ),
                        color: Colors.white54,
                        image: _buildGameBoxImage()),
                    width: deviceWidth * 0.99,
                    height: deviceHeight * 0.50,
                    child: Center(
                        child: FlatButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/AllGames');
                      },
                      child: Text(
                        'Games',
                        style: TextStyle(
                          fontSize: 45,
                          foreground: Paint()
                            ..style = PaintingStyle.stroke
                            ..strokeWidth = 3.1
                            ..color = Color(0xFFFF335C),
                        ),
                      ),
                      hoverColor: Colors.amber,
                    )),
                  ),
                ),
              ),
          Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                          width: 2,
                          color: Colors.red,
                        ),
                        color: Colors.white54,
                        image: _buildVedioBoxImage()),
                   width: deviceWidth * 0.99,
                    height: deviceHeight * 0.50,
                    child: Center(
                        child: FlatButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/AllVedios');
                      },
                      child: Text(
                        'Vedios',
                        style: TextStyle(
                            fontSize: 45,
                            foreground: Paint()
                              ..style = PaintingStyle.stroke
                              ..strokeWidth = 3.1
                              ..color = Color(0xFFFF335C),),
                      ),
                      hoverColor: Colors.amber,
                    )),
                  ),
                ),
              ),
        ],
      ),
    );
  }

  Widget webPageContent(BuildContext context) {
    final double deviceWidth = MediaQuery.of(context).size.width;
    final double deviceHeight = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                          width: 2,
                          color: Colors.red,
                        ),
                        color: Colors.white54,
                        image: _buildGameBoxImage()),
                    width: deviceWidth * 0.49,
                    height: deviceHeight * 0.75,
                    child: Center(
                        child: FlatButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/AllGames');
                      },
                      child: Text(
                        'Games',
                        style: TextStyle(
                          fontSize: 45,
                          foreground: Paint()
                            ..style = PaintingStyle.stroke
                            ..strokeWidth = 3.1
                            ..color = Color(0xFFFF335C),
                        ),
                      ),
                      hoverColor: Colors.amber,
                    )),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                          width: 2,
                          color: Colors.red,
                        ),
                        color: Colors.white54,
                        image: _buildVedioBoxImage()),
                    width: deviceWidth * 0.49,
                    height: deviceHeight * 0.75,
                    child: Center(
                        child: FlatButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/AllVedios');
                      },
                      child: Text(
                        'Vedios',
                        style: TextStyle(
                            fontSize: 45,
                            foreground: Paint()
                              ..style = PaintingStyle.stroke
                              ..strokeWidth = 3.1
                              ..color = Color(0xFFFF335C),),
                      ),
                      hoverColor: Colors.amber,
                    )),
                  ),
                ),
              ),
            ],
          ),
         
                    SizedBox(height: 10,),
                   Container(
                   
                     height: 50,color: Colors.black ,width: deviceWidth,  child: Column(children: [

                       
                          Center(child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Text('Copyright \u00a9  FreeBies',style: TextStyle(color: Colors.white,fontSize: 18,),),
                          )),
                           
                         
                  
                  //      Text('targetheight ''$targetHeight'.toString() ),
                  //      Text('totalheight ''$deviceHeight'.toString() ),
                  //  Text('totalwidth ''$deviceWidth'.toString())
                   ],),),
        ],
      ),
    );
  }

  DecorationImage _buildGameBoxImage() {
    return DecorationImage(
        fit: BoxFit.cover,
        colorFilter:
            ColorFilter.mode(Colors.black.withOpacity(0.4), BlendMode.screen),
        image: AssetImage('assets/games.jpg'));
  }

  DecorationImage _buildVedioBoxImage() {
    return DecorationImage(
        fit: BoxFit.cover,
        colorFilter:
            ColorFilter.mode(Colors.black.withOpacity(0.4), BlendMode.screen),
        image: AssetImage('assets/vedio.jpg'));
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
                //   Text(deviceHeight.toString()),
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
                      GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, '/entertainment');
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
        );
  }

  @override
  Widget build(BuildContext context) {
    final double deviceWidth = MediaQuery.of(context).size.width;
    


    return Scaffold(
      appBar: deviceWidth < 500 ? mobileAppBar() : webAppBar(),
      body: SafeArea(child: LayoutBuilder(builder: (context, constraints) {
        if (constraints.maxWidth <= 600) {
          return mobilepageContent(context);
        } else if (constraints.maxWidth <= 720) {
          return mobilepageContent(context);
        } else {
          return webPageContent(context);
        }
      })),
    );
  }
}
