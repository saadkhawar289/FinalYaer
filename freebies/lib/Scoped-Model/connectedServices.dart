import 'dart:convert';
import 'dart:async';

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:freebies/Models/Games.dart';
import 'package:freebies/Models/Orders.dart';
import 'package:freebies/Models/Product.dart';
import 'package:freebies/Models/User.dart';
import 'package:freebies/Models/Vedios.dart';
import 'package:freebies/Models/enum.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:http/http.dart ' as http;
// import 'package:rxdart/rxdart.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import '../Models/usert.dart';
// import '../Models/auth.dart';
// import '../Models/ServiceProvider.dart';

mixin ConnectedServicesModel on Model {
  List<Product> _products = [];
  List<Games> _games = [];
  List<User> _users = [];
  List<Product> cartItems = [];
  List<Vedios> _vedioList = [];
  List<Orders>orders=[];
  List<String> providerids=[];

  
  int wallet;
  int totalBill = 0;
  int subtotal = 0;
  int num1;
  int num2;
  int result=0;
  bool _isLoading = false;
  String _selServiceId;
  String _selcectedGameId;
  User _authenticationUser;
  String _selcectedVedioId;
  String _selcectedUserID;
  String uploadedImage;


void addPicToLocal(String img){

uploadedImage=img;
notifyListeners();

}


 void addToCart(Product ppp) {
   
    notifyListeners();
    print('in add fnctn');
    print(ppp.price);
    print(ppp.quantity);  
    Timer(Duration(seconds: 1), () {
     if(cartItems.contains(ppp)){
       print(ppp);
     }
cartItems.add(ppp);
      num2 = ppp.price;
      num1 = ppp.quantity;
      result = num1 * num2;
      totalBill = totalBill + result;
      subtotal = totalBill;
      _isLoading = false;
       notifyListeners();
      return false;    
    });
  
  }
}



mixin ProductModel on ConnectedServicesModel {
  bool _showFavorites = false;

  List<Product> get allproducts {
    return List.from(_products);
  }

  List<Product> get displayWishLIstProducts {
    if (_showFavorites) {
      return _products.where((Product product) => product.isfavourite).toList();
    }

    return List.from(_products);
  }

  String get selectedProductId {
    return _selServiceId;
  }

  Product get selectedProduct {
    if (selectedProductId == null) {
      return null;
    }
    return _products.firstWhere((Product product) {
      return product.id == selectedProductId;
    });
  }

  int get selectedProductIndex {
    return _products.indexWhere((Product product) {
      return product.id == _selServiceId;
    });
  }

  bool get displayFavoriteOnly {
    return _showFavorites;
  }

  void selectProudct(String productId) {
    _selServiceId = productId;
    if (_selServiceId != null) {
      notifyListeners();
    }
  }

  Future<bool> addProducts(String tittle, String description, int price,
      String image, bool featured) async {
        print('in add products');
    _isLoading = true;
    notifyListeners();
    final Map<String, dynamic> productData = {
      'tittle': tittle,
      'description': description,
      'image': image,
      'price': price,
      'UserID': _authenticationUser.id,
      'isFeatured': featured,
      'isFavourite':false,
      'reviews':'ssss',
      'rating':0
    };
    print(productData);
    try {
      final http.Response response = await http.post(
          'https://freebies-96dc8-default-rtdb.firebaseio.com/Products.json',
          body: json.encode(productData));
      print(response.body);
      print(response.statusCode);
      if (response.statusCode != 200 && response.statusCode != 201) {
        _isLoading = false;
        notifyListeners();
        return false;
      }
      _isLoading = false;
      notifyListeners();
      return true;
    } catch (error) {
      _isLoading = false;
      notifyListeners();
      return false;
    }
  }

  Future<bool> updateProduct(
      
      String tittle,
      String description,
      String image,
      int price,
      String userId) {
    _isLoading = true;
    notifyListeners();
 final Map<String, dynamic> productData = {
      'tittle': tittle,
      'description': description,
      'image': image,
      'price': price,
      'UserID': _authenticationUser.id,
      'isFeatured': selectedProduct.isFeatured,
      'isFavourite':false,
      'reviews':'ssss',
      'rating':0
    };

   
    return http
        .put(
            'https://freebies-96dc8-default-rtdb.firebaseio.com/Products/${selectedProduct.id}.json',
            body: json.encode(productData))
        .then((http.Response response) {
      _isLoading = false;
      final Product updatedProduct = Product(
          id: selectedProduct.id,
          tittle: tittle,
          description: description,
          image: image,
          price: price,
          isfavourite: false,
          userId: userId,
          isFeatured: selectedProduct.isFeatured);
      _products[selectedProductIndex] = updatedProduct;
      notifyListeners();
      print('done updating');
      return true;
    }).catchError((error) {
      _isLoading = false;
      print(error);
      notifyListeners();
      return false;
    });
  }

Future<Null> fetchWhishlitProducts({onlyForUser = false}) {
    _isLoading = true;
    notifyListeners();
    return http
        .get(
            'https://freebies-96dc8-default-rtdb.firebaseio.com/Products.json') // here in the of this link we are accessing the token of authenticated user
        .then<Null>((http.Response response) {
      final List<Product> fetchedProductslist = [];
      final Map<String, dynamic> productListData = json.decode(response.body);
      if (productListData == null) {
        _isLoading = false;
        notifyListeners();
        return;
      }

      try {
        productListData.forEach((productId, dynamic productData) {
          final Product product = Product(
              id: productId,
              tittle: productData['tittle'],
              description: productData['description'],
              image: productData['image'],
              price: productData['price'],
              userId: productData['UserID'],
               isfavourite: productData['isFavourite'],

              isFeatured: productData['isFeatured'],
             );
          fetchedProductslist.add(product);
          print(product.id);
        });
        _products = onlyForUser ?  fetchedProductslist.where((Product product)  {// this 'WHERE method' will give all the products of authenticated userId
        return product.userId == _authenticationUser.id;
        
      }).toList() : fetchedProductslist;
      print('sadd');
      print('length ${_products.length}');
        _isLoading = false;
        notifyListeners();
        _selServiceId = null;
      } catch (e) {
        print('jjjjjjjjjjjjjj');
        print('erroe;');
        print(e);
      }
    }).catchError((error) {
      _isLoading = false;
      notifyListeners();
      return;
    });
  }



  Future<Null> fetchProducts({onlyForUser = false}) {
    _isLoading = true;
    notifyListeners();
    return http
        .get(
            'https://freebies-96dc8-default-rtdb.firebaseio.com/Products.json') // here in the of this link we are accessing the token of authenticated user
        .then<Null>((http.Response response) {
      final List<Product> fetchedProductslist = [];
      final Map<String, dynamic> productListData = json.decode(response.body);
      if (productListData == null) {
        _isLoading = false;
        notifyListeners();
        return;
      }

      try {
        productListData.forEach((productId, dynamic productData) {
          final Product product = Product(
              id: productId,
              tittle: productData['tittle'],
              description: productData['description'],
              image: productData['image'],
              price: productData['price'],
              userId: productData['UserID'],
               isfavourite:productData['wishlistUsers'] == null ? false : (productData['wishlistUsers'] as Map<String, dynamic>).containsKey(_authenticationUser.fireBaseID),
              isFeatured: productData['isFeatured'],
             );
        print('status   ${product.isfavourite} ');
          fetchedProductslist.add(product);
          print(product.id);
        });
        _products = onlyForUser
            ? fetchedProductslist.where((Product product) {
                // this 'WHERE method' will give all the products of authenticated userId
                return product.userId == _authenticationUser.id;
              }).toList()
            : fetchedProductslist;
        _isLoading = false;
        notifyListeners();
        _selServiceId = null;
      } catch (e) {
        print('xxxxxxxxxxx');
        print('erroe;');
        print(e);
      }
    }).catchError((error) {
      _isLoading = false;
      notifyListeners();
      return;
    });
  }

  void favouiteToogleButton() async {
   print('in fav');
    final bool isCurrentStatus = selectedProduct.isfavourite;
    print('currentStatus $isCurrentStatus');
    final bool currentFavStatus = !isCurrentStatus;
        print('currentFavStatus $currentFavStatus');

    final Product updatedProduct = Product(
      id: selectedProduct.id,
      tittle: selectedProduct.tittle,
      description: selectedProduct.description,
      price: selectedProduct.price,
      image: selectedProduct.image,
      isFeatured: selectedProduct.isFeatured,
      userId: selectedProduct.userId,
      isfavourite: currentFavStatus,
    );
    _products[selectedProductIndex] = updatedProduct;
    notifyListeners();
    http.Response response;
    if (currentFavStatus) {
      response = await http.put(
          'https://freebies-96dc8-default-rtdb.firebaseio.com/Products/${selectedProduct.id}/wishlistUsers/${_authenticationUser.fireBaseID}.json',
          body: json.encode(true));
    } else {
      response = await http.delete(
          'https://freebies-96dc8-default-rtdb.firebaseio.com/Products/${selectedProduct.id}/wishlistUsers/${_authenticationUser.fireBaseID}.json');
    }
    if (response.statusCode != 200 && response.statusCode != 201) {
      final Product updatedProduct = Product(
        id: selectedProduct.id,
        tittle: selectedProduct.tittle,
        description: selectedProduct.description,
        price: selectedProduct.price,
        image: selectedProduct.image,
        isFeatured: selectedProduct.isFeatured,
        userId: selectedProduct.userId,
        isfavourite: !currentFavStatus,
      );

      _products[selectedProductIndex] = updatedProduct;
      _selServiceId = null;
      notifyListeners();
    }
  }

Future<bool> delService() async {
    _isLoading = true;
  String  id=selectedProduct.id;
  print(id);
    notifyListeners();
try {
   http.Response response= await http.delete(
          'https://freebies-96dc8-default-rtdb.firebaseio.com/Products/$id.json');

 if (response.statusCode != 200 && response.statusCode != 201) {
        _isLoading = false;
        print('Data not Send');
        notifyListeners();
        return false;
      }
      print('DAta Send');
      _isLoading = false;
      notifyListeners();
   _products.removeAt(selectedProductIndex);
   selectProudct(null);
   _selServiceId=null;
      return true;
} catch (e) {
   _isLoading = false;
   print(e);
      notifyListeners();
      return false;
}

  }

}

mixin UserModel on ConnectedServicesModel {
  Timer _authTimer;
 



 int get selectedUserIndex {
    return _users.indexWhere((User product) {
      return product.id == _selcectedUserID;
    });
  }



  User get user {
    if (_selcectedUserID == null) {
      return null;
    }
    return _users.firstWhere((User user) {
      return user.id == _selcectedUserID;
    });
  }

  String get selectedUserId {
    return _selcectedUserID;
  }

  selectUser(String user) {
    //this functions helps us in slecting the product with its index or postion
    _selcectedUserID = user;
    if (_selServiceId != null) {
      notifyListeners();
    }
  }

  User get singleUser {
    return _authenticationUser;
  }

  List<User> get allusers {
    return List.from(_users);
  }
  



Future<Null>fetchUsers(){
_isLoading = true;
    notifyListeners();
    return http
        .get(
            'https://freebies-96dc8-default-rtdb.firebaseio.com/User.json') // here in the of this link we are accessing the token of authenticated user
        .then<Null>((http.Response response) {
      final List<User> fetchedProductslist = [];
      final Map<String, dynamic> productListData = json.decode(response.body);
      if (productListData == null) {
        _isLoading = false;
        notifyListeners();
        return;
      }

      try {
        productListData.forEach((productId, dynamic productData) {
         final User allUsers=User(
          isAccepted: productData['isAcepted'],
              pass: productData['password'],
              id: productId,
              address: productData['address'],
              cnic: productData['cnic'],
              email: productData['email'],
              fireBaseID: productData['fireBaseID'],
              image: productData['image'],
              isProvider: productData['isProvider'],
              name: productData['name'],
              number: productData['number'],
              token: 'null',
              wallet: productData['wallet'].toString());
         
          fetchedProductslist.add(allUsers);
         
        });
      _users =  fetchedProductslist.where((User user) {
               
                return user.isAccepted==false && user.isProvider==true;
              }).toList();
        _isLoading = false;
        notifyListeners();
        _selServiceId = null;
      } catch (e) {
        print('erroe;');
        print(e);
      }
    }).catchError((error) {
      _isLoading = false;
      notifyListeners();
      return;
    });






}

Future<bool> approvedProviders(User authUser){
//   _isLoading=true;
// var id=accptedUser.id;
//   final Map<String, dynamic> userData = {
//           'email': accptedUser.email,
//           'password':accptedUser.pass,
//           'address':accptedUser. address,
//           'name': accptedUser.name,
//           'cnic':accptedUser. cnic,
//           'wallet':accptedUser.wallet,
//           'number':accptedUser. number,
//           'isProvider':accptedUser.isProvider,
//           'image':accptedUser. image,
//           'FireBaseID':accptedUser.fireBaseID,
//           'isAcepted':true
//         };
// return http.put(
//         'https://freebies-96dc8-default-rtdb.firebaseio.com/User/$id.json',
//         body: json.encode(userData),
//         headers: {
//           HttpHeaders.contentTypeHeader: 'application/json'
//         })

_isLoading = true;

    print('in Accept request');
    
    
    final Map<String, dynamic> userData = {
      'email': authUser.email,
      'password': authUser.pass,
      'address': authUser.address,
      'name': authUser.name,
      'cnic': authUser.cnic,
      'isAcepted':true,
      'wallet':authUser.wallet,
      'number': authUser.number,
      'isProvider': authUser.isProvider,
      'image': authUser.image,
      'FireBaseID': authUser.fireBaseID,
      
    };
  
  
    String id = authUser.id;
    print('in deposite');
    return http.put(
        'https://freebies-96dc8-default-rtdb.firebaseio.com/User/$id.json',
        body: json.encode(userData),
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json'
        }).then((http.Response response) {
      print('object');
      final Map<String, dynamic> productListData = json.decode(response.body);

      print(productListData);
_users.removeAt(selectedUserIndex);
          
      _isLoading = false;
      notifyListeners();
      print('kkkkk');
      return true;
    }).catchError((error) {
      _isLoading = false;
      print(error);
      notifyListeners();
      return false;
    });
  
        
  
}














   Future<Map<String, dynamic>> venderSignUp(
      String email,
      String password,
      AuthMode mode,
      String address,
      String name,
      String cnic,
      String number,
      bool isProvider,
      String image) async {
    bool hasError = true;
    String message = 'Some thing went wrong';

    _isLoading = true;
    notifyListeners();
    final Map<String, dynamic> authData = {
      'email': email,
      'password': password,
      'returnSecureToken': true
    };
    Map<String, dynamic> responseData;

    http.Response response;
    http.Response userResponse;

    if (mode == AuthMode.VendorSignup ) {
      response = await http.post(
        'https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=AIzaSyA6m-v4a4GVBlhWSBmIzLbzWKO1C3JXXbs',
        body: json.encode(authData),
        headers: {'Content-Type': 'application/json'},
      );
      print('sigupDone');

      try {
        responseData = json.decode(response.body);
        final Map<String, dynamic> userData = {
          'email': email,
          'password': password,
          'address': address,
          'name': name,
          'cnic': cnic,
          'wallet': '0',
          'number': number,
          'isProvider': isProvider,
          'image': image,
          'FireBaseID': responseData['localId'],
          'isAcepted':false
        };

        userResponse = await http.post(
            'https://freebies-96dc8-default-rtdb.firebaseio.com/User.json',
            body: json.encode(userData));
        var userResponsess = userResponse.body;
        print('userRespone $userResponsess');
        if (response.statusCode != 200 && response.statusCode != 201) {
          print('Usetadded');
        }
      } catch (error) {
        _isLoading = false;
        print('errror: $error');
        notifyListeners();
      }
    }

    print('1');
    final Map<String, dynamic> userResponseData =
        json.decode(userResponse.body);

    print('2');

    if (responseData.containsKey('idToken')) {
      hasError = false;
      message = 'Authentication Successeded';
      print('3');

      _authenticationUser = User(
        isAccepted:false ,
          pass: password,
          fireBaseID: responseData['localId'],
          id: userResponseData['name'],
          email: email,
          token: responseData['idToken'],
          address: address,
          wallet: '0',
          image: image,
          isProvider: isProvider,
          cnic: cnic,
          name: name,
          number: number);
      print('4');
      setAuthTimeout(int.parse(responseData['expiresIn']));
      // _userSubject.add(true);
      final DateTime currentTime =
          DateTime.now(); // this line gives us the current time
      final DateTime expiryTime = currentTime
          .add(Duration(seconds: int.parse(responseData['expiresIn'])));
      final SharedPreferences pref = await SharedPreferences
          .getInstance(); //this line allow us to get the access to the shared preffrence(3rd party PACKAGE)  which helps us in getting or allow us a storage on the device
      pref.setString(
          'token',
          responseData[
              'idToken']); // in this line the token is a keyword which will represnt the key of firebase in our auth data which we get on our response
      pref.setString('userEmail', email);
      pref.setString('userId', responseData['localId']);
      pref.setString('uID', responseData['localId']);

      pref.setString('expiryTime', expiryTime.toIso8601String());
    } else if (responseData['error']['message'] == 'EMAIL_EXISTS') {
      message = 'Email Exsist';
    } else if (responseData['error']['message'] == 'EMAIL_NOT_FOUND') {
      message = 'Email Dont Exsist!';
    } else if (responseData['error']['message'] == 'INVALID_PASSWORD') {
      message = 'Invalid Password';
    }
    _isLoading = false;
    notifyListeners();
    return {'success': !hasError, 'message': message};
  }












  Future<bool> vendorSignUpRequest( String email,
      String password,
      AuthMode mode,
      String address,
      String name,
      String cnic,
      String number,
     
      String image) async {
    _isLoading = true;
    notifyListeners();
    final Map<String, dynamic> vendorData = {
      'Name': name,
      'Address': address,
      'Image': image,
      'Cnic': cnic,
      'Number': number,
      'email':email,
      'password': password,
      'IsProvider':true,

    };
    print(vendorData);
    try {
      final http.Response response = await http.post(
          'https://freebies-cf2cd-default-rtdb.firebaseio.com/VendorsRequest.json',
          body: json.encode(vendorData));
      print(response.body);
      print(response.statusCode);
      if (response.statusCode != 200 && response.statusCode != 201) {
        _isLoading = false;
        notifyListeners();
        return false;
      }
      _isLoading = false;
      notifyListeners();
      return true;
    } catch (error) {
      _isLoading = false;
      notifyListeners();
      return false;
    }
  }


Future<Map<String, dynamic>> venderlogIn(String email, String password, AuthMode mode) async {
    bool hasError = true;
        _isLoading = true;

    String message = 'Some thing went wrong';
    notifyListeners();
    final Map<String, dynamic> authData = {
      'email': email,
      'password': password,
      'returnSecureToken': true
    };
    http.Response response;
    if (mode == AuthMode.VendorLogin) {
      response = await http.post(
        'https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=AIzaSyA6m-v4a4GVBlhWSBmIzLbzWKO1C3JXXbs',
        body: json.encode(authData),
        headers: {'Content-type': 'application/json'},
      );

      await http
          .get('https://freebies-96dc8-default-rtdb.firebaseio.com/User.json')
          .then<Null>((http.Response userResponse) {
        final List<User> fetchedProductslist = [];
        print(';;;;');
        final Map<String, dynamic> productListData =
            json.decode(userResponse.body);
        if (productListData == null) {
          print('data not avalble');
        }
        productListData.forEach((String id, dynamic productData) {
          final User product = User(
            isAccepted: productData['isAcepted'],
              pass: productData['password'],
              id: id,
              address: productData['address'],
              cnic: productData['cnic'],
              email: productData['email'],
              fireBaseID: productData['fireBaseID'],
              image: productData['image'],
              isProvider: productData['isProvider'],
              name: productData['name'],
              number: productData['number'],
              token: 'null',
              wallet: productData['wallet'].toString());
          print('in finding user');
          fetchedProductslist.add(product);
        });
        _users = fetchedProductslist;
        // .where((User user) {
        //   return user.isAccepted==true;
        // }).toList();
            
      }).catchError((error) {
        print('error');
        print(error);
      });
   // User userData ;
      final Map<String, dynamic> responseData = json.decode(response.body);
   final userData =   _users.firstWhere((User user) {
    

           return user.email == email;

           
        });
      
     print('good');
//       if(_users.length<=0){
        
//         return {'success': !hasError, 'message': message};
//       }
//       else{
//   userData = _users.firstWhere((User user) {
//           return user.email == email;
//         });
//       }
// bool ss=userData==null?true:false;

      if (responseData.containsKey('idToken')) {
       
       


        print('ok');
        hasError = false;
        message = 'Authentication Successeded';
      
        _authenticationUser = User(
                      isAccepted: userData.isAccepted,

            pass: userData.pass,
            fireBaseID: responseData['localId'],
            id: userData.id,
            email: userData.email,
            token: responseData['idToken'],
            address: userData.address,
            wallet: userData.wallet,
            image: userData.image,
            isProvider:  userData.isProvider,
            cnic:  userData.cnic,
            name: userData.name,
            number:userData.number
            );
print(userData.wallet);
wallet=int.parse(userData.wallet);
        setAuthTimeout(int.parse(responseData['expiresIn']));
        // _userSubject.add(true);
        final DateTime currentTime =
            DateTime.now(); // this line gives us the current time
        final DateTime expiryTime = currentTime
            .add(Duration(seconds: int.parse(responseData['expiresIn'])));
        final SharedPreferences pref = await SharedPreferences
            .getInstance(); //this line allow us to get the access to the shared preffrence(3rd party PACKAGE)  which helps us in getting or allow us a storage on the device
        pref.setString(
            'token',
            responseData[
                'idToken']); // in this line the token is a keyword which will represnt the key of firebase in our auth data which we get on our response
        pref.setString('userEmail', email);
        pref.setString('userId', responseData['localId']);
        pref.setString('uID', responseData['localId']);

        pref.setString('expiryTime', expiryTime.toIso8601String());
      } else if (responseData['error']['message'] == 'EMAIL_EXISTS') {
        message = 'Email Exsist';
      } else if (responseData['error']['message'] == 'EMAIL_NOT_FOUND') {
        message = 'Email Dont Exsist!. Verfication Pending ';
      } else if (responseData['error']['message'] == 'INVALID_PASSWORD') {
        message = 'Invalid Password';
      }
      else if (userData==null) {
        message = 'Your Verification is pending';
      }
      _isLoading = false;
      notifyListeners();
      return {'success': !hasError, 'message': message};
    }
    
  }












  Future<Map<String, dynamic>> logIn(String email, String password, AuthMode mode) async {
    bool hasError = true;
        _isLoading = true;

    String message = 'Some thing went wrong';
    notifyListeners();
    final Map<String, dynamic> authData = {
      'email': email,
      'password': password,
      'returnSecureToken': true
    };
    http.Response response;
    if (mode == AuthMode.Login ) {
      response = await http.post(
        'https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=AIzaSyA6m-v4a4GVBlhWSBmIzLbzWKO1C3JXXbs',
        body: json.encode(authData),
        headers: {'Content-type': 'application/json'},
      );

      await http
          .get('https://freebies-96dc8-default-rtdb.firebaseio.com/User.json')
          .then<Null>((http.Response userResponse) {
        final List<User> fetchedProductslist = [];
        print(';;;;');
        final Map<String, dynamic> productListData =
            json.decode(userResponse.body);
        if (productListData == null) {
          print('data not avalble');
        }
        productListData.forEach((String id, dynamic productData) {
          final User product = User(
            isAccepted: productData['isAcepted'],
              pass: productData['password'],
              id: id,
              address: productData['address'],
              cnic: productData['cnic'],
              email: productData['email'],
              fireBaseID: productData['fireBaseID'],
              image: productData['image'],
              isProvider: productData['isProvider'],
              name: productData['name'],
              number: productData['number'],
              token: 'null',
              wallet: productData['wallet'].toString());
          print('in finding user');
          fetchedProductslist.add(product);
        });
        _users = fetchedProductslist;
            _isLoading = false;

      }).catchError((error) {
        print('error');
        print(error);
      });
      print('good..................');

      final Map<String, dynamic> responseData = json.decode(response.body);
      //  final Map<String, dynamic> userResponseData = json.decode(userResponse.body);

      print('good');

      if (responseData.containsKey('idToken')) {
        print("userFounding");
        User userData = _users.firstWhere((User user) {
          return user.email == email ;// && user.isProvider==true;
        });
        print('ok');
        hasError = false;
        message = 'Authentication Successeded';
      
        _authenticationUser = User(
                      isAccepted: userData.isAccepted,

            pass: userData.pass,
            fireBaseID: responseData['localId'],
            id: userData.id,
            email: userData.email,
            token: responseData['idToken'],
            address: userData.address,
            wallet: userData.wallet,
            image: userData.image,
            isProvider:  userData.isProvider,
            cnic:  userData.cnic,
            name: userData.name,
            number: userData.number
            );
print(userData.wallet);
wallet=int.parse(userData.wallet);
        setAuthTimeout(int.parse(responseData['expiresIn']));
        // _userSubject.add(true);
        final DateTime currentTime =
            DateTime.now(); // this line gives us the current time
        final DateTime expiryTime = currentTime
            .add(Duration(seconds: int.parse(responseData['expiresIn'])));
        final SharedPreferences pref = await SharedPreferences
            .getInstance(); //this line allow us to get the access to the shared preffrence(3rd party PACKAGE)  which helps us in getting or allow us a storage on the device
        pref.setString(
            'token',
            responseData[
                'idToken']); // in this line the token is a keyword which will represnt the key of firebase in our auth data which we get on our response
        pref.setString('userEmail', email);
        pref.setString('userId', responseData['localId']);
        pref.setString('uID', responseData['localId']);

        pref.setString('expiryTime', expiryTime.toIso8601String());
      } else if (responseData['error']['message'] == 'EMAIL_EXISTS') {
        message = 'Email Exsist';
      } else if (responseData['error']['message'] == 'EMAIL_NOT_FOUND') {
        message = 'Email Dont Exsist!. Verfication Pending ';
      } else if (responseData['error']['message'] == 'INVALID_PASSWORD') {
        message = 'Invalid Password';
      }
      else{
        
      }
      _isLoading = false;
      notifyListeners();
      return {'success': !hasError, 'message': message};
    }
    else{
            return {'success': hasError, 'message': message};

    }
  }

 


Future<bool> deductFromUSerWallet(User authUser){


  _isLoading = true;

    print('deposite');
    
    print('previous');
    print('depositeAmount');
    
   print(wallet);
    print('result');
    final Map<String, dynamic> userData = {
      'email': authUser.email,
      'password': authUser.pass,
      'address': authUser.address,
      'name': authUser.name,
      'cnic': authUser.cnic,
      'isAcepted':authUser.isAccepted,
      'wallet': wallet,
      'number': authUser.number,
      'isProvider': authUser.isProvider,
      'image': authUser.image,
      'FireBaseID': authUser.fireBaseID,
      
    };
  
  
    String id = authUser.id;
    print('in deposite');
    return http.put(
        'https://freebies-96dc8-default-rtdb.firebaseio.com/User/$id.json',
        body: json.encode(userData),
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json'
        }).then((http.Response response) {
      print('object');
      final Map<String, dynamic> productListData = json.decode(response.body);

      print(productListData);

      User newUser = User(
                    isAccepted: authUser.isAccepted,

          pass: authUser.pass,
          fireBaseID: authUser.fireBaseID,
          id: authUser.id,
          email: authUser.email,
          token: authUser.token,
          address:authUser.address,
          wallet: productListData['wallet'].toString(),
          image: authUser.image,
          isProvider: true,//'authUser.isProvider', // userData.isProvider,
          cnic: authUser.cnic, // userData.cnic,
          name: authUser.name,
          number: authUser.number //userData.number
          );
          
   //   clear();
_authenticationUser = newUser;
      print('saad');
      id = null;
      _isLoading = false;
      notifyListeners();
      print('kkkkk');
      return true;
    }).catchError((error) {
      _isLoading = false;
      print(error);
      notifyListeners();
      return false;
    });
  
}

  Future<bool> depositeToUserWallet(User authUser,{String sourceOfMoney}) {



if (sourceOfMoney =='Vedio Points') {
  
    _isLoading = true;

    print('deposite');
    
    print('previous');
    print('depositeAmount');
     wallet = wallet+5;
   print(wallet);
    print('result');
    final Map<String, dynamic> userData = {
      'email': authUser.email,
      'password': authUser.pass,
      'address': authUser.address,
      'name': authUser.name,
      'cnic': authUser.cnic,

      'wallet': wallet,
      'number': authUser.number,
      'isProvider': authUser.isProvider,
      'image': authUser.image,
      'FireBaseID': authUser.fireBaseID,
    };
  
  
    String id = authUser.id;
    print('in deposite');
    return http.put(
        'https://freebies-96dc8-default-rtdb.firebaseio.com/User/$id.json',
        body: json.encode(userData),
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json'
        }).then((http.Response response) {
      print('object');
      final Map<String, dynamic> productListData = json.decode(response.body);

      print(productListData);

      User newUser = User(
                    isAccepted: authUser.isAccepted,

          pass: authUser.pass,
          fireBaseID: authUser.fireBaseID,
          id: authUser.id,
          email: authUser.email,
          token: authUser.token,
          address: authUser.address,
          wallet: productListData['wallet'],
          image: authUser.image,
          isProvider: authUser.isProvider, // userData.isProvider,
          cnic: authUser.cnic, // userData.cnic,
          name: authUser.name,
          number: authUser.number //userData.number
          );
      clear();
      _authenticationUser = newUser;
      id = null;
      _isLoading = false;
      notifyListeners();
      return true;
    }).catchError((error) {
      _isLoading = false;
      notifyListeners();
      return false;
    });
} else {
}

    _isLoading = true;

    print('deposite');
    
    print('previous');
    print('depositeAmount');
   
    print('result');

        wallet = wallet+10;

    final Map<String, dynamic> userData = {
      'email': authUser.email,
      'password': authUser.pass,
      'address': authUser.address,
      'name': authUser.name,
      'cnic': authUser.cnic,
      'wallet': wallet,
      'number': authUser.number,
      'isProvider': authUser.isProvider,
      'image': authUser.image,
      'FireBaseID': authUser.fireBaseID,
    };
  
  
    String id = authUser.id;
    print('in deposite');
    return http.put(
        'https://freebies-96dc8-default-rtdb.firebaseio.com/User/$id.json',
        body: json.encode(userData),
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json'
        }).then((http.Response response) {
      print('object');
      final Map<String, dynamic> productListData = json.decode(response.body);

      print(productListData);

      User newUser = User(
                    isAccepted: authUser.isAccepted,

          pass: authUser.pass,
          fireBaseID: authUser.fireBaseID,
          id: authUser.id,
          email: authUser.email,
          token: authUser.token,
          address: authUser.address,
          wallet: productListData['wallet'],
          image: authUser.image,
          isProvider: authUser.isProvider, // userData.isProvider,
          cnic: authUser.cnic, // userData.cnic,
          name: authUser.name,
          number: authUser.number //userData.number
          );
      clear();
      _authenticationUser = newUser;
      wallet=newUser.wallet as int;
      notifyListeners();
            id = null;
      _isLoading = false;
      notifyListeners();
      return true;
    }).catchError((error) {
      _isLoading = false;
      notifyListeners();
      return false;
    });



  }

  void clear() {
    _authenticationUser = null;
  }

  Future<Map<String, dynamic>> signUp(
      String email,
      String password,
      AuthMode mode,
      String address,
      String name,
      String cnic,
      String number,
      bool isProvider,
      String image) async {
    bool hasError = true;
    String message = 'Some thing went wrong';

    _isLoading = true;
    notifyListeners();
    final Map<String, dynamic> authData = {
      'email': email,
      'password': password,
      'returnSecureToken': true
    };
    Map<String, dynamic> responseData;

    http.Response response;
    http.Response userResponse;

    if (mode == AuthMode.SignUp ) {
      response = await http.post(
        'https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=AIzaSyA6m-v4a4GVBlhWSBmIzLbzWKO1C3JXXbs',
        body: json.encode(authData),
        headers: {'Content-Type': 'application/json'},
      );
      print('sigupDone');

      try {
        responseData = json.decode(response.body);
        final Map<String, dynamic> userData = {
          'email': email,
          'password': password,
          'address': address,
          'name': name,
          'cnic': cnic,
          'wallet': '0',
          'number': number,
          'isProvider': isProvider,
          'image': image,
          'FireBaseID': responseData['localId'],
          'isAcepted':false
        };

        userResponse = await http.post(
            'https://freebies-96dc8-default-rtdb.firebaseio.com/User.json',
            body: json.encode(userData));
        var userResponsess = userResponse.body;
        print('userRespone $userResponsess');
        if (response.statusCode != 200 && response.statusCode != 201) {
          print('Usetadded');
        }
      } catch (error) {
        _isLoading = false;
        print('errror: $error');
        notifyListeners();
      }
    }

    print('1');
    final Map<String, dynamic> userResponseData =
        json.decode(userResponse.body);

    print('2');

    if (responseData.containsKey('idToken')) {
      hasError = false;
      message = 'Authentication Successeded';
      print('3');

      _authenticationUser = User(
        isAccepted:false ,
          pass: password,
          fireBaseID: responseData['localId'],
          id: userResponseData['name'],
          email: email,
          token: responseData['idToken'],
          address: address,
          wallet: '0',
          image: image,
          isProvider: isProvider,
          cnic: cnic,
          name: name,
          number: number);
      print('4');
      setAuthTimeout(int.parse(responseData['expiresIn']));
      // _userSubject.add(true);
      final DateTime currentTime =
          DateTime.now(); // this line gives us the current time
      final DateTime expiryTime = currentTime
          .add(Duration(seconds: int.parse(responseData['expiresIn'])));
      final SharedPreferences pref = await SharedPreferences
          .getInstance(); //this line allow us to get the access to the shared preffrence(3rd party PACKAGE)  which helps us in getting or allow us a storage on the device
      pref.setString(
          'token',
          responseData[
              'idToken']); // in this line the token is a keyword which will represnt the key of firebase in our auth data which we get on our response
      pref.setString('userEmail', email);
      pref.setString('userId', responseData['localId']);
      pref.setString('uID', responseData['localId']);

      pref.setString('expiryTime', expiryTime.toIso8601String());
    } else if (responseData['error']['message'] == 'EMAIL_EXISTS') {
      message = 'Email Exsist';
    } else if (responseData['error']['message'] == 'EMAIL_NOT_FOUND') {
      message = 'Email Dont Exsist!';
    } else if (responseData['error']['message'] == 'INVALID_PASSWORD') {
      message = 'Invalid Password';
    }
    _isLoading = false;
    notifyListeners();
    return {'success': !hasError, 'message': message};
  }

// void passReset(String email)async{

// _isLoading = true;
//     notifyListeners();
//     final Map<String, dynamic> authData = {
//       'email': email,

//       'requestType': 'PASSWORD_RESET'
//     };
//        http.Response response;
//  response = await http.post(
//         'https://identitytoolkit.googleapis.com/v1/accounts:sendOobCode?key=AIzaSyCVBrmJL1086ni7ZxZwVwy59h4nWJ4H7ks',
//         body: json.encode(authData),
//         headers: {'Content-type': 'application/json'},
//       );
// print(response.body);
// _isLoading=false;
// notifyListeners();

// }


  void logout() async {
    print('Logout');
    _authenticationUser = null;
    _authTimer.cancel();
    wallet=0;
 notifyListeners();
  }

Future<bool> updateProfileData(String name,String number,String address,String image,)async{
_isLoading=true;
notifyListeners();




Map<String ,dynamic>profileData={
'pass':_authenticationUser.pass,
'email':_authenticationUser.email,
'name':name,
'token':null,
'firebaseId':_authenticationUser.fireBaseID,
'number':number,
'address':address,
'image':image,
'isProvider':_authenticationUser.isProvider,
'wallet':_authenticationUser.wallet,
'cnic':_authenticationUser.cnic,
'isAcepted':_authenticationUser.isAccepted



};

try {
      final http.Response response = await http.put(
          'https://freebies-96dc8-default-rtdb.firebaseio.com/User/${_authenticationUser.id}.json',
          body: json.encode(profileData),);

      if (response.statusCode != 200 && response.statusCode != 201) {
        print('Sending error');
        print(response.statusCode );
        _isLoading = false;
        notifyListeners();
        return false;
      }

print(response.statusCode);
print(response.body);
      _isLoading = false;
      notifyListeners();
      return true ;
    } catch (error) {
      print(error);
      _isLoading = false;
      notifyListeners();
      return false;
    }

}


// Future<void> fetchProfileData()async{

// _isLoading = true;
//     notifyListeners();
//     return http
//         .get('https://socialservices-6478e-default-rtdb.firebaseio.com/Profile.json')// here in the of this link we are accessing the token of authenticated user
//         .then<Null>((http.Response response) {
//      final  List<UserT> fetchedProductslist = [];
//       final Map<String, dynamic> productListData = json.decode(response.body);
//       if (productListData == null) {
//         _isLoading = false;
//         notifyListeners();
//        selected=false;
//         print('data not fetched');
//         return;
//       }

//       try {

//          productListData.forEach((String id, dynamic data) {

//        UserT profile = UserT(
//          id: id,
//           email: data['email'],
//           token: null,
//           address:data['address'],
//           firebaseId:data['firebaseId'],
//           imag:data['image'],
//           name: data['name'],
//           number: data['mobileNo'] );

// fetchedProductslist.add(profile);

// try {
//    profiles=fetchedProductslist.where((UserT user) {

//         return user.firebaseId ==_authenticationUser.id;

//       }).toList();
// } catch (e) {
//   print('erroe0');
//   print(e);
// }

//       print('out');
//       selected=true;
// //selectProudct(_authenticationUser.id);
// _isLoading = false;

//       notifyListeners();
//       });
//       } catch (e) {
//         print('error1');
//         _isLoading = false;
//       notifyListeners();
//         print(e);
//       }

//     }).catchError((error) {
//       _isLoading = false;
//       print('erroe2');
//       print(error);
//       notifyListeners();
//       return;
//     });
//   }

  void setAuthTimeout(int time) {
    _authTimer = Timer(Duration(seconds: time), logout);
  }
}

mixin GamesModel on ConnectedServicesModel {
  List<Games> get allGames {
    // this is a getter function which will give us all products in the list
    return List.from(
        _games); // thid line ensure us not to add or delete in orignal list but make a copy of orignal list and then make changes to it and then pass it to orignal list
  }

  String get selcectedGameId {
    // this is a getter  function which returns the index of selected product
    return _selcectedGameId;
  }

  Games get selcectedGame {

    if (_selcectedGameId == null) {
      return null;
    }
    return _games.firstWhere((Games game) {
      // this is buildin function of list whcih will give the single product from list

      return game.id == _selcectedGameId;
    });
  }

  int get selcectedGameIndex {
    return _games.indexWhere((Games game) {
      //  this is buildin function of list whcih will give the postion of product in the list or we can say give us the index
      return game.id == _selcectedGameId;
    });
  }

  void selectGame(String gameID) {
    //this functions helps us in slecting the product with its index or postion
    _selcectedGameId = gameID;
    if (_selcectedGameId != null) {
      notifyListeners();
    }
  }

  Future<bool> addGame(
    
      String tittle, String link, String image, ) async {
    _isLoading = true;
    notifyListeners();
    final Map<String, dynamic> gametData = {
      'name': tittle,
      'link': link,
      'image': image,
  
    };
print('in add games');
    try {
      final http.Response response = await http.post(
          'https://freebies-96dc8-default-rtdb.firebaseio.com/Games.json',
          body: json.encode(gametData),
          headers: {HttpHeaders.contentTypeHeader: 'application/json'});

      if (response.statusCode != 200 && response.statusCode != 201) {
        _isLoading = false;
        notifyListeners();
        return false;
      }
print(response.body);
      _isLoading = false;
      notifyListeners();
      return true;
    } catch (error) {
      print(error);
      _isLoading = false;
      notifyListeners();
      return false;
    }
  }

  Future fetchGames() {
    print('in fetch games');
   _isLoading = true;
    notifyListeners();
    return http
        .get(
            'https://freebies-96dc8-default-rtdb.firebaseio.com/Games.json') // here in the of this link we are accessing the token of authenticated user
        .then<Null>((http.Response response) {

          print(response.body);
      final List<Games> fetchedProductslist = [];
      final Map<String, dynamic> productListData = json.decode(response.body);
      if (productListData == null) {
        _isLoading = false;
        notifyListeners();
        return;
      }
      try {
        productListData.forEach((productId, dynamic productData) {
          final Games product = Games(
            tittle: productData['tittle'],
            id:productId,
           link:productData ['link'], 
           picture:productData ['image']);
          fetchedProductslist.add(product);
          print(product.id);
        });
        print(fetchedProductslist);

        _games =  fetchedProductslist;
        _isLoading = false;
        notifyListeners();
        _selServiceId = null;
      } catch (e) {
        print('erroe;');
        print(e);
      }
    }).catchError((error) {
      _isLoading = false;
      notifyListeners();
      return;
    });
  }


Future<bool> delGame() async {
  print('in del games');
    _isLoading = true;
  String  id=selcectedGame.id;
    notifyListeners();
try {
   http.Response response= await http.delete(
          'https://freebies-96dc8-default-rtdb.firebaseio.com/Games/$id.json');

 if (response.statusCode != 200 && response.statusCode != 201) {
        _isLoading = false;
        print('Data not Send');
        notifyListeners();
        return false;
      }
      print('DAta Send');
      _isLoading = false;
      notifyListeners();
   _games.removeAt(selcectedGameIndex);
   selectGame(null);
   _selServiceId=null;
      return true;
} catch (e) {
   _isLoading = false;
   print(e);
      notifyListeners();
      return false;
}

  }


Future<bool> updateGame(
     
      String tittle,
      String link,
      String img,
      ) {
    print('in ipdate game');
    _isLoading = true;
    notifyListeners();
  String  id=selcectedGame.id;



    Map<String, dynamic> updatedData = {
      'tittle': tittle,
      'link': link,
      'image':
          'https://www.bentleymotors.com/content/dam/bentley/Master/Models/Hero/New%20Continental%20GT%20V8/Bentley-Continental-GT-V8-static-front-1920x670.jpg/_jcr_content/renditions/Bentley-Continental-GT-V8-static-front-699x309.jpg./Bentley-Continental-GT-V8-static-front-699x309.jpg',
     
    };
    return http
        .put(
            'https://freebies-96dc8-default-rtdb.firebaseio.com/Games/$id.json',
            body: json.encode(updatedData))
        .then((http.Response response) {
      _isLoading = false;




      final Games game = Games(
          id: id,
          tittle: tittle,
          link: link,
          picture: img,
          );
      _games[selcectedGameIndex] = game;
      notifyListeners();
      return true;
    }).catchError((error) {
      _isLoading = false;
      print('eeror');
      print(error);
      notifyListeners();
      return false;
    });
  }


}



















mixin OrderModel on ConnectedServicesModel {
  //bool _showFavorites = false;

  List<Orders> get allorders {
    return List.from(orders);
  }

 
  List<Orders> get displayorders {
   

    return List.from(orders);
  }

  String get selectedProductId {
    return _selServiceId;
  }

  Orders get selectedOrder {
    if (selectedProductId == null) {
      return null;
    }
    return orders.firstWhere((Orders product) {
      return product.uid == _authenticationUser.id;
    });
  }

  int get selectedOrderIndex {
    return orders.indexWhere((Orders service) {
      return service.orderID == _selServiceId;
    });
  }

  

  selectOrder(String productId) {
    //this functions helps us in slecting the product with its index or postion
    _selServiceId = productId;
    if (_selServiceId != null) {
      notifyListeners();
    }
  }

  Future<bool> placeOrder(
List<Product>  allCartItems,
List<String> providerIDS,
  String uid,
  int price,//price
  String time,//time
  String date,//date
  {String status ='incomplete'}
  ) async {
  
  
    _isLoading = true;
    notifyListeners();
    final Map<String, dynamic> orderData = {
   'uid':uid,
   'price':price,
   'time':time,
   'date':date,
   'status':status,
   'allCartItems':allCartItems,
   'providers':providerids
    };
    print(orderData);
    try {
      final http.Response response = await http.post(
          'https://freebies-96dc8-default-rtdb.firebaseio.com/Order.json',
          body: json.encode(orderData),);

      if (response.statusCode != 200 && response.statusCode != 201) {
        print('object');
        print(response.statusCode );
        _isLoading = false;
        notifyListeners();
        return false;
      }
print(response.statusCode);
print(response.body);
      _isLoading = false;
      notifyListeners();
      return true;
    } catch (error) {
      print(error);
      _isLoading = false;
      notifyListeners();
      return false;
    }
  }

  Future<bool> markAsCompleted(
  String ids,
  String mainServiseID,//'id'
  String subServiceID,//'_id'
  String uid,//userId
  String providerID,//firebase_id
  double price,//price
  String time,//time
  String date,//date
  String orderDetails,//orderDetails
  String _providerName,//
  String _subServiceName,
  String image,
  {String status ='completed'}
  ) {
        print('saad dew');
        print(ids);
    _isLoading = true;
    notifyListeners();
    var id=ids;
    final Map<String, dynamic> orderData = {
       'mainServiseID':mainServiseID,
   'subServiceID':subServiceID,
   'uid':uid,
   'providerID':providerID,
   'price':price,
   'time':time,
   'date':date,
   'orderDetails':orderDetails,
   '_providerName':_providerName,
   '_subServiceName':_subServiceName,
   'image':image,
   'status':status,
   
    };
    try {
      return http
        .put(
            'https://socialservices-6478e-default-rtdb.firebaseio.com/Orders/$id.json',
            body: json.encode(orderData))
        .then((http.Response response) {
          print(response.body);
      _isLoading = false;
       orders.removeAt(selectedOrderIndex);
      notifyListeners();
     
      return true;
    });
    } 
    catch (e) {
      print(e);
      _isLoading = false;
      notifyListeners();
      return false as Future<bool>;
    }
    
  }


  Future<Null> fetchOrders(String requestType) {
    print('inFetchimh order');
    _isLoading = true;
    notifyListeners();
    return http
        .get('https://socialservices-6478e-default-rtdb.firebaseio.com/Orders.json')// here in the of this link we are accessing the token of authenticated user
        .then<Null>((http.Response response) {
      final List<Orders> fetchedProductslist = [];
      final Map<String, dynamic> productListData = json.decode(response.body);
      if (productListData == null) {
        _isLoading = false;
        notifyListeners();
        print('data not fetched');
        return;
      }
      productListData.forEach((String id, dynamic _order) {
  
          Orders ordeer = Orders(
providerIDS: _order['providers'],
        cartItems: _order['allCartItems'],
        uid: _order['uid'],
        price: _order['price'],
        time: _order['time'],
        date: _order['date'],
        status: _order['status'],
        orderID: id);
fetchedProductslist.add(ordeer);
       });
       print('orders');
print(fetchedProductslist);
   if (requestType =='user') {
   
//    orders =  fetchedProductslist.where((Orders order)  {// this 'WHERE method' will give all the products of authenticated userId
// var orderrr=order.cartItems.asMap();//((Product pp) => );
//         return orderrr
        
//       }).toList();
//       _isLoading = false;
//       notifyListeners();
      }

       else if(requestType =='provider') {
    orders =  fetchedProductslist.where((Orders order)  {// this 'WHERE method' will give all the products of authenticated userId
         
        
       return order.providerIDS.contains(_authenticationUser.id);
        
              
        
      }).toList();
      _isLoading = false;
      notifyListeners();
   }    
 else if(requestType =='admin') {
    orders =  fetchedProductslist.where((Orders order)  {// this 'WHERE method' will give all the products of authenticated userId
        return order.status == 'completed';
        
      }).toList();
      _isLoading = false;
      notifyListeners();
   }    
      
    }).catchError((error) {
      print('error');
      print(error);
      _isLoading = false;

      notifyListeners();
      return;
    });
  }







}





mixin VediosModel on ConnectedServicesModel {


  List<Vedios> get allvedios {
    return List.from(_vedioList);
  }

  List<Vedios> get displayVedios {
    return List.from(_vedioList);
  }

  String get selectedVedioId {
    return _selcectedVedioId;
  }

  Vedios get selectedVedio {
    if (_selcectedVedioId == null) {
      return null;
    }
    return _vedioList.firstWhere((Vedios vedio) {
      return vedio.id == _selcectedVedioId;
    });
  }

  int get selectedVedioIndex {
    return _vedioList.indexWhere((Vedios vedio) {
      return vedio.id == _selcectedVedioId;
    });
  }



  selectVedio(String productId) {
    //this functions helps us in slecting the product with its index or postion
    _selcectedVedioId = productId;
    if (_selServiceId != null) {
      notifyListeners();
    }
  }



Future<bool> addVedio(
    
      String tittle, String link, String image, ) async {
    _isLoading = true;
    notifyListeners();
    final Map<String, dynamic> gametData = {
      'tittle': tittle,
      'link': link,
      'image': image,
    };
print('in add games');
    try {
      final http.Response response = await http.post(
          'https://freebies-96dc8-default-rtdb.firebaseio.com/Vedio.json',
          body: json.encode(gametData),
          headers: {HttpHeaders.contentTypeHeader: 'application/json'});

      if (response.statusCode != 200 && response.statusCode != 201) {
        _isLoading = false;
        notifyListeners();
        return false;
      }
print(response.body);
      _isLoading = false;
      notifyListeners();
      return true;
    } catch (error) {
      print(error);
      _isLoading = false;
      notifyListeners();
      return false;
    }
  }




  Future fetchVedios() {
    print('in fetch vedios');
   _isLoading = true;
    notifyListeners();
    return http
        .get(
            'https://freebies-96dc8-default-rtdb.firebaseio.com/Vedio.json') // here in the of this link we are accessing the token of authenticated user
        .then<Null>((http.Response response) {
      final List<Vedios> fetchedProductslist = [];
      final Map<String, dynamic> productListData = json.decode(response.body);
      if (productListData == null) {
        _isLoading = false;
        notifyListeners();
        return;
      }

      try {
        productListData.forEach((productId, dynamic productData) {
          final Vedios product = Vedios(
            id:productId,
           link:productData ['link'], 
           picture:productData['image'],
           tittle: productData['tittle']
           );
          fetchedProductslist.add(product);
          print(product.id);
        });
        _vedioList =  fetchedProductslist;
        _isLoading = false;
        notifyListeners();
        _selServiceId = null;
      } catch (e) {
        print('erroe;');
        print(e);
      }
    }).catchError((error) {
      _isLoading = false;
      notifyListeners();
      return;
    });
  }


Future<bool> updateVedio(
      String tittle,
      String link,
      String img,
      ) {
        print('in update vedios');
    _isLoading = true;
    notifyListeners();
  String  id=selectedVedio.id;
    Map<String, dynamic> updatedData = {
      'tittle': tittle,
      'link': link,
      'image':
          'https://www.bentleymotors.com/content/dam/bentley/Master/Models/Hero/New%20Continental%20GT%20V8/Bentley-Continental-GT-V8-static-front-1920x670.jpg/_jcr_content/renditions/Bentley-Continental-GT-V8-static-front-699x309.jpg./Bentley-Continental-GT-V8-static-front-699x309.jpg',
     
    };
    return http
        .put(
            'https://freebies-96dc8-default-rtdb.firebaseio.com/Vedio/$id.json',
            body: json.encode(updatedData))
        .then((http.Response response) {
      _isLoading = false;




      final Vedios game = Vedios(
          id: id,
          tittle: tittle,
          link: link,
          picture: img,
          );
      _vedioList[selectedVedioIndex] = game;
      notifyListeners();
      return true;
    }).catchError((error) {
      _isLoading = false;
      notifyListeners();
      return false;
    });
  }




Future<bool> delVedio() async {
  print('in del vedios');
    _isLoading = true;
  String  id=selectedVedio.id;
    notifyListeners();
try {
   http.Response response= await http.delete(
          'https://freebies-96dc8-default-rtdb.firebaseio.com/Vedio/$id.json');

 if (response.statusCode != 200 && response.statusCode != 201) {
        _isLoading = false;
        print('Data not Send');
        notifyListeners();
        return false;
      }
      print('DAta Send');
      _isLoading = false;
      notifyListeners();
   _vedioList.removeAt(selectedVedioIndex);
   selectVedio(null);
   _selServiceId=null;
      return true;
} catch (e) {
   _isLoading = false;
   print(e);
      notifyListeners();
      return false;
}

  }














}


     
  




mixin UtilityModel on ConnectedServicesModel {
  bool get isLoading {
    return _isLoading;
  }



}
