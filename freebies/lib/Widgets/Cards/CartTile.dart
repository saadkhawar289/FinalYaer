import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import '../../Models/Product.dart';
import '../../Scoped-Model/mainModel.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

// import '../helpers/session.dart';

// import 'package:shared_preferences/shared_preferences.dart';

class CartTile extends StatelessWidget {
  final Product product;
  final int index;

  const CartTile(this.product, this.index);

  DecorationImage _buildServiceBoxImage(String image) {
    return DecorationImage(
        fit: BoxFit.cover,
        colorFilter:
            ColorFilter.mode(Colors.black.withOpacity(0.4), BlendMode.screen),
        image:
            image == null ? AssetImage('assets/ccc.jpg') : NetworkImage(product.image));
  }

  // Future<bool> _settServiceID(String id) async {
  //   final pref = await SharedPreferences.getInstance();
  //   pref.setString('id', id);
  //   return true;
  // }

  Widget _buildProductName() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Text(
        product.tittle,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
    );
  }

  Widget _buildProductRating() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: SmoothStarRating(
        size: 10,
        color: Colors.amber,
        rating: 4,
        isReadOnly: true,
      ),
    );
  }

  Widget _buildProductPrice() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Text(
        'Rs ' + product.price.toString(),
        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.green,
      ),
    ));
  }

// Widget _buildProductRating() {
//     return Padding(
//       padding: const EdgeInsets.all(10.0),
//       child: Text(
//         product.description,
//         style: TextStyle(

//           fontWeight: FontWeight.bold,
//           color: Colors.black,
//         ),
//       ),
//     );
//   }

  Widget _buildTotalPrice() {
    var prod=product.price;
    var total=prod*product.quantity;
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Text(
        total.toString() ,
        style: TextStyle(
          // fontSize: 18.0,
          fontWeight: FontWeight.bold,
          color: Colors.red,
        ),
      ),
    );
  }

  Widget _addToCart(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;

    final double targetWidth =
        deviceWidth > 550.0 ? deviceWidth * 0.25 : deviceWidth * 0.99;
    final double targetHeight =
        deviceHeight > 550.0 ? 50 : deviceHeight * 0.005;

    return ScopedModelDescendant<MainModel>(
      builder: (BuildContext context, Widget child, MainModel model) {
        return model.isLoading
            ? Center(child: CircularProgressIndicator())
            : Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: //Colors.yellow[700]
                          Colors.black
                      //grey[850],

                      ),
                  // width: deviceWidth*0.60,
                  // height: deviceHeight*0.060,
                  margin: EdgeInsets.only(top: 0),
                  child: Center(
                      child: FlatButton(
                          child: Text(
                            'VIEW',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.yellow[700],
                            ),
                          ),
                          onPressed: () {
                            //  print('saadddddd');
                            Navigator.pushNamed(context, '/SingleProductPage');
                          })),
                ),
              );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;

    final double targetWidth =
        deviceWidth > 550.0 ? deviceWidth * 0.65 : deviceWidth * 0.97;
    final double targetHeight =
        deviceHeight > 550.0 ? deviceHeight * 0.50 : deviceHeight * 0.10;
    return ScopedModelDescendant<MainModel>(
        builder: (BuildContext context, Widget child, MainModel model) {
      return GestureDetector(
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.all(0.0),
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/SingleProductPage');
              },
              
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Center(
                    child: Container(
                       width:deviceWidth<600?targetWidth*0.75: targetWidth*0.95,
                      decoration: BoxDecoration(
                //  border: Border.all(width: 2,
                //  color: Colors.black,
                //  ),
                  color:Colors.white54,
                
                  ),
                     
                      child: Row(
                        children: [
                          CircleAvatar(
                            backgroundImage: NetworkImage(product.image),
                            radius: 25,
                          ),
                          Expanded(child: _buildProductName()),
                          Expanded(child: _buildProductPrice()),

                          Expanded(
                              child: Text('${product.quantity.toString()} Qty',style: TextStyle(fontWeight: FontWeight.bold, color: Colors.yellow,
      ),)),

                          //Spacer(),
                          Expanded(
                            
                              child: _buildTotalPrice())
                        ],
                      ),
                    ),
                  ),
                ),
             
            ),
          ));
    });
  }
}

// Dismissible(
//                                                      // this is used to make left to right or vice versa swipe option on the product in the product list
//             key: Key(model.cartItems[index].id),                         // this is key which tells flutter to update the list and dont show this certain product in list
//             onDismissed: (DismissDirection direction){
//               if(direction == DismissDirection.endToStart){

//               model.cartItems.removeAt(index);

//               }
//               else if(direction == DismissDirection.startToEnd){

//                 print('Swaipr Other Side');
//               }

//             },
//             background: Container(
//               padding:EdgeInsets.symmetric(horizontal:30,vertical: 30,),
//               child:Text('DELETE',textAlign: TextAlign.right,style:TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
//               color: Colors.red

//             ),

//                         child: Column(
//                   children: <Widget>[

//                   ],
//                 ),

//         );
