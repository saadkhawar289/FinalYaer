import 'dart:js';

import 'package:flutter/material.dart';
import 'package:freebies/Models/Games.dart';
import 'package:freebies/Models/Vedios.dart';
import 'package:freebies/Pages/addGames.dart';
import 'package:freebies/Pages/gameView.dart';
import 'package:freebies/Scoped-Model/mainModel.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

import '../../Pages/AddUpdateProduct.dart';

class GameCard extends StatelessWidget {
  final Games game;
  final int gameIndex;

  GameCard(
    this.game,
    this.gameIndex,
  );









Widget _buildSubmitButton() {
    return ScopedModelDescendant<MainModel>(
      builder: (BuildContext context, Widget child, MainModel model) {
        return IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () {
                    model.selectGame(model.allGames[gameIndex].id);
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (BuildContext context) {
                          return  AddGames();
                        },
                      ),
                    ).then((_) {
                      model.selectProudct(null);
                    });
                  },
                );
      },
    );
  }


Widget _buildSubmitButtondel() {
    return ScopedModelDescendant<MainModel>(
      builder: (BuildContext context, Widget child, MainModel model) {
        return IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () {
                    model.selectGame(model.allGames[gameIndex].id);
                    model.delGame();
                   
                    //  model.selectProudct(null);
                    
                  },
                );
      },
    );
  }





  Widget _buildTitlePriceRow() {
    return Container(
      padding: EdgeInsets.only(top: 10.0),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(game.tittle),
            SizedBox(
              //width: 90.0,
            ),
            //Text(game.link),
           _buildSubmitButton(),
           _buildSubmitButtondel()
                
            //  Text(''),
          ],
        ),
      ),
    );
  }


  DecorationImage _buildServiceBoxImage() {
    return DecorationImage(
        fit: BoxFit.fill,
        colorFilter:
            ColorFilter.mode(Colors.black.withOpacity(0.4), BlendMode.screen),
        image: AssetImage('assets/games.jpg'));
  }

  Future<bool> _settProviderID(String id) async {
    final pref = await SharedPreferences
        .getInstance(); //this line allow us to get the access to the shared preffrence(3rd party PACKAGE)  which helps us in getting or allow us a storage on the device
    pref.setString('pID', id);
    return true;
  }

  @override
  Widget build(BuildContext context) {
    final double deviceWidth = MediaQuery.of(context)
        .size
        .width; //this line is used for getting the device size and width and save it into variable
    Size size = MediaQuery.of(context).size;

    final double targetWidth = deviceWidth > 550.0 ? 500.0 : deviceWidth * 0.99;
    return GestureDetector(
      onTap: () {
        var id = game.id;
        _settProviderID(id);
        print(id);
        Navigator.of(context).push(MaterialPageRoute(
            builder: (BuildContext contetxt) => GameView(game)));
      },
      child: Card(
        shadowColor: Colors.amber,
        elevation: 30,
        child: Column(
          children: <Widget>[
            Stack(
              children: [
                Container(
                  height: size.width * 0.10,
                  width: size.width * 0.99,
                  decoration: BoxDecoration(image: _buildServiceBoxImage()),
                ),
                //  Positioned(
                //    top: 145,
                //    left: 260,
                //    child: Align(alignment: Alignment.topCenter,
                //               child: SmoothStarRating(
                //       color: Colors.amber,
                //       rating: service.rating,
                //       isReadOnly: true,
                //     ),

                //   ),)
              ],
            ),
            _buildTitlePriceRow(),
            SizedBox(
              height: 20,
            ),
           
            Container(
              height: 20,
            )
          ],
        ),
      ),
    );
  }
}
