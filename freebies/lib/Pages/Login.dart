import 'package:flutter/material.dart';

import 'package:scoped_model/scoped_model.dart';
import '../Scoped-Model/mainModel.dart';
import '../Models/enum.dart';



  // enums are the options  which you defined on your own choice and can be used by .


class Login extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoginPageState();
  }
}

class _LoginPageState extends State<Login> {
  final Map<String, dynamic> _formData = {
    'email': null,
    'password': null,
    'acceptTerms': false,
       'address':null,
              'name':null,
       'cnic':null,
       'number':null,
       'isProvider':null,
       'image':'null'


  };
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
    final TextEditingController _addressController = TextEditingController();
      final TextEditingController _nameController = TextEditingController();
        final TextEditingController _cnicController = TextEditingController();

  final TextEditingController _numberController = TextEditingController();





  AuthMode _authMode = AuthMode.Login;


  Widget _buildEmailTextField() {
    return TextFormField(
     
  decoration: InputDecoration(
          labelText: "Email",
           prefixIcon: const Icon(
                  Icons.mail,
                  color: Colors.green,
                ),
          fillColor: Colors.white,
          focusedBorder:OutlineInputBorder(
            borderSide: const BorderSide(color:Color(0xff36332e), width: 4.0,),
            borderRadius: BorderRadius.circular(25.0),
          ),
        ),
        
      keyboardType: TextInputType.emailAddress,
      controller: _emailController,
      // ignore: missing_return
      validator: (String value) {
        if (_emailController.text.isEmpty ||
            !RegExp(r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
                .hasMatch(value)) {
          return 'Please enter a valid email';
        }
      },
      onSaved: (String value) {
        _formData['email'] = value;
      },
    );
  }

  Widget _buildPasswordTextField() {
    return TextFormField(
     decoration: InputDecoration(
          labelText: "Password",
           prefixIcon: const Icon(
                  Icons.lock,
                  color: Colors.red,
                ),
         // fillColor: Colors.white,
          //filled: true
          focusColor: Colors.red,
          focusedBorder:OutlineInputBorder(
            borderSide: const BorderSide(color:Color(0xff36332e), width: 4.0),
            borderRadius: BorderRadius.circular(25.0),
          ),
        ),
        
          
      obscureText: true,
      controller:
          _passwordController, //this controller is used to get the text enterd by user from the textform field
      // ignore: missing_return
      validator: (String value) {
        if (value.isEmpty || value.length < 6) {
          return 'Password invalid';
        }
      },
      onSaved: (String value) {
        _formData['password'] = value;
      },
    );
  }




  Widget _buildAddressTextField() {
    return TextFormField(
            keyboardType: TextInputType.text,

     decoration: InputDecoration(
          labelText: "Address",
          
           prefixIcon: const Icon(
                  Icons.lock,
                  color: Colors.red,
                ),
         // fillColor: Colors.white,
          //filled: true
          focusColor: Colors.red,
          focusedBorder:OutlineInputBorder(
            borderSide: const BorderSide(color:Color(0xff36332e), width: 4.0),
            borderRadius: BorderRadius.circular(25.0),
          ),
        ),
        
          
      controller:
          _addressController, //this controller is used to get the text enterd by user from the textform field
      // ignore: missing_return
      validator: (String value) {
        if (value.isEmpty || value.length <= 10) {
          return 'Please enter valid address';
        }
      },
      onSaved: (String value) {
        _formData['address'] = value;
        print( _formData['address']);
      },
    );
  }


  Widget _buildCnicTextField() {
    return TextFormField(
      keyboardType: TextInputType.number,
     decoration: InputDecoration(
          labelText: "Cnic No",
           prefixIcon: const Icon(
                  Icons.lock,
                  color: Colors.red,
                ),
         // fillColor: Colors.white,
          //filled: true
          focusColor: Colors.red,
          focusedBorder:OutlineInputBorder(
            borderSide: const BorderSide(color:Color(0xff36332e), width: 4.0),
            borderRadius: BorderRadius.circular(25.0),
          ),
        ),
        
          
      controller:
          _cnicController, //this controller is used to get the text enterd by user from the textform field
      // ignore: missing_return
      validator: (String value) {
        if (value.isEmpty || value.length <= 12) {
          return 'Cnic invalid';
        }
      },
      onSaved: (String value) {
        _formData['cnic'] = value;
                print( _formData['cnic']);

      },
    );
  }


  Widget _buildNameTextField() {
    return TextFormField(
      keyboardType: TextInputType.text,
     decoration: InputDecoration(
          labelText: "Name",
           prefixIcon: const Icon(
                  Icons.lock,
                  color: Colors.red,
                ),
         // fillColor: Colors.white,
          //filled: true
          focusColor: Colors.red,
          focusedBorder:OutlineInputBorder(
            borderSide: const BorderSide(color:Color(0xff36332e), width: 4.0),
            borderRadius: BorderRadius.circular(25.0),
          ),
        ),
        
          
      controller:
          _nameController, //this controller is used to get the text enterd by user from the textform field
      // ignore: missing_return
      validator: (String value) {
        if (value.isEmpty || value.length <= 10) {
          return 'enter valid name';
        }
      },
      onSaved: (String value) {
        _formData['name'] = value;
                print( _formData['name']);

      },
    );
  }



  Widget _buildNumberTextField() {
    return TextFormField(
     decoration: InputDecoration(
          labelText: "Contact Number",
           prefixIcon: const Icon(
                  Icons.lock,
                  color: Colors.red,
                ),
         // fillColor: Colors.white,
          //filled: true
          focusColor: Colors.red,
          focusedBorder:OutlineInputBorder(
            borderSide: const BorderSide(color:Color(0xff36332e), width: 4.0),
            borderRadius: BorderRadius.circular(25.0),
          ),
        ),
        
          keyboardType: TextInputType.text,
      controller:
          _numberController, //this controller is used to get the text enterd by user from the textform field
      // ignore: missing_return
      validator: (String value) {
        if (value.isEmpty || value.length <=11) {
          return 'Number invalid';
        }
      },
      onSaved: (String value) {
        _formData['number'] = value;
                print( _formData['number']);

      },
    );
  }








  Widget _buildPasswordConfirmTextField() {
    return TextFormField(
      decoration: InputDecoration(
          labelText: "Confirm Password",
           prefixIcon: const Icon(
                  Icons.lock,
                  color: Colors.red,
                ),
         // fillColor: Colors.white,
          //filled: true
          focusColor: Colors.red,
          focusedBorder:OutlineInputBorder(
            borderSide: const BorderSide(color:Color(0xff36332e), width: 4.0),
            borderRadius: BorderRadius.circular(25.0),
          ),
        ),
    );
  }

  Widget _buildAcceptSwitch() {
    return SwitchListTile(activeColor: Colors.green,
      value: _formData['acceptTerms'],
      onChanged: (bool value) {
        setState(() {
          _formData['acceptTerms'] = value;
        });
      },
      title: GestureDetector(
        onTap:()=> Navigator.pushNamed(context, '/privacy'),
              child: Text('Accept Terms',
            style: TextStyle(
                fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.black)),
      ),
    );
  }

  void _submitForm(Function logIn,Function signUp, ) async {
    if (!_formKey.currentState.validate() || !_formData['acceptTerms']) {
      return;
    }
    _formKey.currentState.save();
     Map<String, dynamic> successInformation;
     if(_authMode==AuthMode.SignUp){
successInformation = await signUp(_formData['email'], _formData['password'],_authMode,_formData['address'],_formData['name'],_formData['cnic'],_formData['number'],false,'img');
    print(successInformation['success']);
      if (successInformation['success']) {
        if (_formData['email']=='qq@qq.com' ){
          Navigator.pushReplacementNamed(context, '/homes'); 
         
        } else {
        Navigator.pushReplacementNamed(context, '/homes');

        }
      } else {
        showDialog(
            context: context,
              builder: (BuildContext context) {
              return AlertDialog(
                title: Text('An Error Occured'),
                content:Text(successInformation['message']) ,
                actions: [
                  FlatButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text('Okay'))
                ],
              );
            },
            );
      
    }

     }



else{
successInformation = await logIn(_formData['email'], _formData['password'],_authMode);
    print(successInformation['success']);
      if (successInformation['success']) {
        if (_formData['email']=='raybhillsocialwork@outlook.com' ||_formData['email']=='qq@qq.com' ){
          Navigator.pushReplacementNamed(context, '/homes');
         
        } else {
        Navigator.pushReplacementNamed(context, '/productEdit');

        }
      } else {
        showDialog(
            context: context,
              builder: (BuildContext context) {
              return AlertDialog(
                title: Text('An Error Occured'),
                content:Text(successInformation['message']) ,
                actions: [
                  FlatButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text('Okay'))
                ],
              );
            },
            );
      
    }





}
    
  }

  @override
  Widget build(BuildContext context) {
    final double deviceWidth = MediaQuery.of(context).size.width;
    final double targetWidth = deviceWidth > 550.0 ? 500.0 : deviceWidth * 0.95;
    return Scaffold(
      backgroundColor:Colors.white, //Color(0xfff2e1cf),
      appBar: AppBar(
        
        elevation: 0,
        backgroundColor: Color(0xff36332e),
        toolbarHeight: 80,  
        title:  _authMode == AuthMode.SignUp
                            ? Text('ezentu', style: TextStyle(
          fontSize: 28.0, fontWeight: FontWeight.bold,color: Colors.black),)
                            : Text('ezentu',style: TextStyle(
          fontSize: 28.0, fontWeight: FontWeight.bold,color: Colors.black),),
         // centerTitle: true,
         
      ),
      body: Container(
        decoration: BoxDecoration(
         //image: _buildBackgroundImage(),
        ),
        padding: EdgeInsets.all(10.0),
        child: Center(
          child: SingleChildScrollView(
            child: Container(
              width: targetWidth,
              child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 30,),
                   // _buildBackgroundImage(),
                   
            GestureDetector(onLongPress: () => print('working'),
              child: Container(height: 120,child: Image.asset('assets/logo.jpeg'))),
         
                    _buildEmailTextField(),
                    SizedBox(
                      height: 10.0,
                    ),
                    _buildPasswordTextField(),
                    SizedBox(
                      height: 10.0,
                    ),
                    _authMode == AuthMode.SignUp
                        ?Column(
                          children:[
                            _buildPasswordConfirmTextField(),
                            SizedBox(height: 5,),
                            _buildAddressTextField(),
                                                        SizedBox(height: 5,),

                            _buildNumberTextField(),
                                                        SizedBox(height: 5,),

                            _buildNameTextField(),
                                                        SizedBox(height: 5,),

                            _buildCnicTextField()
                          ]
                        ) 
                        
                        : Container(),
                    SizedBox(
                      height: 10.0,
                    ),
                    _buildAcceptSwitch(),
                    SizedBox(
                      height: 10.0,
                    ),
                    FlatButton(
                      onPressed: () {
                       
                        
                        setState(() {
                          _authMode = _authMode == AuthMode.Login
                              ? AuthMode.SignUp
                              : AuthMode.Login;
                        }
                        );
                      },
                      child: Text(
                          '${_authMode == AuthMode.Login ? 'Register' : 'LogIn'}',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          )),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    ScopedModelDescendant(builder:
                        (BuildContext context, Widget child, MainModel model) {
                      return model.isLoading ? CircularProgressIndicator() 
                      : RaisedButton(
                        color: Colors.black,
                        textColor: Colors.white,
                        child: _authMode == AuthMode.SignUp
                            ? Text('Register')
                            : Text('LOGIN'),
                      onPressed: () =>_submitForm(model.logIn,model.signUp),
                      );
                    }),
                    
                    FlatButton(onPressed: (){
                      Navigator.pushNamed(context, '/ResetPass');
                    }, child: Text('Forget Password'))
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
