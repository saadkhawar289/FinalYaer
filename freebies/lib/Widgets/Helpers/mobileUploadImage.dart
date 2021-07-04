import'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ImageInputMobile extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ImageInputMobileState();
  }
}

class _ImageInputMobileState extends State<ImageInputMobile> {
  String imgurl;
  File _imageFile;
      bool visibilty=true;

  final picker = ImagePicker();

   DecorationImage _buildServiceBoxImage() {
    return DecorationImage(
      
      fit: BoxFit.cover,
      colorFilter:
          ColorFilter.mode(Colors.black.withOpacity(0.4), BlendMode.screen),
      image: 
      AssetImage('assets/logoo.jpeg')
      

    );
  }


void upload(BuildContext context,ImageSource source)async{
  final _storage=FirebaseStorage.instance;

PickedFile image;

image = await picker.getImage(source: source);
var file=File(image.path);

String filepath='images/${DateTime.now()}.png';
var snapShot= await _storage.ref().child(filepath).putFile(file).onComplete;
var url=await snapShot.ref.getDownloadURL();
final pref = await SharedPreferences.getInstance();
    pref.setString('ImgUrl', url);
setState(() {
  
_imageFile=file;
imgurl=url;

});

Navigator.pop(context);
}






  void _openImagePicker(BuildContext context) {
    
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
            height: 150.0,
            padding: EdgeInsets.all(10.0),
            child: Column(children: [
              Text(
                'Pick an Image',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10.0,
              ),
              FlatButton(
                textColor: Theme.of(context).primaryColor,
                child: Text('Use Camera'),
                onPressed: () {
                  upload(context,ImageSource.camera);
                },
              ),
              FlatButton(
                textColor: Theme.of(context).primaryColor,
                child: Text('Use Gallery'),
                onPressed: () {
                  upload(context,ImageSource.gallery);
                },
              )
            ]),
          );
        }
        );
  }

  @override
  Widget build(BuildContext context) {

    final buttonColor = Theme.of(context).primaryColor;
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
          child: Column(
        children: <Widget>[
          SizedBox(height: 10,),
          Container(decoration: BoxDecoration(borderRadius: BorderRadiusDirectional.circular(80)),
          child:imgurl == null
              ? Container(
                  height: MediaQuery.of(context).size.height*0.20,
                  width:  MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                     border: Border.all(width: 2,),
                     image: _buildServiceBoxImage(),
                  ),
                  
              )
              : Image.network(imgurl)
          ),
          Visibility( 
            visible: visibilty,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                                        child: OutlineButton( 
              color: Colors.green,
              borderSide: BorderSide(
                color: Colors.red,
                width: 1.55
                  
              ),
              
              onPressed: () {
                _openImagePicker(context);
                
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                      Icons.camera_alt,
                      color: buttonColor,
                  ),
                  SizedBox(
                      width: 5.0,
                  ),
                  Text(
                      'Upload',
                      style: TextStyle(color: buttonColor),
                  )
                ],
              ),
            ),
                    ),
          ),
          SizedBox(height:10.0),
  //FlatButton(child: Text('uplosf'),onPressed: () => upload(ImageSource.gallery),)
             

        ],
      ),
    );
  }
}
