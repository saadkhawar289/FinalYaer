
// import 'package:final_app/Widgets/helpers/takeImage.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import '../Models/subServices.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:freebies/Models/Product.dart';
import 'package:freebies/Widgets/Helpers/webUploadImage.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Scoped-Model/mainModel.dart';
import '../Widgets/helpers/ensure_visible.dart';
import '../Widgets/Helpers/mobileUploadImage.dart';


class ProductEditPage extends StatefulWidget {
MainModel model;
ProductEditPage({this.model});

  @override
  _ProductEditPageState createState() => _ProductEditPageState();
}

class _ProductEditPageState extends State<ProductEditPage> {

 // List<Subservices> subss =[];
   final Map<String, dynamic> _formValues = {
    'tittle': null,
    'description': null,
    'price': null,
    'image': 'https://www.bentleymotors.com/content/dam/bentley/Master/Models/Hero/New%20Continental%20GT%20V8/Bentley-Continental-GT-V8-static-front-1920x670.jpg/_jcr_content/renditions/Bentley-Continental-GT-V8-static-front-699x309.jpg./Bentley-Continental-GT-V8-static-front-699x309.jpg',
    'isfeatured':false,
    'rating':null
        
  };
  
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _titleFocusNode = FocusNode();
  final _titleTextController = TextEditingController();
  final  _descpTextControllerzz = TextEditingController();
  final TextEditingController __priceTextController = TextEditingController();
  List images=[4];
 final bool isfeatured=false;  

  

















 Widget _buildTitleTextField(Product product) {
    
      if (product == null && _titleTextController.text.trim() == '') {
      _titleTextController.text = '';
    } else if (product != null && _titleTextController.text.trim() == '') {
      _titleTextController.text = product.tittle;
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
        
        _formValues['tittle'] = value;
      },
    ));
  }
 
 Widget _buildDescpTextField(Product product) {
    
     if (product == null && _descpTextControllerzz.text.trim() == '') {
      _descpTextControllerzz.text = '';
    } else if (product != null && _descpTextControllerzz.text.trim() == '') {
      _descpTextControllerzz.text = product.tittle;
    } else if (product != null && _descpTextControllerzz.text.trim() != '') {
      _descpTextControllerzz.text = _descpTextControllerzz.text;
    } else if (product == null && _descpTextControllerzz.text.trim() != '') {
      _descpTextControllerzz.text = _descpTextControllerzz.text;
    } else {
      _descpTextControllerzz.text = '';
    }
    return EnsureVisibleWhenFocused(
      focusNode: _titleFocusNode,
      child:TextFormField(
      decoration: InputDecoration(labelText: 'Product Title'),
     controller: _descpTextControllerzz,
     maxLines: 3,
  
      // ignore: missing_return
      validator: (String value) {
        if (value.isEmpty || value.length < 5) {
          return 'Title is required and should be 5+ characters long';
        }
      },
      
      onSaved: (String value) {
        
        _formValues['description'] = value;
      },
    ));
  }
 
Widget _buildPriceTextField(Product product) {
    
     if (product == null && __priceTextController.text.trim() == '') {
      __priceTextController.text = '';
    } else if (product != null && __priceTextController.text.trim() == '') {
      __priceTextController.text = product.price.toString();
    } else if (product != null && __priceTextController.text.trim() != '') {
      __priceTextController.text = __priceTextController.text;
    } else if (product == null && __priceTextController.text.trim() != '') {
      __priceTextController.text = __priceTextController.text;
    } else {
      __priceTextController.text = '';
    }
    return EnsureVisibleWhenFocused(
      focusNode: _titleFocusNode,
      child:TextFormField(
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
        
        _formValues['price'] = int.parse(value);
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
                    model.addProducts,
                    model.updateProduct,
                    model.selectProudct,
                    model.selectedProductIndex,
                  
                   ),
              );
      },
    );
  }





void _submitForm(
      Function addProduct,Function updateProduct, Function setSelectedProduct,
      [int selectedProductIndex]) async{
    if (!_formKey.currentState.validate()) {
      //this if is used to check the validation and here it is chechking that k agr  validate ni hoa wa to kch mat return krna matlb save mat krna
      return;
    }

    _formKey.currentState.save();
    if (selectedProductIndex == -1 ) {

    
      addProduct(
        _formValues['tittle'],
        _formValues['description'],
        _formValues['price'],
        widget.model.uploadedImage,
        _formValues['isfeatured'],
        

     
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
      updateProduct(
        _formValues['tittle'],
        _formValues['description'],
        _formValues['price'],
        _formValues['image'],
        _formValues['featured'],
      ).then((_) => Navigator.pushReplacementNamed(context, '/Services')
          .then((value) => setSelectedProduct(null)));
    }
  }


 Widget _pageContent(BuildContext context,Product product) {
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
       
        final Widget pageContent = _pageContent(context,model.selectedProduct);
        return model.selectedProductIndex == -1 ?  
        
           pageContent : Scaffold(
                appBar: AppBar(
                  title: Text('Edit Product'),
                ),
                body:pageContent);
              
      },
    );
  } 
}