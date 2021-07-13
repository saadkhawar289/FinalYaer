

import 'package:flutter/material.dart';
import 'package:freebies/Pages/AddUpdateProduct.dart';
import 'package:freebies/Pages/VendorDashBoard.dart';
import 'package:freebies/Pages/vendorOrder.dart';
// import 'edit_product.dart';
// import  './products_list.dart';
import '../Scoped-Model/mainModel.dart';

class VendorControll extends StatelessWidget {
final MainModel model;

VendorControll(this.model);
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
                title: Text('Logout'),
                onTap: () {
                  Navigator.pushReplacementNamed(context, '/VendorLogin');
                      
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
      length: 2,
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
                text: 'Orders'
                ),
                
            ],
          ),
        ),
        body: TabBarView(children:<Widget>[
              VendorDashboard(model),
              ProviderOrders(model),
                            


        ] ),
      ),
    );
  }
}
