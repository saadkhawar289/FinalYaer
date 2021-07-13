


import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:flutter/services.dart';
import 'package:freebies/Pages/VendorLogin.dart';
import 'package:freebies/Pages/addGames.dart';
import 'package:freebies/Pages/addvedios.dart';
import 'package:freebies/Widgets/Helpers/webUploadImage.dart';

import 'package:scoped_model/scoped_model.dart';

import './Scoped-Model/mainModel.dart';
import 'package:splashscreen/splashscreen.dart';

import 'Pages/AddUpdateProduct.dart';
import 'Pages/Admin.dart';
import 'Pages/Cart.dart';
import 'Pages/Entertainment.dart';
import 'Pages/Login.dart';
import 'Pages/NotVendorScreen.dart';
import 'Pages/PendingVerfication.dart';
import 'Pages/SelectGames.dart';
import 'Pages/SelectVedio.dart';
import 'Pages/SingleProduct.dart';
import 'Pages/UserOrders.dart';
import 'Pages/VendorControll.dart';
import 'Pages/VendorDashBoard.dart';
import 'Pages/editProfile.dart';
import 'Pages/gameView.dart';
import 'Pages/home.dart';
import 'Pages/vendorOrder.dart';
import 'Pages/video_player_widget.dart';
import 'Widgets/Helpers/mobileUploadImage.dart';


void main()  {
  WidgetsFlutterBinding.ensureInitialized();
  // Firebase.initializedApp(); 
     runApp(MyApp());
   }
   


class MyApp extends StatefulWidget {
   
  @override 
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final MainModel _model = MainModel();
   @override
  void initState() {
    // _model.fetchPic();
    // _model.autoAuthenticate();
    // _model.userSubject.listen((bool isAuthenticate) {
    //   setState(() {
    //     _isAuthenticated = isAuthenticate;
    //   });
    // });

    super.initState();
  }
// Future<Widget> loadFromFuture() async {
  
  

//   setState(() {
  
//   });
//      return Future.value(new AuthPage(_model));
//   }

  @override
  Widget build(BuildContext context) {
  
    double sizeee =120.0;
    return ScopedModel<MainModel>(
        model: _model,   
        child: MaterialApp(
          theme: ThemeData(
            backgroundColor: Colors.black,
            brightness: Brightness.light,
            primarySwatch: Colors.indigo, 
            buttonColor: Colors.red,
            visualDensity: VisualDensity.adaptivePlatformDensity,
                       
          ),
          debugShowCheckedModeBanner: false,
           home:SplashScreen(
             seconds: 5 ,
    //          title:   Text(
    //   'FreeBies',
    //   style: TextStyle(
    //     fontSize: 45,
    //     foreground: Paint()
    //       ..style = PaintingStyle.stroke
    //       ..strokeWidth = 3.1
    //       ..color =Color(0xFFFF335C),
    //   ),
    // ),
            // child: Text('ezentu',style:TextStyle(
            //          fontSize: 50.0, fontWeight: FontWeight.bold, color: Colors.black,) ,),
          
             navigateAfterSeconds:AllProductPage(_model),
           // navigateAfterFuture:  loadFromFuture(),
          photoSize: sizeee,
             useLoader: true,
            
             image: new Image.asset('assets/logoo.jpeg'),
             backgroundColor: Colors.white,
      styleTextUnderTheLoader: new TextStyle(),
     
      loadingText: Text('Loading...',style:TextStyle(fontSize: 20.0, 
                            fontWeight:FontWeight.bold,
                            color:  Colors.black
                            )),
      onClick: ()=>{
        setState(() {
          
        sizeee=10.0;
      
        print('size reduce');
  })
      },
      loaderColor: Colors.green[700],
      
           
           ) , 
          routes: {
          '/homes': (BuildContext context) =>AllProductPage(_model),
          '/auth': (BuildContext context) =>Login(),

          '/productEdit': (BuildContext context) =>ProductEditPage(),
          '/VendorLogin': (BuildContext context) =>VendorLogin(_model),
          '/cart': (BuildContext context) =>Cart(_model),
        //  '/vedios':(BuildContext context) =>YoutubeAppDemo(),
         '/entertainment':(BuildContext context) => Entertainment(_model),
       '/admin' :(BuildContext context) => AdminControll(_model),
       '/AllVedios' :(BuildContext context) =>AllVedios(_model),
       '/AllGames' :(BuildContext context) =>GameSelection(_model),
       '/providerOrders':(BuildContext context) =>VendorControll(_model),
      '/notVendor':(BuildContext context) => NotVendorScreen(),
      '/PendingVerification':(BuildContext context) =>PendingVerification(),
      '/chnageProfile':(BuildContext context) =>ADDProfile(_model),
      '/UserDashBoard':(BuildContext context) =>UserDashboard(_model),
     //'/gameview':(BuildContext context) => GameView()
     
        
          },
  //          onGenerateRoute: (RouteSettings settings){              //used for name routes which have parametrers or variables in creating them
      
     
  //       final List<String> pathElements = settings.name.split('/');

  //       if(pathElements[0] != ''){

  //         return null;


  //       }

  //     if(pathElements[1] == 'Profile'){

  //     final String providerName = (pathElements[2]) ;
  //     //final String providerId=(pathElements[3]);
  //     //print(providerId);
  //     // final ServiceProviders providr = _model.allServiceProviders.firstWhere((ServiceProviders pro) {

  //     //   return pro.name == providerName;
  //     // });
  //     //   return MaterialPageRoute<bool>(
  //     //                 builder:(BuildContext contetxt) => Profile(_model,providr),
                    
        
  //     //                 );


  //     // }
  //     //   return null;
  //     // }
          
      
  
  
  // }
  
  //          }
           ));
  

  }}