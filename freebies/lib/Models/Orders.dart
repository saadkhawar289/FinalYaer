import 'package:freebies/Models/Product.dart';
import 'package:meta/meta.dart';

class Orders {
  List<Product> cartItems;
  String uid;
  int price;
  String time;
  String date;
  String status ='incomplete';
  String orderID;
  List<String> providerIDS;
  Orders({
   @required this.cartItems,
   @required this.providerIDS,
    @required this.uid,
     @required this.price,
   @required  this.time,
      @required this.date,
      @required this.status,
      @required this.orderID,
  });







Orders.fromJson(Map<String, dynamic> json)
      : cartItems = json['cartItems'],
      uid=json['uid'],
      date=json['date'],
      orderID=json['orderID'],
      time=json['time'],
      status=json['status'],
      providerIDS=json['providerIDS'],
      price = json['price'];
        
     Map<String, dynamic> toJson() {
    return {
      'cartItems': cartItems,
      'uid':uid,
      'price':price,
      'date':date,
      'orderID':orderID,
      'status':status,
      'time':time,
      'providerIDS':providerIDS

    };
     }

}
