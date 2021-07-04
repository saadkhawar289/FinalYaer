

import 'package:flutter/material.dart';
import 'package:freebies/Pages/AddUpdateProduct.dart';
// import 'edit_product.dart';
// import  './products_list.dart';
import '../Scoped-Model/mainModel.dart';

class VenderControll extends StatelessWidget {
final MainModel model;

VenderControll(this.model);
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
      length: 3,
      child: Scaffold(
        drawer: _buildSideDrawer(context),
        appBar: AppBar(
          title: Text('Dash Board'),
          backgroundColor: Color(0xff36332e),
          bottom: TabBar(
            tabs: <Widget>[
              Tab(
                icon:Icon(Icons.create),
                text: 'Manage Account',
              ),
              Tab(
                icon:Icon(Icons.list),
                text: 'Payments'
                ),
                Tab(
                icon:Icon(Icons.dashboard),
                text: 'All Orders'
                ),
                  Tab(
                icon:Icon(Icons.create),
                text: 'Manage Products',
              ),
            ],
          ),
        ),
        body: TabBarView(children:<Widget>[
              ProductEditPage(),
              ProductEditPage(),
              ProductEditPage(),
             // ProductEditPage(),              


        ] ),
      ),
    );
  }
}
