


// import 'package:flutter/material.dart';
// import 'package:freebies/Widgets/Helpers/webUploadImage.dart';
// import 'package:scoped_model/scoped_model.dart';

// import 'package:shared_preferences/shared_preferences.dart';

// import '../Scoped-Model/mainModel.dart';

// class ADDProfile extends StatefulWidget {
//   final MainModel model;
  
// // final String id;
//   ADDProfile(this.model);

//   @override
//   _ADDProfileState createState() => _ADDProfileState();
// }

// class _ADDProfileState extends State<ADDProfile> {


// final Map<String, dynamic> values = {
//     'name': null,
//     'address': null,
//     'email': null,
//     'number': null,
//     'image':null
//   };


   
  
//     final _titleTextController = TextEditingController();
//   final _numberTextController = TextEditingController();
//   final _addressTextController = TextEditingController();
//   final _emailTextController = TextEditingController();
//   final GlobalKey<FormState> formSettings = GlobalKey<FormState>();














// Widget _buildNameTextField() {
//     return TextFormField(
//       decoration: InputDecoration(labelText: 'Full Name'),
//       controller: _titleTextController,
//             keyboardType: TextInputType.name,

//      //initialValue: name == null ? '' : name,
//       // ignore: missing_return
//       validator: (String value) {
//         if (value.isEmpty || value.length < 5) {
//           return 'Full name is required and should be 5+ characters long';
//         }
//       },

//       onSaved: (String value) {
//         values['name'] = value;
//       },
//     );
//   }



// Widget _buildNumberTextField() {
//     return TextFormField(
//       keyboardType: TextInputType.text,
//       decoration: InputDecoration(labelText: 'Phone Number'),
//       controller: _numberTextController,
//       //initialValue: nmbr==null?'':nmbr,
//       // ignore: missing_return
//       validator: (String value) {
//         if (value.isEmpty ) {
//           // this is regular expression whichb means number
//           return 'Number is required.';
//         }
//       },
//       onSaved: (String value)  {
//         values['number'] = value  ;
//       },
//     );
//   }


// Widget _buildNameAddressField() {
//     return TextFormField(
//       decoration: InputDecoration(labelText: 'Home Address'),
//       controller: _addressTextController,
//             keyboardType: TextInputType.text,

//      // initialValue: addres == null ? '' :addres,
//       // ignore: missing_return
//       validator: (String value) {
//         if (value.isEmpty || value.length < 5) {
//           return 'Title is required and should be 5+ characters long';
//         }
//       },

//       onSaved: (String value) {
//         values['address'] = value;
//       },
//     );
//   }








// Widget _pageContent(BuildContext context,) {
  
//     final double deviceWidth = MediaQuery.of(context)
//         .size
//         .width; //this line is used for getting the device size and width and save it into variable
//     final double targetWidth = deviceWidth > 550.0
//         ? 500.0
//         : deviceWidth *
//             0.95; // this line is used to check the required/ or we can say check the target width scrren basicly it is a condition that we are passing that if device width is greater or less then required target then show this size (0.95) 'this means that make it to 95%'
//     final double targetPadding = deviceWidth - targetWidth;

//  final double deviceHeight = MediaQuery.of(context).size.height;

//         final double targetheight= deviceHeight * 0.99;

//  return  Scaffold(
        

//         body: Container(
//           width: targetheight,
//           padding: EdgeInsets.symmetric(horizontal: targetPadding / 2),
//           margin: EdgeInsets.all(10.0),
//       child: Form(autovalidate: true,
//         key: formSettings,
//         child: ListView(
//           children: <Widget>[
//             SingleChildScrollView(
//               scrollDirection: Axis.vertical,
//                           child: Column( children: [
//                 SingleChildScrollView(
//               scrollDirection: Axis.vertical,
//                           child: Column( children: [
//                 Container(
//                     width: 170,
//                     height: 300,
//                     child:UploadImage() ,
//                   ),
               
               
//               ],),
//             ),
               
               
//               ],),
//             ),
//         SizedBox(height: 20,),
//         _buildNameTextField(),
//         SizedBox(height: 10,),
        
//          SizedBox(height: 10,),
//          _buildNumberTextField(),
//          SizedBox(height: 10,),
//  _buildNameAddressField(),
//             SizedBox(
//               height: 10.0,
//             ),
//             _buildSubmitButton(),
//             SizedBox(
//               height: 10.0,
//             ),
//           ],
//         ),
//       ),
//     ));




//   }





// void _submitForm(Function adData)async{
 
// try {
//   final SharedPreferences pref = await SharedPreferences.getInstance();
//      final String fireBaseId = pref.getString('uID');
//     final String image=pref.getString('ImgUrl');
//     if (!formSettings.currentState.validate()) {
//       return;
//     } 
//   formSettings.currentState.save();

//       adData(
//        values['name'],
//         values['number'],
//          values['address'],
//         widget.model.uploadedImage
//       );
//       bool sucess=true;
//         if (sucess) {
        
//           showDialog(
//               context: context,
//               builder: (BuildContext context) {
//                 return AlertDialog(
//                   title: Text('SuccessFull'),
//                   content: Text('Profile Updated'),
//                   actions: <Widget>[
//                     FlatButton(
//                       onPressed: () => Navigator.pushNamed(context, '/UserProfile'),
//                       child: Text('Okay'),
//                     )
//                   ],
//                 );
//               });
          
          
              
//         } else {
//           showDialog(
//               context: context,
//               builder: (BuildContext context) {
//                 return AlertDialog(
//                   title: Text('Some Thing Went Wrong'),
//                   content: Text('Please Try Again'),
//                   actions: <Widget>[
//                     FlatButton(
//                       onPressed: () => Navigator.of(context).pop(),
//                       child: Text('Okay'),
//                     )
//                   ],
//                 );
//               });
//         }


  
// } catch (e) {
//   print('error;');
//   print(e);
// }


//       }

// Widget _buildSubmitButton() {
  
//     return ScopedModelDescendant<MainModel>(
//       builder: (BuildContext context, Widget child, MainModel model) {
//         return model.isLoading
//             ? Center(child: CircularProgressIndicator())
//             : RaisedButton(
//                 color: Theme.of(context).accentColor,
//                 textColor: Colors.white,
//                 child: Text('SAVE'),
//                 onPressed: () => _submitForm(model.updateProfileData),
//               );
//       },
//     );
//   }















//   @override
//   Widget build(BuildContext context) {
    
    
//     return ScopedModelDescendant<MainModel>(
//       builder: (BuildContext context, Widget child, MainModel model) {
//         final Widget pageContent = _pageContent(context,);
//         return  pageContent;
            
//       },
//     );
//   } 
// }








// import 'package:final_app/Widgets/helpers/takeImage.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import '../Models/subServices.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:freebies/Models/Product.dart';
import 'package:freebies/Models/User.dart';
import 'package:freebies/Widgets/Helpers/webUploadImage.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Scoped-Model/mainModel.dart';
import '../Widgets/helpers/ensure_visible.dart';
import '../Widgets/Helpers/mobileUploadImage.dart';


class ADDProfile extends StatefulWidget {
MainModel model;
ADDProfile(this.model);

  @override
  _ADDProfileState createState() => _ADDProfileState();
}

class _ADDProfileState extends State<ADDProfile> {

 // List<Subservices> subss =[];
  
  final Map<String, dynamic> values = {
    'name': null,
    'address': null,
    'number': null,
    'image':null
  };
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _titleFocusNode = FocusNode();
  final _titleTextController = TextEditingController();
  final  _addressTextControllerzz = TextEditingController();
  final TextEditingController _numberTextController = TextEditingController();
  List images=[4];
 final bool isfeatured=false;  

  

















 Widget _buildTitleTextField(User product) {
    
      if (product == null && _titleTextController.text.trim() == '') {
      _titleTextController.text = '';
    } else if (product != null && _titleTextController.text.trim() == '') {
      _titleTextController.text = product.name;
    } else if (product != null && _titleTextController.text.trim() != '') {
      _titleTextController.text = _titleTextController.text;
    } else if (product == null && _titleTextController.text.trim() != '') {
      _titleTextController.text = _titleTextController.text;
    } else {
      _titleTextController.text = '';
    }
    return EnsureVisibleWhenFocused(
      focusNode: _titleFocusNode,
      child:TextFormField(
      decoration: InputDecoration(labelText: 'Product Title'),
     controller: _titleTextController,
  
      // ignore: missing_return
      validator: (String value) {
        if (value.isEmpty || value.length < 5) {
          return 'Title is required and should be 5+ characters long';
        }
      },
      
      onSaved: (String value) {
        
        values['name'] = value;
      },
    ));
  }
 
 Widget _buildDescpTextField(User product) {
    
     if (product == null && _addressTextControllerzz.text.trim() == '') {
      _addressTextControllerzz.text = '';
    } else if (product != null && _addressTextControllerzz.text.trim() == '') {
      _addressTextControllerzz.text = product.address;
    } else if (product != null && _addressTextControllerzz.text.trim() != '') {
      _addressTextControllerzz.text = _addressTextControllerzz.text;
    } else if (product == null && _addressTextControllerzz.text.trim() != '') {
      _addressTextControllerzz.text = _addressTextControllerzz.text;
    } else {
      _addressTextControllerzz.text = '';
    }
    return EnsureVisibleWhenFocused(
      focusNode: _titleFocusNode,
      child:TextFormField(
      decoration: InputDecoration(labelText: 'Product Title'),
     controller: _addressTextControllerzz,
     maxLines: 3,
  
      // ignore: missing_return
      validator: (String value) {
        if (value.isEmpty || value.length < 5) {
          return 'Title is required and should be 5+ characters long';
        }
      },
      
      onSaved: (String value) {
        
        values['address'] = value;
      },
    ));
  }
 
Widget _buildPriceTextField(User product) {
    
     if (product == null && _numberTextController.text.trim() == '') {
      _numberTextController.text = '';
    } else if (product != null && _numberTextController.text.trim() == '') {
      _numberTextController.text = product.number.toString();
    } else if (product != null && _numberTextController.text.trim() != '') {
      _numberTextController.text = _numberTextController.text;
    } else if (product == null && _numberTextController.text.trim() != '') {
      _numberTextController.text = _numberTextController.text;
    } else {
      _numberTextController.text = '';
    }
    return EnsureVisibleWhenFocused(
      focusNode: _titleFocusNode,
      child:TextFormField(
        controller: _numberTextController,
      decoration: InputDecoration(labelText: 'Product Price'),
  keyboardType: TextInputType.number, 
      // ignore: missing_return
      validator: (String value) {
        if (value.isEmpty ||
            !RegExp(r'^(?:[1-9]\d*|0)?(?:\.\d+)?$').hasMatch(value)) {
          // this is regular expression whichb means number
          return 'Price is required and should be a number.';
        }
      },
      
      onSaved: (String value) {
        
        values['number'] = int.parse(value);
      },
    ));
  }




 Widget _buildSubmitButton() {
    return ScopedModelDescendant<MainModel>(
      builder: (BuildContext context, Widget child, MainModel model) {
        return model.isLoading
            ? Center(child: CircularProgressIndicator())
            : RaisedButton(
                color: Theme.of(context).accentColor,
                textColor: Colors.white,
                child: Text('SAVE'),
                onPressed: () => _submitForm(
                  model.updateProfileData
                  
                   ),
              );
      },
    );
  }





void _submitForm(
      Function addProduct) async{
    if (!_formKey.currentState.validate()) {
      //this if is used to check the validation and here it is chechking that k agr  validate ni hoa wa to kch mat return krna matlb save mat krna
      return;
    }

    _formKey.currentState.save();
    


      addProduct(

        values['name'],
        values['address'],
        values['number'].toString(),
        widget.model.uploadedImage,
       
        

     
      ).then((bool success) {
        if (success) {
         showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text('Confirmation'),
                  content: Text('Service Added'),
                  actions: <Widget>[
                    FlatButton(
                      onPressed: () => Navigator.pushNamed(context, '/providerOrders'),
                      child: Text('Okay'),
                    )
                  ],
                );
              });
        } else {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text('Some Thing Went Wrong'),
                  content: Text('Please Try Again'),
                  actions: <Widget>[
                    FlatButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: Text('Okay'),
                    )
                  ],
                );
              });
        }
      });
    
  }


 Widget _pageContent(BuildContext context,User product) {
   if (kIsWeb) {
     final double deviceWidth = MediaQuery.of(context)
        .size
        .width; //this line is used for getting the device size and width and save it into variable
    final double targetWidth = deviceWidth > 550.0
        ? 500.0
        : deviceWidth *
            0.95; // this line is used to check the required/ or we can say check the target width scrren basicly it is a condition that we are passing that if device width is greater or less then required target then show this size (0.95) 'this means that make it to 95%'
    final double targetPadding = deviceWidth - targetWidth;

    return Scaffold(
      
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(
              FocusNode()); // this is used for closing the key board by clicking anywhere on screen
        },
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: targetPadding / 2),
          margin: EdgeInsets.all(10.0),
          child: Form(
            key: _formKey,
            child: ListView(
              children: <Widget>[
                 SizedBox(height: 10,),
                  Text("Edit PRofile",
                      style:TextStyle(fontSize: 20.0, fontWeight:FontWeight.bold),),
                                       SizedBox(height: 10,),
                _buildTitleTextField(product),
                _buildDescpTextField(product),
                _buildPriceTextField(product),
              
                 SizedBox(
                  height: 29.0,
                ),
              
              ScopedModelDescendant<MainModel>(
      builder: (BuildContext context, Widget child, MainModel model) {
        return UploadImage(model: model,);
    }),
            
         
          
                 SizedBox(
                  height: 25.0,
                ),
                SizedBox(
                  height: 15.0,
                ),
 
              _buildSubmitButton(),
              ],
            ),
          ),
        )),
    );
   } else {
   final double deviceWidth = MediaQuery.of(context)
        .size
        .width; //this line is used for getting the device size and width and save it into variable
    final double targetWidth = deviceWidth > 550.0
        ? deviceWidth *
            0.95
        : deviceWidth *
            0.95; // this line is used to check the required/ or we can say check the target width scrren basicly it is a condition that we are passing that if device width is greater or less then required target then show this size (0.95) 'this means that make it to 95%'
    final double targetPadding = deviceWidth - targetWidth;

    return Scaffold(
      
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(
              FocusNode()); // this is used for closing the key board by clicking anywhere on screen
        },
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: targetPadding / 2),
          margin: EdgeInsets.all(10.0),
          child: Form(
            key: _formKey,
            child: ListView(
              children: <Widget>[
                 SizedBox(height: 10,),
                  Text("Add Details",
                      style:TextStyle(fontSize: 20.0, fontWeight:FontWeight.bold),),
                                       SizedBox(height: 10,),
                _buildTitleTextField(product),
                _buildDescpTextField(product),
                _buildPriceTextField(product),
              //  ImageInput(),
                 SizedBox(
                  height: 29.0,
                ),
              
           ImageInputMobile(),
      
          
         
          
                 SizedBox(
                  height: 29.0,
                ),
           
            
                SizedBox(
                  height: 10.0,
                ),
 
              _buildSubmitButton(),
              ],
            ),
          ),
        )),
    );
   }
    
     
  }

 
  @override
  Widget build(BuildContext context) {
    
    return ScopedModelDescendant<MainModel>(
      builder: (BuildContext context, Widget child, MainModel model) {
       
        final Widget pageContent = _pageContent(context,model.user);
        return model.selectedProductIndex == -1 ?  
        
           pageContent : Scaffold(
                appBar: AppBar(
                  title: Text('Edit Profile'),
                ),
                body:pageContent);
              
      },
    );
  } 
}




