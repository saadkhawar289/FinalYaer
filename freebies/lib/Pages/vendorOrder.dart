


import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import '../Scoped-Model/mainModel.dart';




class ProviderOrders extends StatefulWidget {

final MainModel model;
ProviderOrders(this.model);

  
  @override
  State<StatefulWidget> createState() {
    
    return _ProviderOrdersState();
  }
}

class _ProviderOrdersState extends State<ProviderOrders>{
  @override
initState(){
String rqstTyp='provider';
  widget.model.fetchOrders(rqstTyp);
  super.initState();
}


Widget _buildDrawer(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          AppBar(
             backgroundColor:Color(0xff36332e),
            automaticallyImplyLeading:
                false, // this for the button to hide when drawer is open
            title: Text('Choose'),
          ),
        
           ListTile(
            leading: Icon(Icons.assignment),
            title: Text('About Us'),
            onTap: () {
 Navigator.pushNamed(context, '/aboutUS'); },
          ),
          Divider(),
              ListTile(
            leading: Icon(Icons.pan_tool),
            title: Text('Privacy Policies'),
            onTap: () {
 Navigator.pushNamed(context, '/privacy'); },
          ),
          Divider(),
        ],
      ),
    );
  }







  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<MainModel>(builder: (BuildContext context,Widget child,MainModel model){

return Scaffold(
        drawer: _buildDrawer(context),
        body:model.orders.length == 0 ?  Center(child:Text("No Orders Avaliable")):ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: (){
            print('object');
          },
                  child: Dismissible(  
                                                     // this is used to make left to right or vice versa swipe option on the product in the product list
            key: Key(model.allorders[index].orderID),                         // this is key which tells flutter to update the list and dont show this certain product in list
            onDismissed: (DismissDirection direction){
              if(direction == DismissDirection.endToStart){
                
              // model.selectProudct(model.registrationForms[index].id);
              // model.deleteProduct(index);
              return print('sa,klk');
              }
              else if(direction == DismissDirection.startToEnd){

                print('Swaipr Other Side');
              }


            },
            background: Container(
              padding:EdgeInsets.symmetric(horizontal:30,vertical: 30,),
              child:Text('DELETE',textAlign: TextAlign.right,style:TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
              color: Colors.red
              
            ),
            
                        child: Column( 
                  children: <Widget>[
                    ListTile(
                      leading: CircleAvatar(maxRadius: 20,
                          backgroundImage:AssetImage('assets/ccc.jpg')),                        // NetworkImage(model.allServiceProviders[index].image)
                      title: Text(model.allorders[index].cartItems.toString(),style: TextStyle(fontSize: 20,fontWeight:FontWeight.bold ),),
                      subtitle: Text('\$£ {model.allorders[index].price}',style: TextStyle(fontSize: 15,fontWeight:FontWeight.bold ),),
                     trailing:Text(model.allorders[index].date.substring(0,16),style: TextStyle(fontSize: 15,fontWeight:FontWeight.bold )),
                    ),
                    Divider(            // this is used to make bar between two cards like <hr> tag in css
                      color: Colors.red,
                      height: 10.0,
                    )
                    
                  ],
                ),
            
            
          ),
        );
      },
      itemCount:model.allorders.length,
    ));
        
     } );
      
  }
  
  }




  
