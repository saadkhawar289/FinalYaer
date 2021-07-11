

import 'package:flutter/material.dart';
import 'package:freebies/Pages/AddUpdateProduct.dart';
// import 'edit_product.dart';
// import  './products_list.dart';
import '../Scoped-Model/mainModel.dart';
import 'addGames.dart';

class AdminControll extends StatelessWidget {
final MainModel model;

AdminControll(this.model);
Widget _buildSideDrawer(BuildContext context){

return Drawer(
          child: Column(
            children: <Widget>[
              AppBar(
                backgroundColor: Color(0xff36332e),

                automaticallyImplyLeading: false, // this is used for the removal of side boger button on side drawer appbar
                title: Text("choose"),
              ),
              ListTile(
                //this is good for options in a side drawer but if we have a long list in side drawr we shoukd use list veiw like used in products page
                leading: Icon(Icons.store),
                title: Text('All Products'),
                onTap: () {
                  Navigator.pushReplacementNamed(context, '/');
                      
                },
              ),
               Divider(),
          
            ],
          ),
        );





}

 

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        drawer: _buildSideDrawer(context),
        appBar: AppBar(
          title: Text('Dash Board'),
          backgroundColor: Color(0xff36332e),
          bottom: TabBar(
            tabs: <Widget>[
              Tab(
                icon:Icon(Icons.create),
                text: 'Manage Product',
              ),
              Tab(
                icon:Icon(Icons.list),
                text: 'Sellers Request'
                ),
                Tab(
                icon:Icon(Icons.dashboard),
                text: 'All Orders'
                ),
                 Tab(
                icon:Icon(Icons.dashboard),
                text: 'Entertainment'
                ),
            ],
          ),
        ),
        body: TabBarView(children:<Widget>[
              AddGames(),
              ProductEditPage(),
              ProductEditPage(),
              ProductEditPage(),              


        ] ),
      ),
    );
  }
}
