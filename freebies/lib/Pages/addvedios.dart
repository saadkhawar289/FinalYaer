
// import 'package:final_app/Widgets/helpers/takeImage.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import '../Models/subServices.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:freebies/Models/Games.dart';
import 'package:freebies/Models/Product.dart';
import 'package:freebies/Models/Vedios.dart';
import 'package:freebies/Widgets/Helpers/webUploadImage.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Scoped-Model/mainModel.dart';
import '../Widgets/helpers/ensure_visible.dart';
import '../Widgets/Helpers/mobileUploadImage.dart';


class AddVedios extends StatefulWidget {
  @override
  _AddVediosPageState createState() => _AddVediosPageState();
}

class _AddVediosPageState extends State<AddVedios> {

 // List<Subservices> subss =[];
   final Map<String, dynamic> _formValues = {
    'image': 'img',
    'link': null,
    'tittle':null
        
  };
  
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _titleFocusNode = FocusNode();
    final _linkFocusNode = FocusNode();

  final _linkTextController = TextEditingController();
  final _tittleTextController = TextEditingController();




 Widget _buildLinkTextField(Vedios product) {
    
      if (product == null && _linkTextController.text.trim() == '') {
      _linkTextController.text = '';
    } else if (product != null && _linkTextController.text.trim() == '') {
      _linkTextController.text = product.link;
    } else if (product != null && _linkTextController.text.trim() != '') {
      _linkTextController.text = _linkTextController.text;
    } else if (product == null && _linkTextController.text.trim() != '') {
      _linkTextController.text = _linkTextController.text;
    } else {
      _linkTextController.text = '';
    }
    return EnsureVisibleWhenFocused(
      focusNode: _linkFocusNode,
      child:TextFormField(
      decoration: InputDecoration(labelText: 'Game link'),
     controller: _linkTextController,
  
      // ignore: missing_return
      validator: (String value) {
        if (value.isEmpty ) {
          return 'Link is required ';
        }
      },
      
      onSaved: (String value) {
        
        _formValues['link'] = value;
      },
    ));
  }
 


 Widget _buildTittleTextField(Vedios product){

if (product == null && _tittleTextController.text.trim() == '') {
      _tittleTextController.text = '';
    } else if (product != null && _tittleTextController.text.trim() == '') {
      _tittleTextController.text = product.tittle;
    } else if (product != null && _tittleTextController.text.trim() != '') {
      _tittleTextController.text = _tittleTextController.text;
    } else if (product == null && _tittleTextController.text.trim() != '') {
      _tittleTextController.text = _tittleTextController.text;
    } else {
      _linkTextController.text = '';
    }
    return EnsureVisibleWhenFocused(
      focusNode: _linkFocusNode,
      child:TextFormField(
      decoration: InputDecoration(labelText: 'Name of Game'),
     controller: _tittleTextController,
  
      // ignore: missing_return
      validator: (String value) {
        if (value.isEmpty ) {
          return 'Name is required ';
        }
      },
      
      onSaved: (String value) {
        
        _formValues['tittle'] = value;
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
                    model.addVedio,
                    model.updateVedio,
                    model.selectVedio,
                    model.selectedVedioIndex,
                  
                   ),
              );
      },
    );
  }





void _submitForm(
      Function addProduct,Function updateGame, Function setSelectedProduct,
      [int selcectedGameIndex]) async{
    if (!_formKey.currentState.validate()) {
      //this if is used to check the validation and here it is chechking that k agr  validate ni hoa wa to kch mat return krna matlb save mat krna
      return;
    }

    _formKey.currentState.save();
    if (selcectedGameIndex == -1 ) {

    
      addProduct(
        _formValues['tittle'],
        _formValues['link'],
        _formValues['image'],


     
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
                      onPressed: () => Navigator.pushNamed(context, '/admin'),
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
    } else {
      updateGame(
        _formValues['tittle'],
        _formValues['link'],
        _formValues['image'],
      ).then((_) => Navigator.pushReplacementNamed(context, '/admin')
          .then((value) => setSelectedProduct(null)));
    }
  }


 Widget _pageContent(BuildContext context,Vedios vedioos) {
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
                  Text("Add Details",
                      style:TextStyle(fontSize: 20.0, fontWeight:FontWeight.bold),),
                                       SizedBox(height: 10,),
                _buildLinkTextField(vedioos),
                _buildTittleTextField(vedioos),
                
              
                 SizedBox(
                  height: 29.0,
                ),
              
          //  UploadImage(),
         
          
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
                  Text("Add Vedios",
                      style:TextStyle(fontSize: 20.0, fontWeight:FontWeight.bold),),
                                       SizedBox(height: 10,),
                _buildLinkTextField(vedioos),
                _buildTittleTextField(vedioos),
                
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
       
        final Widget pageContent = _pageContent(context,model.selectedVedio);
        return model.selcectedGameIndex == -1 ?  
        
           pageContent : Scaffold(
                appBar: AppBar(
                  title: Text('Edit Product'),
                ),
                body:pageContent);
              
      },
    );
  } 
}