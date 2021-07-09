import 'dart:convert';
import 'dart:async';

import 'dart:io';

import 'package:freebies/Models/Games.dart';
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

//   String privacy;
//   String aboutUs;
//   ServiceProviders provdr;
//   String _selServiceId;
//   String _selcProviderid;
//   String _selcSSid;
//   bool _isLoading = false;
//   double regFees;
//   double fetchfee;
//   String lat;
//   String lon;
//   String image;
//   String serviceIMg;
// Future<bool> getlocation(BuildContext context)async {

// bool isLocationEnabled = await Geolocator.isLocationServiceEnabled();
//     if (isLocationEnabled) {
//       Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.best);

//         lat = position.latitude.toString();
//         lon = position.longitude.toString();

//      //  return true;
//        //findAddressesFromCoordinates(cordinates).then((value) => _address=value);
//       // print(_address);
//     } else if (!isLocationEnabled) {
//       showDialog(
//           context: context,
//           builder: (BuildContext context) {
//             return AlertDialog(
//               title: Text("Can't get your location"),
//               content: const Text('Please make sure your GPS is turned on!!!'),
//             );

//           });
//        //   return false;
//     }
//     if (lat.isEmpty || lon.isEmpty) {
//       showDialog(
//           context: context,
//           builder: (BuildContext context) {
//             return AlertDialog(
//               title: Text("Can't get your current location"),
//               content: const Text('Please make sure your GPS is turned on!!!'),
//             );
//           });
//           return false;
//     }
//       return true;
//   }

// void addRegistrationFees(String fees)async{
// double reg=double.parse(fees);
// final Map<String, dynamic> productData = {
//       'RegFees':reg
//     };
//     var id='-MT60dZrFDYXq3EfK7qd';
//  try {
//    final http.Response response = await http.put(
//           'https://socialservices-6478e-default-rtdb.firebaseio.com/RegistrationFees/$id.json',
//           body: json.encode(productData), );

//           print(response.body);
//  } catch (e) {
//    print('error:');
//    print(e);

//  }

// }

// Future<Null> fetchFees()async{
// final SharedPreferences pref = await SharedPreferences
//           .getInstance();

//   _isLoading = true;
//     notifyListeners();

//   return await http.get(
//           'https://socialservices-6478e-default-rtdb.firebaseio.com/RegistrationFees.json',
//         ).then<Null>((http.Response response) {

//       final Map<String, dynamic> productListData = json.decode(response.body);

//       if (productListData == null) {
//         _isLoading = false;
//         notifyListeners();
//         return;
//       }
//      var value;
//         productListData.forEach((String productId, dynamic productData) {
//    value=productData['RegFees'];

//       });

//   regFees=value;
//    pref.setDouble('regfees',regFees);
//    selectfee(regFees);
//     _isLoading=false;
//     notifyListeners();
//     return;

//   });
// }
// double get getFees {
//     return fetchfee;

//   }
//  selectfee(double productId) {
//     //this functions helps us in slecting the product with its index or postion
//     fetchfee = productId;
//     if (fetchfee != null) {
//       notifyListeners();
//     }
//   }

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

//  addCover(String image)async{

// final Map<String, dynamic> productData = {
//       'image':image
//     };
//     var id='-MRMVUERdIhYq94XpHf_';
//  try {
//    final http.Response response = await http.put(
//           'https://socialservices-6478e-default-rtdb.firebaseio.com/Cover/$id.json',
//           body: json.encode(productData), );

//  } catch (e) {
//    print('error:');
//    print(e);

//  }

//   }

// Future<Null> fetchPic()async{
// var fetchimage;
//   _isLoading = true;
//     notifyListeners();

//   return await http.get(
//           'https://socialservices-6478e-default-rtdb.firebaseio.com/Cover.json',
//         ).then<Null>((http.Response response) async {

//       final Map<String, dynamic> productListData = json.decode(response.body);

//       if (productListData == null) {
//         _isLoading = false;
//         notifyListeners();
//         return;
//       }
//      // image=null;
//         productListData.forEach((String productId, dynamic productData) {
//         fetchimage=productData['image'];

//       });

//    image=fetchimage;
//   final SharedPreferences pref = await SharedPreferences
//           .getInstance(); //this line allow us to get the access to the shared preffrence(3rd party PACKAGE)  which helps us in getting or allow us a storage on the device
//        // in this line the token is a keyword which will represnt the key of firebase in our auth data which we get on our response
//       pref.setString('authimg', image);

//     _isLoading=false;
//     notifyListeners();
//     return;

//   });

// }

  Future<bool> addProducts(String tittle, String description, int price,
      String image, String userID, bool featured, double rating) async {
    _isLoading = true;
    notifyListeners();
    final Map<String, dynamic> productData = {
      'tittle': tittle,
      'description': description,
      'image': image,
      'price': price,
      'UserID': '_authenticationUser.id',
      'isFeatured': featured,
      'rating': rating
    };
    print(productData);
    try {
      final http.Response response = await http.post(
          'https://freebies-cf2cd-default-rtdb.firebaseio.com/Products.json',
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
      String id,
      String tittle,
      String description,
      String image,
      int price,
      bool isfeatured,
      bool isFavourite,
      String userId) {
    _isLoading = true;
    notifyListeners();
    Map<String, dynamic> updatedData = {
      'tittle': tittle,
      'description': description,
      'image':
          'https://www.bentleymotors.com/content/dam/bentley/Master/Models/Hero/New%20Continental%20GT%20V8/Bentley-Continental-GT-V8-static-front-1920x670.jpg/_jcr_content/renditions/Bentley-Continental-GT-V8-static-front-699x309.jpg./Bentley-Continental-GT-V8-static-front-699x309.jpg',
      'price': price,
      'userEamail': _authenticationUser.email,
      'userId': _authenticationUser.id
    };
    return http
        .put(
            'https://ondemandservice-cad8c.firebaseio.com/Services/${selectedProduct.id}.json?auth=${_authenticationUser.token}',
            body: json.encode(updatedData))
        .then((http.Response response) {
      _isLoading = false;
      final Product updatedProduct = Product(
          id: id,
          tittle: tittle,
          description: description,
          image: image,
          price: price,
          isfavourite: isFavourite,
          userId: userId,
          isFeatured: isfeatured);
      _products[selectedProductIndex] = updatedProduct;
      notifyListeners();
      return true;
    }).catchError((error) {
      _isLoading = false;
      notifyListeners();
      return false;
    });
  }

  Future<Null> fetchProducts({onlyForUser = false}) {
    _isLoading = true;
    notifyListeners();
    return http
        .get(
            'https://freebies-cf2cd-default-rtdb.firebaseio.com/Products.json') // here in the of this link we are accessing the token of authenticated user
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
              // isfavourite:productData['wishlistUsers'] == null ? false : (productData['wishlist'] as Map<String, dynamic>).containsKey(_authenticationUser.id),
              isFeatured: productData['isFeatured'],
              reviews: productData['reviews'],
              rating: productData['rating']);
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
    var saad = 'saad';
    final bool isCurrentStatus = selectedProduct.isfavourite;
    final bool currentFavStatus = !isCurrentStatus;
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
          'https://freebies-cf2cd-default-rtdb.firebaseio.com/Products/${selectedProduct.id}/wishlistUsers/$saad.json',
          body: json.encode(true));
    } else {
      response = await http.delete(
          'https://freebies-cf2cd-default-rtdb.firebaseio.com/Products/${selectedProduct.id}/wishlistUsers/$saad.json');
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

// Future<bool> delService(String id) async {
//     _isLoading = true;
//     notifyListeners();
//    print('approved');

// final Map<String, dynamic> deletedService = {
//        'id':id,

//     };
//  // print(listOfSubServices);
//  var delSS=json.encode(deletedService);

// try {
//    http.Response response= await http.patch(
//           'https://arphar.herokuapp.com/service',//ye wali api jisme id accept kr rahy ho wo ni bnae tb hi error h
//           body:delSS, headers: {HttpHeaders.contentTypeHeader: 'application/json'});

//  if (response.statusCode != 200 && response.statusCode != 201) {
//         _isLoading = false;
//         print('Data not Send');
//         notifyListeners();
//         return false;
//       }
//       print('DAta Send');
//       _isLoading = false;
//       notifyListeners();
//    _services.removeAt(selectedProductIndex);
//    selectProudct(null);
//    _selcProviderid=null;
//       return true;
// } catch (e) {
//    _isLoading = false;
//    print(e);
//       notifyListeners();
//       return false;
// }

//   }

}

mixin UserModel on ConnectedServicesModel {
  Timer _authTimer;
  // PublishSubject<bool> _userSubject = PublishSubject();

  // PublishSubject<bool> get userSubject {
  //   return _userSubject;
  // }

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

// // bool selected = false;
  User get singleUser {
    return _authenticationUser;
  }

  List<User> get allusers {
    return List.from(_users);
  }
  

  Future<bool> vendorSignUpRequest( String email,
      String password,
      AuthMode mode,
      String address,
      String name,
      String cnic,
      String number,
      bool isProvider,
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
      'IsProvider':isProvider,

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
    if (mode == AuthMode.Login) {
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
          return user.email == email;// && user.isProvider==true;
        });
        print('ok');
        hasError = false;
        message = 'Authentication Successeded';
      
        _authenticationUser = User(
            pass: userData.pass,
            fireBaseID: responseData['localId'],
            id: userData.id,
            email: userData.email,
            token: responseData['idToken'],
            address: userData.address,
            wallet: userData.wallet,
            image: userData.image,
            isProvider:  userData.isProvider,
            cnic: '222', // userData.cnic,
            name: 'userData.name',
            number: '22222' //userData.number
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

    if (mode == AuthMode.SignUp || mode == AuthMode.Coustomer) {
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
          'FireBaseID': responseData['localId']
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

//   void autoAuthenticate() async {
//     final SharedPreferences pref = await SharedPreferences.getInstance();
//     final String token = pref.getString(
//         'token'); // this keyword should be same as when we are geting the firebase key in our response
//     final String expiryTimeString = pref.getString('expiryTime');
//     if (token != null) {
//       final DateTime currentTime = DateTime.now();
//       final parsedExpirytime = DateTime.parse(expiryTimeString);
//       if (parsedExpirytime.isBefore(currentTime)) {
//         _authenticationUser = null;
//         notifyListeners();
//         return;
//       }
//       final String userEmail = pref.getString('userEmail');
//       final String userId = pref.getString('userId');
//       final int tokenLIfeSpan =
//           parsedExpirytime.difference(currentTime).inSeconds;
//       _authenticationUser = UserT(
//           id: userId,
//           email: userEmail,
//           token:token,
//           address: null,
//           firebaseId: null,
//           imag: null,
//           name: null,
//           number: null); // this is creating new user but by geting the token if its already present on the device, also we are  creating new user above on line 275.Here we are again login by automode ie which means if we have already stored the id email and token on a device then we will call this method which will also produce a new user
//       _userSubject.add(true);
//       setAuthTimeout(tokenLIfeSpan);
//       notifyListeners();
//     } else {

//     }
//   }

  void logout() async {
    print('Logout');
    _authenticationUser = null;
    _authTimer.cancel();
    wallet=0;
 notifyListeners();
  }

// void updateProfileData(String name,String email,String firebaseID,String number,String address,String image,)async{
// _isLoading=true;
// notifyListeners();

//  final SharedPreferences pref = await SharedPreferences.getInstance();
//     final String profileID = pref.getString(
//         'profileID');

// Map<String ,dynamic>profileData={

// 'name':name,
// 'email':email,
// 'firebaseId':firebaseID,
// 'mobileNo':number,
// 'address':address,
// 'image':image,

// };

// try {
//       final http.Response response = await http.put(
//           'https://socialservices-6478e-default-rtdb.firebaseio.com/Profile/$profileID.json',
//           body: json.encode(profileData),);

//       if (response.statusCode != 200 && response.statusCode != 201) {
//         print('Sending error');
//         print(response.statusCode );
//         _isLoading = false;
//         notifyListeners();
//         return ;
//       }

// print(response.statusCode);
// print(response.body);
//       _isLoading = false;
//       notifyListeners();
//       return ;
//     } catch (error) {
//       print(error);
//       _isLoading = false;
//       notifyListeners();
//       return;
//     }

// }

// void addProfileData(String name,String email,String firebaseID,String number,String address,String image,)async{
// _isLoading=true;
// notifyListeners();

//  final SharedPreferences pref = await SharedPreferences.getInstance();
//     final String profileID = pref.getString(
//         'uID');

// Map<String ,dynamic>profileData={

// 'name':name,
// 'email':email,
// 'firebaseId':firebaseID,
// 'mobileNo':number,
// 'address':address,
// 'image':image,

// };

// try {
//       final http.Response response = await http.post(
//           'https://socialservices-6478e-default-rtdb.firebaseio.com/Profile.json',
//           body: json.encode(profileData),);

//       if (response.statusCode != 200 && response.statusCode != 201) {
//         print('Sending error');
//         print(response.statusCode );
//         _isLoading = false;
//         notifyListeners();
//         return ;
//       }

// print(response.statusCode);
// print(response.body);
//       _isLoading = false;
//       notifyListeners();
//       return ;
//     } catch (error) {
//       print(error);
//       _isLoading = false;
//       notifyListeners();
//       return;
//     }

// }

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

// mixin ServiceProvidersModel on ConnectedServicesModel {
//   ServiceProviders get provdrz {
//     return provdr;
//   }

//   List<ServiceProviders> get allServiceProviders {
//     return List.from(_providers);
//   }

//   List<ServiceProviders> get displayServiceProviders {
//     // if (_showFavorites) {
//     //   return _services.where((Service service) => service.isfavourite).toList();
//     // }

//     return List.from(_providers);
//   }

//   String get selectedProviderId {
//     // THIS IS THE GETTER FUNCTION WHCIH WILL GIVE US ID OF THE SELECTED provider
//     // this is a getter  function which returns the index of selected product
//     return _selcProviderid;
//   }

//   ServiceProviders get selectedProvider {
//     // [THIS WILL RETURN THE SINGLE PRODUCT FROM THE PRODUCT LIST AND ASS]
//     // this function helps us to build or show  the propoties of a selected products or we can say the give us the specific product of specifed location or index
//     if (selectedProviderId == null) {
//       return null;
//     }
//     return _providers.firstWhere((ServiceProviders provider) {
//       // this is buildin function of list whcih will give the single product from list

//       return provider.id == selectedProviderId;
//     });
//   }

//   int get selectedProviderIndex {
//     return _providers.indexWhere((ServiceProviders providers) {
//       //  this is buildin function of list whcih will give the postion of product in the list or we can say give us the index
//       return providers.id == _selcProviderid;
//     });
//   }

//   void selectProvider(String providerId) {
//     //this functions helps us in slecting the product with its index or postion(USED TO SELECT THE PRODUCT BY PASSING THE STRING AND ASSIGN THE VALUE TO ANOTHER STRING/THIS IS A SETTER FUNCTION )
//     _selcProviderid = providerId;
//     if (_selServiceId != null) {
//       notifyListeners();
//     }
//   }

// void allProvidersForAdmin()async { // these are the list of all providers whivh will shown to admin

// _isLoading = true;
//     notifyListeners();
//     return http
//         .get(
//             'https://arphar.herokuapp.com/provider') // here in the of this link we are accessing the token of authenticated user
//         .then<Null>((http.Response response) {
//       final List<ServiceProviders> fetchedProductslist = [];
//       final Map<String, dynamic> productListData = json.decode(response.body);

//       if (productListData != null) {

// // if (productListData == null) {
// //         print('hako');
// //
// //       }
//       try {
//          var providers = [...productListData['data']];

//       providers.forEach((productData) {
//         ServiceProviders pp= ServiceProviders(
//           bio:productData['bio'] ,
//           id:productData['firebase_id']  ,
//           image: productData['image'] ,
//           name: productData['name'],
//           sub: productData['subServices'],
//           address:productData['address'] );

//         fetchedProductslist.add(pp);
//          _providers = fetchedProductslist;
//            _isLoading=false;
//            notifyListeners();
//       });
//       } catch (e) {
//         print(e);
//       }
//       } else {
//           _isLoading = false;
//          notifyListeners();
//          return;
//       }
//     }).catchError((error) {
//       _isLoading = false;
//       notifyListeners();
//       return;
//     });
//   }

//   Future<bool> addProviders(String id,String name,String bio,String address,String lat,String lon,String image,String email) async {
//     _isLoading = true;
//       final SharedPreferences pref = await SharedPreferences.getInstance();
//     final String serviceId = pref.getString(
//         'id');
//         print(address);
//     print('$id,$bio,$name,$address,$lat,$lon,$image,$email');
//     notifyListeners();
//     final Map<String, dynamic> providersData = {
//       'serviceId':serviceId,
//       'fireBase_id': id,
//       'name': name,
//       'bio': bio,
//       'address': address,
//       'lat': lat,
//       'lon': lon,
//       'image':image,
//       'email':email    };
//     //print('Provider Data Below');
//    // print(providersData);

//     try {
//       final http.Response response = await http.post(
//           'https://arphar.herokuapp.com/provider',
//           body: json.encode(providersData),
//           headers: {HttpHeaders.contentTypeHeader: 'application/json'});

//       if (response.statusCode != 200 && response.statusCode != 201) {
//         _isLoading = false;
//         print(response.statusCode);
//         print('Data Do not Send');
//         notifyListeners();
//         return false;
//       }
//       print('DAta Send');
//       return true;
//     } catch (error) {
//       _isLoading = false;
//       print('bad work');
//       notifyListeners();

//       return false;
//     }
//   }

// Future<Null> getProviders() async {
//     _isLoading = true;
//     notifyListeners();

// try {
//   final SharedPreferences pref = await SharedPreferences.getInstance();
//     final String id = pref.getString('id');
// final Map<String, dynamic> serviceId = {
//   'service':id,
//   'lat':lat,
//   'lon':lon
// };
//   return
//    await http.post(
//           'https://arphar.herokuapp.com/provider/nearby',
//           body: json.encode(serviceId), headers: {HttpHeaders.contentTypeHeader: 'application/json'})
//           .then<Null>((http.Response response) {

//       final List<ServiceProviders> fetchedProductslist = [];
//        final List<Subservices> fetchedlist = [];
//       final Map<String, dynamic> productListData = json.decode(response.body);

//        if (productListData == null) {
//         _isLoading = false;
//         print('data not found in (get Providers)');
//         notifyListeners();
//         return;
//       }

// var providers = [...productListData['data']];
//  print(providers);
//       providers.forEach((dynamic productData) {

//        var ss= [...productData['subServices']];

//      try {

//         ss.forEach((element) {
//        var ff= double.parse(element['price']);
//        Subservices _subService =  Subservices(
//          id: element['_id'],
//           name:element['name'],
//          image: element['image'],
//          price:ff,
//           descp: null,

//           );
//           fetchedlist.add(_subService);
//           _subSS=fetchedlist;
//      });

//      } catch (e) {
//        print('hako');
//        print(e);
//        print(e);
//      }

//  try {
//  ServiceProviders pro = ServiceProviders(
//           name: productData['name'],
//          id: productData['firebase_id'] ,
//           bio: productData['bio'] ,
//            image: productData['image'] ,
//             sub:_subSS,
//             address: productData['address']);
//         fetchedProductslist.add(pro);

//  }
//  catch (e)
//   {
//     print('error');
//     print(e);
//  }
//       });
//       _providers = fetchedProductslist;
//     //  print(_providers);
//       _isLoading = false;
//       notifyListeners();

//     }).catchError((error) {
//       _isLoading = false;
//       print('catcherror');
//       notifyListeners();
//           print(error);

//       return;
//     });

//          }

//  catch (e) {
//   print(e);
//       print('error2');

//   return ;
// }

//   }

// Future<bool> approvedProviders(String firebaseId) async {
//     _isLoading = true;
//     notifyListeners();
//    print('approved');
//    print(firebaseId);
// final Map<String, dynamic> acceptedProvider = {
//        'firebase_id':firebaseId,

//     };
//  // print(listOfSubServices);
//  var providerSS=json.encode(acceptedProvider);

// try {
//    http.Response response= await http.put(
//           'https://arphar.herokuapp.com/provider/approve',//ye wali api jisme id accept kr rahy ho wo ni bnae tb hi error h
//           body:providerSS, headers: {HttpHeaders.contentTypeHeader: 'application/json'});

//  if (response.statusCode != 200 && response.statusCode != 201) {
//         _isLoading = false;
//         print('Data not Send');
//         notifyListeners();
//         return false;
//       }
//       print('DAta Send');
//       _isLoading = false;
//       notifyListeners();
//    _providers.removeAt(selectedProviderIndex);
//    selectProvider(null);
//    _selcProviderid=null;
//       return true;
// } catch (e) {
//    _isLoading = false;
//    print(e);
//       notifyListeners();
//       return false;
// }

//   }

// Future<bool> getProviderOrders() async {
//     _isLoading = true;
//     notifyListeners();

// try {
//   final SharedPreferences pref = await SharedPreferences.getInstance();
//     final String id = pref.getString('id');
// print(id);
// final Map<String, dynamic> serviceId = {
//   'service':id
// };
//   final http.Response response  = await http.post(
//           'https://arphar.herokuapp.com/provider/nearby',
//           body: json.encode(serviceId), headers: {HttpHeaders.contentTypeHeader: 'application/json'});

//       if (response.statusCode != 200 && response.statusCode != 201) {
//         _isLoading = false;
//         notifyListeners();
//         return false;
//       }
//       _isLoading = false;
//       return true;
// } catch (e) {
//   print(e);
//   return false;
// }

//   }

// }

mixin GamesModel on ConnectedServicesModel {
  List<Games> get allGames {
    // this is a getter function which will give us all products in the list
    return List.from(
        _games); // thid line ensure us not to add or delete in orignal list but make a copy of orignal list and then make changes to it and then pass it to orignal list
  }

//   //  List<Subservices> get displayProSubServices {

//   //   return List.from(_subSS);
//   // }

  String get selcectedGameId {
    // this is a getter  function which returns the index of selected product
    return _selcectedGameId;
  }

  Games get _selcectedGame {
//     // this function helps us to build or show  the propoties of a selected products or we can say the give us the specific product of specifed location or index
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
      String tittle, String description, String image, String amount) async {
    _isLoading = true;
    notifyListeners();
    final Map<String, dynamic> gametData = {
      'name': tittle,
      ' description': description,
      'image': image,
      'amounr': amount
    };

    try {
      final http.Response response = await http.post(
          'https://arphar.herokuapp.com/service',
          body: json.encode(gametData),
          headers: {HttpHeaders.contentTypeHeader: 'application/json'});

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

//     return http
//         .get('https://arphar.herokuapp.com/service'+
//             id) // here in the of this link we are accessing the token of authenticated user
//         .then<Null>((http.Response response) {
//       final List<Subservices> fetchedProductslist = [];
//       final Map<String, dynamic> productListData = json.decode(response.body);

//       if (productListData == null) {
//         _isLoading = false;
//         notifyListeners();
//         return;
//       }
// print('productlistdsata');
// print(productListData);
//       var services = [...productListData['subServices']];
//       print('subservice');
//       print(services);

//       services.forEach((produ) {
//          print('entered');
//         //var prices=double.parse(produ['price']);
//         try {
//             final Subservices product = Subservices(

//             name: produ['name'],
//             image: produ['image'],
//             price:null ,
//             descp: null,
//             id: produ['_id']);

//         fetchedProductslist.add(product);
//         } catch (e) {

//           print(e);
//         }

//       });
//       _subServices = fetchedProductslist;

//       _isLoading = false;
//       notifyListeners();
//       _selServiceId = null;
//     }).catchError((error) {
//       print(error);
//       _isLoading = false;
//       notifyListeners();
//       return;
//     });
//   }

//  getDetails(String name,String image,double price,String descp,String id){
//  print(name);
//  print('Details Added in connected file');
//  Subservices product =  Subservices(
//           name:name,
//          image: image,
//          price: price,
//           descp: descp,
//           id: id
//           );
//            providerServicesss.add(product);
//            print(providerServicesss);

// }

// Future<bool> submitingSS(List<Subservices> subSS) async {
//     _isLoading = true;
//     notifyListeners();
//   //  print(subSS.length);
//    //const ajson =const JsonCodec();
//    final SharedPreferences pref = await SharedPreferences.getInstance();
//      final String firebaseId = pref.getString('userId');
//      final String serviceId = pref.getString('id');
// final Map<String, dynamic> listOfSubServices = {
//        'service':serviceId,
//       'subServices': subSS,
//       'firebase_id':firebaseId
//     };
//   print(listOfSubServices);
//  var providerSS=json.encode(listOfSubServices);
// // print(providerSS.length);
// try {
//    http.Response response= await http.put(
//           'https://arphar.herokuapp.com/provider',//ye wali api jisme id accept kr rahy ho wo ni bnae tb hi error h
//           body:providerSS, headers: {HttpHeaders.contentTypeHeader: 'application/json'});

//  if (response.statusCode != 200 && response.statusCode != 201) {
//         _isLoading = false;
//         print('Data not Send');
//         notifyListeners();
//         return false;
//       }
//       print('DAta Send');
//       _isLoading = false;
//       notifyListeners();
//     providerServicesss.clear();
//     print(providerServicesss);

//       return true;
// } catch (e) {
//    _isLoading = false;
//    print(e);
//       notifyListeners();
//       return false;
// }

//   }

// Future<Null> getProviderSubService() async {
// _isLoading = true;
//     notifyListeners();
//     final SharedPreferences pref = await SharedPreferences.getInstance();
//    String firebaseid = pref.getString('pID');

//     return http
//         .get('https://arphar.herokuapp.com/provider/sub'+ firebaseid
//              ) // here in the of this link we are accessing the token of authenticated user
//         .then<Null>((http.Response response) {
//           print(response.statusCode);
//       final List<Subservices> fetchedProductslist = [];
//       final Map<String, dynamic> productListData = json.decode(response.body);
//       if (productListData == null) {
//         _isLoading = false;
//         notifyListeners();
//         return;
//       }

//       var services = [...productListData["data"]];
//       try {
//   services.forEach((produ) {
//         // print(productListData);
//         final Subservices product = Subservices(
//             name: produ['name'],
//             image: produ['image'],
//             price:double.parse(produ['price']),
//             descp: null,
//             id: produ['_id']);
//         fetchedProductslist.add(product);
//       });
// } catch (e) {
//   print(e);
// }
//       _subServices = fetchedProductslist;

//       _isLoading = false;
//       notifyListeners();
//       _selServiceId = null;
//     }).catchError((error) {
//       _isLoading = false;
//       notifyListeners();
//       return;
//     });

//   }

  Future fetchGames() {
    print('in fetch games');
    try {
      for (var i = 0; i < 7; i++) {
        Games fetchedgames = Games(
            id: 'id',
            amount: 'amount',
            link: 'https://cdn.htmlgames.com/AlienInvaders2/',
            picture: 'picture');
        _games.add(fetchedgames);
      }
    } catch (e) {}
  }
}

mixin VediosModel on ConnectedServicesModel {
//   //bool _showFavorites = false;

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

//   // bool get displayFavoriteOnly {
//   //   return _showFavorites;
//   // }

  selectVedio(String productId) {
    //this functions helps us in slecting the product with its index or postion
    _selcectedVedioId = productId;
    if (_selServiceId != null) {
      notifyListeners();
    }
  }

  fetchAllVedios() async {
    print('in place order');
    try {
      for (var i = 0; i < 7; i++) {
        Vedios newVedio = Vedios(
            id: 'aKnjibWoyvc', amount: "Sample", link: "https//:example");
        _vedioList.add(newVedio);
      }
      // final http.Response response = await http.post(
      //     'https://socialservices-6478e-default-rtdb.firebaseio.com/Orders.json',
      //     body: json.encode(orderData),);

      // if (response.statusCode != 200 && response.statusCode != 201) {
      //   print('object');
      //   print(response.statusCode );
      //   _isLoading = false;
      //   notifyListeners();
      //   return false;
      // }
      //   final Map<String, dynamic> respondProductId = json.decode(response.body);
      //   final Service newProduct = Service(
      //     id: respondProductId['name'],
      //     tittle: tittle,
      //     description: description,
      //   );

      //  // print(newProduct);
      //   _services.add(newProduct);

// print(response.statusCode);
// print(response.body);
//       _isLoading = false;
      notifyListeners();
      return true;
    } catch (error) {
      print(error);
      _isLoading = false;
      notifyListeners();
      return false;
    }
  }

//   Future<bool> markAsCompleted(
//   String ids,
//   String mainServiseID,//'id'
//   String subServiceID,//'_id'
//   String uid,//userId
//   String providerID,//firebase_id
//   double price,//price
//   String time,//time
//   String date,//date
//   String orderDetails,//orderDetails
//   String _providerName,//
//   String _subServiceName,
//   String image,
//   {String status ='completed'}
//   ) {
//         print('saad dew');
//         print(ids);
//     _isLoading = true;
//     notifyListeners();
//     var id=ids;
//     final Map<String, dynamic> orderData = {
//        'mainServiseID':mainServiseID,
//    'subServiceID':subServiceID,
//    'uid':uid,
//    'providerID':providerID,
//    'price':price,
//    'time':time,
//    'date':date,
//    'orderDetails':orderDetails,
//    '_providerName':_providerName,
//    '_subServiceName':_subServiceName,
//    'image':image,
//    'status':status,

//     };
//     try {
//       return http
//         .put(
//             'https://socialservices-6478e-default-rtdb.firebaseio.com/Orders/$id.json',
//             body: json.encode(orderData))
//         .then((http.Response response) {
//           print(response.body);
//       _isLoading = false;
//        _orders.removeAt(selectedOrderIndex);
//       notifyListeners();

//       return true;
//     });
//     }
//     catch (e) {
//       print(e);
//       _isLoading = false;
//       notifyListeners();

//     }

//   }

//   Future<Null> fetchOrders(String requestType) {
//     _isLoading = true;
//     notifyListeners();
//     return http
//         .get('https://socialservices-6478e-default-rtdb.firebaseio.com/Orders.json')// here in the of this link we are accessing the token of authenticated user
//         .then<Null>((http.Response response) {
//       final List<Orders> fetchedProductslist = [];
//       final Map<String, dynamic> productListData = json.decode(response.body);
//       if (productListData == null) {
//         _isLoading = false;
//         notifyListeners();
//         print('data not fetched');
//         return;
//       }
//       productListData.forEach((String id, dynamic _order) {

//           Orders ordeer = Orders(

//         mainServiseID: _order['mainServiseID'],
//         subServiceID: _order['subServiceID'],
//         uid: _order['uid'],
//         providerID: _order['providerID'],
//         price: _order['price'],
//         time: _order['time'],
//         date: _order['date'],
//         orderDetails: _order['orderDetails'],
//         providerName: _order['_providerName'],
//         subServiceName: _order['_subServiceName'],
//         status: _order['status'],
//         image: _order['image'],
//         orderID: id);
// fetchedProductslist.add(ordeer);
//        });

//    if (requestType =='user') {

//    _orders =  fetchedProductslist.where((Orders order)  {// this 'WHERE method' will give all the products of authenticated userId
//         return order.uid == _authenticationUser.id && order.status=='incomplete';

//       }).toList();
//       _isLoading = false;
//       notifyListeners();
//       }

//        else if(requestType =='provider') {
//     _orders =  fetchedProductslist.where((Orders order)  {// this 'WHERE method' will give all the products of authenticated userId
//         return order.providerID == _authenticationUser.id ;

//       }).toList();
//       _isLoading = false;
//       notifyListeners();
//    }
//  else if(requestType =='admin') {
//     _orders =  fetchedProductslist.where((Orders order)  {// this 'WHERE method' will give all the products of authenticated userId
//         return order.status == 'completed';

//       }).toList();
//       _isLoading = false;
//       notifyListeners();
//    }

//     }).catchError((error) {
//       _isLoading = false;
//       notifyListeners();
//       return;
//     });
//   }

}

// mixin RatedSSModel on ConnectedServicesModel {

// List<RatedService> get allratings {
//     return List.from(ratedServices);
//   }
// List<RatedService> get allrat {
//     return List.from(ratedServices1);
//   }

// Future<Null> putRating(
//   String mainServiseID,
//   String subServiceID,
//   String providerID,
//  String _providerName,
//   String _subServiceName,
//   String feedback,
//   double rating,
//   String image
//   )async{
//  _isLoading = true;
//     notifyListeners();

// final Map<String, dynamic> ratedServices = {
//        'mainServiseID':mainServiseID,
//    'subServiceID':subServiceID,
//    'providerID':providerID,
//    '_providerName':_providerName,
//    '_subServiceName':_subServiceName,
//    'rating':rating,
//    'feedback':feedback,
//    'image':image
//     };
//     print(ratedServices);
// try {
//       final http.Response response = await http.post(
//           'https://socialservices-6478e-default-rtdb.firebaseio.com/Ratings.json',
//           body: json.encode(ratedServices),);

//       if (response.statusCode != 200 && response.statusCode != 201) {
//         print('object');
//         print(response.statusCode );
//         _isLoading = false;
//         notifyListeners();
//         return ;
//       }

// print(response.statusCode);
// print(response.body);
//       _isLoading = false;
//       notifyListeners();
//       return ;
//     } catch (error) {
//       print(error);
//       _isLoading = false;
//       notifyListeners();
//       return;
//     }

// }

//  Future<Null> fetchRatings({String idx,String reqTyp}) {

//     _isLoading = true;
//     notifyListeners();
//     return http
//         .get('https://socialservices-6478e-default-rtdb.firebaseio.com/Ratings.json')// here in the of this link we are accessing the token of authenticated user
//         .then<Null>((http.Response response) {
//      final  List<RatedService> fetchedProductslist = [];
//       final Map<String, dynamic> productListData = json.decode(response.body);
//       if (productListData == null) {
//         _isLoading = false;
//         notifyListeners();
//         print('data not fetched');
//         return;
//       }

//       productListData.forEach((String id, dynamic data) {

//         RatedService rated = RatedService(
//           mainServiseID: data['mainServiseID'],
//           subServiceID: data['subServiceID'],
//            providerID: data['providerID'],
//             providerName: data['_providerName'],
//             subServiceName: data['_subServiceName'],
//              feedback: data['feedback'],
//               rating: data['rating'],
//               image: data['image']);
// fetchedProductslist.add(rated);

//       });

//       if(reqTyp == 'AllRatedSS'){
//         print('all');
//          ratedServices1=fetchedProductslist;
//       }
//       else{
//         print('else');
//        ratedServices1= fetchedProductslist.where((RatedService ratedSS) {
//         return ratedSS.providerID==idx;
//       }).toList();
//       }

//       _isLoading = false;
//       notifyListeners();
//     }).catchError((error) {
//       _isLoading = false;
//       notifyListeners();
//       return;
//     });
//   }

// Future<Null> fetchTopRatedSS() {

//     _isLoading = true;
//     notifyListeners();
//     return http
//         .get('https://socialservices-6478e-default-rtdb.firebaseio.com/Ratings.json')// here in the of this link we are accessing the token of authenticated user
//         .then<Null>((http.Response response) {
//      final  List<RatedService> fetchedProductslist = [];
//       final Map<String, dynamic> productListData = json.decode(response.body);
//       if (productListData == null) {
//         _isLoading = false;
//         notifyListeners();

//         return;
//       }
//       try {
//       //  print('applying for each ');
//          productListData.forEach((String id, dynamic data) {

//         RatedService rated = RatedService(
//           mainServiseID: data['mainServiseID'],
//           subServiceID: data['subServiceID'],
//            providerID: data['providerID'],
//             providerName: data['_providerName'],
//             subServiceName: data['_subServiceName'],
//              feedback: data['feedback'],
//               rating: data['rating'],
//               image:data['image'] );
// fetchedProductslist.add(rated);

// //print('Fetched List');

// //print(fetchedProductslist);

//       });
//       } catch (e) {
//         print(e);
//       }

//       try {
//          ratedServices=fetchedProductslist.where((RatedService ratedSS) {
//         return ratedSS.rating>=4.5;
//       }).toList();
//       } catch (e) {
//         print(e);
//       }

//       _isLoading = false;
//       notifyListeners();
//     }).catchError((error) {
//       _isLoading = false;
//       notifyListeners();
//       return;
//     });
//   }

// }

mixin UtilityModel on ConnectedServicesModel {
  bool get isLoading {
    return _isLoading;
  }

//  addPrivacy(String about)async{

// final Map<String, dynamic> productData = {
//       'privacy':about
//     };
//     var id='-MTWEJOhn7k-0DjNThOS';
//  try {
//    final http.Response response = await http.put(
//           'https://socialservices-6478e-default-rtdb.firebaseio.com/Privacy/$id.json',
//           body: json.encode(productData), );

//           print(response.body);
//  } catch (e) {
//    print('error:');
//    print(e);

//  }

// }

// Future<Null> fetchPrivcy()async{

//   _isLoading = true;
//     notifyListeners();

//   return await http.get(
//           'https://socialservices-6478e-default-rtdb.firebaseio.com/Privacy.json',
//         ).then<Null>((http.Response response) {

//       final Map<String, dynamic> productListData = json.decode(response.body);
//       print(productListData);

//       if (productListData == null) {
//         _isLoading = false;
//         notifyListeners();
//         return;
//       }
//      var value;
//         productListData.forEach((String productId, dynamic productData) {
//    value=productData['privacy'];

//       });

//   privacy=value;

//     _isLoading=false;
//     notifyListeners();
//     return;

//   });
// }

// void addAboutUs(String about)async{

// final Map<String, dynamic> productData = {
//       'about':about
//     };
//     var id='-MTWFdkPLyXuIAfJ2YaB';
//  try {
//    final http.Response response = await http.put(
//           'https://socialservices-6478e-default-rtdb.firebaseio.com/AbouUs/$id.json',
//           body: json.encode(productData), );

//           print(response.body);

//  } catch (e) {
//    print('error:');
//    print(e);

//  }

// }

// Future<Null> fetchAboutUS()async{

//   _isLoading = true;
//     notifyListeners();
// print('xxxx');

//   return await http.get(
//           'https://socialservices-6478e-default-rtdb.firebaseio.com/AbouUs.json',
//         ).then<Null>((http.Response response) {

//       final Map<String, dynamic> productListData = json.decode(response.body);
//       print(productListData);

//       if (productListData == null) {
//         _isLoading = false;
//         notifyListeners();
//         return;
//       }
//      var value;
//         productListData.forEach((String productId, dynamic productData) {
//    value=productData['about'];

//       });

//   aboutUs=value;

//     _isLoading=false;
//     notifyListeners();
//     return;

//   });
// }

}
