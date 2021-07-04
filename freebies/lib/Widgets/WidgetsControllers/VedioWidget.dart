import 'package:freebies/Models/Vedios.dart';

import '../../Widgets/cards/vedioCard.dart';
import 'package:flutter/material.dart'; 
import 'package:scoped_model/scoped_model.dart';
import '../../Scoped-Model/mainModel.dart';







class VedioController extends StatelessWidget {




Widget _buildServiceList(List<Vedios> _provider){
Widget providerCard;

if(_provider.length>0) {
      providerCard = GridView.builder(gridDelegate:SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 200,childAspectRatio: 0.60),
       itemBuilder: (BuildContext context, int index) =>VedioCard(_provider[index],index),
           addAutomaticKeepAlives: false, 
        itemCount: _provider.length,
        cacheExtent: 50.0,
      );
    
      //  itemBuilder: (BuildContext context, int index) => ,
      //      addAutomaticKeepAlives: false, 
      //   itemCount: services.length,
      //   cacheExtent: 100.0,
      // );
      //   
 } else {
      providerCard = Container();
    }
    return providerCard;
}



@override
  Widget build(BuildContext context) {

    return   ScopedModelDescendant<MainModel>(
      builder: (BuildContext context, Widget child, MainModel model) {
        return _buildServiceList(model.allvedios);
      },
    );
  }

}
