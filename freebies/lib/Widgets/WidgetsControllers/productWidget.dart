import 'package:flutter/foundation.dart';
import 'package:freebies/Widgets/Cards/featuredProductCard.dart';
import 'package:freebies/Widgets/Cards/simpleProductCard.dart';

import '../../Models/Product.dart';
import 'package:flutter/material.dart'; 
import 'package:scoped_model/scoped_model.dart';
// import '../../Models/services.dart';
import '../../Scoped-Model/mainModel.dart';







class Products extends StatelessWidget {
final String typeOfCard;
final BuildContext context;






Products(this.typeOfCard,this.context);
Widget _buildServiceList(List<Product> products){
Widget serviceCard;

if(products.length > 0) {
      var width=MediaQuery.of(context).size.width;
      var target= width <=500?0.55:0.70;
      double target2= width <=500?290:260;
  serviceCard =  typeOfCard=='zzzz'? GridView.builder(padding: EdgeInsets.all(10), gridDelegate:SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: target2,childAspectRatio:target) ,
        itemBuilder: (BuildContext context, int index) =>SimpleProductCard(products[index],index),
          addAutomaticKeepAlives: true, 
        itemCount: products.length,
        scrollDirection: Axis.vertical,
        shrinkWrap: true,cacheExtent: 3,
       
      ):
      ListView.builder(
        scrollDirection: Axis.horizontal,
      itemBuilder: (BuildContext context, int index) =>ProductCard(products[index],index),
           addAutomaticKeepAlives: true, 
        itemCount: products.length,
        cacheExtent: 100.0,
      );


      //  itemBuilder: (BuildContext context, int index) => ,
      //      addAutomaticKeepAlives: false, 
      //   itemCount: services.length,
      //   cacheExtent: 100.0,
      // );
      //   
 } else {
      serviceCard = Container();
    }
    return serviceCard;
}



@override
  Widget build(BuildContext context) {

    return   ScopedModelDescendant<MainModel>(
      builder: (BuildContext context, Widget child, MainModel model) {
        return _buildServiceList(model.allproducts);
      },
    );
  }

}
