import 'package:freebies/Models/Games.dart';
import 'package:freebies/Models/Vedios.dart';
import 'package:freebies/Widgets/Cards/gameCard.dart';

import '../../Widgets/cards/vedioCard.dart';
import 'package:flutter/material.dart'; 
import 'package:scoped_model/scoped_model.dart';
import '../../Scoped-Model/mainModel.dart';







class GameController extends StatelessWidget {




Widget _buildServiceList(List<Games> game){
Widget providerCard;

if(game.length>0) {
      providerCard = GridView.builder(gridDelegate:SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 200,childAspectRatio: 0.60),
       itemBuilder: (BuildContext context, int index) =>GameCard(game[index],index),
           addAutomaticKeepAlives: false, 
        itemCount: game.length,
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
        return _buildServiceList(model.allGames);
      },
    );
  }

}
