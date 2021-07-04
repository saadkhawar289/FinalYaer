



import 'package:flutter/material.dart';
import 'package:freebies/Pages/SingleProduct.dart';
import 'package:scoped_model/scoped_model.dart';
import '../../Models/Product.dart';
import '../../Scoped-Model/mainModel.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

// import '../helpers/session.dart';

// import 'package:shared_preferences/shared_preferences.dart';

class ProductCard extends StatelessWidget {
 
 
  final Product product;
  final int productIndex;

  ProductCard(this.product, this.productIndex,);

  DecorationImage _buildServiceBoxImage() {
    return DecorationImage(
      fit: BoxFit.fill,
      colorFilter:
          ColorFilter.mode(Colors.black.withOpacity(0.4), BlendMode.screen),
      image:NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQubf5b89mP5fjIfUYGvtak5L0w1m0p2wLj0g&usqp=CAU')

    );
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
      padding: const EdgeInsets.all(6.0),
      child:   SmoothStarRating(size: 10,
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
        'Rs '+ product.price.toString(),
        style: TextStyle(
       
          fontWeight: FontWeight.bold,
          color:Colors.black
        ),
      ),
    );
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

Widget _buildProductRewiew() {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: Text(
        'Reviews',
        textScaleFactor: 1,
        style: TextStyle(
          // fontSize: 18.0,
          fontWeight: FontWeight.bold,
          color: Colors.grey,
        ),
      ),
    );
  }


Widget _addToCart(BuildContext context) {
  double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;


     final double targetWidth = deviceWidth > 550.0 
        ? deviceWidth *
            0.25
        : deviceWidth *
            0.99; 
        final double targetHeight = deviceHeight > 550.0
        ? 50
            
        : deviceHeight *
            0.005; 



    return ScopedModelDescendant<MainModel>(
      builder: (BuildContext context, Widget child, MainModel model) {
        return model.isLoading
            ? Center(child: CircularProgressIndicator())
            :     Padding(
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
         margin: EdgeInsets.only(top:0),
                  child: Center(
                      child:  FlatButton(child: Text('VIEW',style:TextStyle( 
                          fontWeight:FontWeight.bold,
                          color: Colors.yellow[700],
                          ),),
                          onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
                          return SingleProductPage(product);
                        },));
                } ), 
                          ) 
                            
                  ),
                  
            );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
   

    
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;


     final double targetWidth = deviceWidth > 550.0 
        ? 500.0
        : deviceWidth *
            0.97; 
        final double targetHeight = deviceHeight > 550.0
        ? 600.0
        : deviceHeight *
            0.10;     
    return ScopedModelDescendant<MainModel>(
        builder: (BuildContext context, Widget child, MainModel model) {
      return GestureDetector(
        onTap: () {
},        
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: GestureDetector(
            onTap: (){
             Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
                          return SingleProductPage(product);
                        },));
            },
                      child: Container(

              decoration: BoxDecoration(
                 border: Border.all(width: 2,
                 color: Colors.black,
                 ),
                  color:Colors.white,
                
                  ),
             
               width:targetWidth*0.50,

             
               // color: Colors.red,
             
                child:  SingleChildScrollView(
                //  reverse: true,
                                child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[

                    Container(
                      decoration: BoxDecoration(
                       
                        image: _buildServiceBoxImage(),
                           color: Colors.white54,
                      ),
              
                      width: deviceWidth*0.0,
                      height:deviceHeight >= 800 ? deviceHeight*0.18:deviceHeight*0.18,
                      child: Padding(
                        padding: const EdgeInsets.all(0.0),
                        
                        child: Align(
                          alignment: Alignment.bottomRight,
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: IconButton(
                icon: Icon(model.allproducts[productIndex].isfavourite
                    ? Icons.favorite
                    : Icons.favorite_border),
                color: Colors.red,
                onPressed: () {
                  model.selectProudct(model.allproducts[productIndex].id);
                  model.favouiteToogleButton();
                  
                },
              ),
                          ))
                        ),
                    ),
                    
                    Center(child: _buildProductName()),
                    Center(
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                                        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween ,children: [
                              _buildProductRating(),
                             SizedBox(width:deviceWidth*0.05,),
                              _buildProductRewiew()
                        ],),
                      ),
                    ),
             Center(child: _buildProductPrice()),
             SizedBox(height:3),
                  //  Text((targetWidth).toString()),
              _addToCart(context), 
                  //   Text((targetHeight).toString()),
                  //  Text((targetWidth/2).toString()),
                  //  Text((targetHeight/2).toString()),
                   
                    ],
                    ),
                ),
                                
                
              
            ),
          ),
        ),
      );
    });
  }
}
