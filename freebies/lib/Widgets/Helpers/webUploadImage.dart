


// // import 'dart:html';


// import 'dart:html';

// import 'package:firebase_storage/firebase_storage.dart';

// import 'package:firebase/firebase.dart'as fb;
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';

// class UploadImage extends StatefulWidget {
//   @override
//   State<StatefulWidget> createState() {
//     return _UploadImageState();
//   }
// }

// class _UploadImageState extends State<UploadImage> {
// String imgurl;
//  // File _imageFile;
 
  

//    DecorationImage _buildServiceBoxImage() {
//     return DecorationImage(
      
//       fit: BoxFit.cover,
//       colorFilter:
//           ColorFilter.mode(Colors.black.withOpacity(0.4), BlendMode.screen),
//       image: 
//       AssetImage('assets/logoo.jpeg')
      

//     );
//   }


// void upload()async{
  

//   if(kIsWeb){
//     InputElement uploadInput = FileUploadInputElement()..accept = 'image/*';
//   uploadInput.click();

//   uploadInput.onChange.listen((event) {
//     final file = uploadInput.files.first;
  
//     final reader = FileReader();
//     reader.readAsDataUrl(file);
//     reader.onLoadEnd.listen((event) async {
//        String filepath='images/${DateTime.now()}.png';

//    var res = await   fb
//           .storage()
//           .refFromURL('gs://freebies-cf2cd.appspot.com/')
//           .child(filepath)
//           .put(file).future.whenComplete(() async {
//             print('done');
//           });
//   var url=await res.ref.getDownloadURL();
//    // print(url);
//     setState(() {
//       imgurl=url.toString();
//     });
//       Navigator.pop(context);
//     });
//   });

//   }

  
    
    
// }








//   void _openImagePicker(BuildContext context) {
    
//     showModalBottomSheet(
//         context: context,
//         builder: (BuildContext context) {
//           return Container(
//             height: 150.0,
//             padding: EdgeInsets.all(10.0),
//             child: Column(children: [
//               Text(
//                 'Pick an Image',
//                 style: TextStyle(fontWeight: FontWeight.bold),
//               ),
//               SizedBox(
//                 height: 10.0,
//               ),
//               FlatButton(
//                 textColor: Theme.of(context).primaryColor,
//                 child: Text('Use Camera'),
//                 onPressed: () {
               
//                  upload();
//                 },
//               ),
//               FlatButton(
//                 textColor: Theme.of(context).primaryColor,
//                 child: Text('Use Gallery'),
//                 onPressed: () {
                  
//                 //  upload(context,ImageSource.gallery);
//                 },
//               )
//             ]),
//           );
//         }
//         );
//   }

//   @override
//   Widget build(BuildContext context) {

//     bool visibilty=true;
//     final buttonColor = Theme.of(context).primaryColor;
//     return SingleChildScrollView(
//       scrollDirection: Axis.vertical,
//           child: Column(
//         children: <Widget>[
//           SizedBox(height: 10,),
//           Container(decoration: BoxDecoration(borderRadius: BorderRadiusDirectional.circular(80)),
//           child:imgurl == null
//               ? Container(
//                   height: 160,
//                   width: 165,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(15),
//                      border: Border.all(width: 2,),
//                      image: _buildServiceBoxImage(),
//                   ),
                  
//               )
//               : Image.network(imgurl)
//           ),
//           Visibility( 
//             visible: visibilty,
//                     child: SingleChildScrollView(
//                       scrollDirection: Axis.vertical,
//                                         child: OutlineButton( 
//               color: Colors.green,
//               borderSide: BorderSide(
//                 color: Colors.red,
//                 width: 1.55
                  
//               ),
              
//               onPressed: () {
//                 _openImagePicker(context);
                
//               },
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: <Widget>[
//                   Icon(
//                       Icons.camera_alt,
//                       color: buttonColor,
//                   ),
//                   SizedBox(
//                       width: 5.0,
//                   ),
//                   Text(
//                       'Upload',
//                       style: TextStyle(color: buttonColor),
//                   )
//                 ],
//               ),
//             ),
//                     ),
//           ),
//           SizedBox(height:10.0),
//   //FlatButton(child: Text('uplosf'),onPressed: () => upload(ImageSource.gallery),)
             

//         ],
//       ),
//     );
//   }
// }




