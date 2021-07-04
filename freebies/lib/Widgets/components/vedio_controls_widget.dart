// import 'package:flutter/material.dart';
// import 'package:video_player/video_player.dart';

// class VideoControlsWidget extends StatelessWidget {
//   final VideoPlayerController controller;

//   const VideoControlsWidget({
//     @required this.controller,
//     Key key,
//   }) : super(key: key);

//   void saad() {
//     var presntPostion = controller.value.position.inSeconds;
//     var desirePostion = Duration(seconds: 4).inSeconds;
//     if (presntPostion == desirePostion) {
//       print('$presntPostion .. Cash Deposit');
//     } else {}
//   }

//   @override
//   Widget build(BuildContext context) {
//     bool vis = false;

//     return Stack(
//       children: <Widget>[
//         AnimatedSwitcher(
//           duration: Duration(milliseconds: 50),
//           reverseDuration: Duration(milliseconds: 200),
//           child: controller.value.isPlaying
//               ? SizedBox.shrink()
//               : Container(
//                   color: Colors.black,
//                   child: Center(
//                     child: Icon(
//                       Icons.play_arrow,
//                       color: Colors.green,
//                       size: 100.0,
//                     ),
//                   ),
//                 ),
//         ),
//         GestureDetector(
//           onTap: () {
//             if (controller.value.isPlaying) {
//               print(controller.value.position.inSeconds);
//               controller.pause();
//             } else {
//               controller.play();
//  controller.addListener(saad);

//             }

//             // controller.value.isPlaying
//             //     ? controller.pause()
//             //     : controller.play();
//           },
//         ),
//         GestureDetector(
//             onTap: () {
//               print('cash Deposited');
//              // Navigator.pop(context);
//             },
//             child: Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 50,vertical: 70),
//               child: Visibility(
//                 child:FloatingActionButton(onPressed: (){
//                   print('Credit');
                  
//                 },
//                 child: Icon(Icons.attach_money_rounded) ,
//                 focusColor: Colors.green,

//                 ),    //Text('Credit',style: TextStyle(color: Colors.green,fontSize: 25,fontStyle: FontStyle.normal),),
//                 visible: controller.value.position.inSeconds >= 4 ? true : false,
//               ),
//             ))
//       ],
//     );
//   }
// }
