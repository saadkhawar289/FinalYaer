


import 'package:flutter/material.dart';
import 'package:freebies/Models/User.dart';
import 'package:scoped_model/scoped_model.dart';

import '../Scoped-Model/mainModel.dart';




class ProviderListPage extends StatefulWidget {

final MainModel model;
ProviderListPage(this.model);

  
  @override
  State<StatefulWidget> createState() {
    
    return _ProviderlistPageState();
  }
}

class _ProviderlistPageState extends State<ProviderListPage>{
  @override
initState(){
  widget.model.fetchUsers();
  super.initState();
}


void _submitForm(Function approveProvider,String id,User selectedVendor) async{
 
 
        approveProvider(id,selectedVendor).then((bool success) {
        if (success) {
                     
                       Scaffold.of(context).showSnackBar(
            SnackBar(shape: RoundedRectangleBorder(  borderRadius: BorderRadius.only(
                  topLeft:Radius.circular(15),
                  topRight: Radius.circular(15), 
                  )   ),
              backgroundColor: Colors.green, 
              content: Container(
                
                child:Row(children: [
                  Center( child:Icon(Icons.thumb_up,size: 35,color: Colors.blue[900],), ),
                  SizedBox(width: 35,),
                        Text('Approved',style:TextStyle(fontSize: 28.0, fontWeight:FontWeight.bold,color: Colors.white )),
                        
                ],),
                height: 30,
                 width: 70,
                 )
                 )
                 );
              
        } else {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text('Some Thing Went Wrong'),
                  content: Text('Please Try Again'),
                  actions: <Widget>[
                    FlatButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: Text('Okay'),
                    )
                  ],
                );
              });
        }
      });
     
        
    
  }



 Widget _buildSubmitButton(int index) {
   var ss;
    return ScopedModelDescendant<MainModel>(
      builder: (BuildContext context, Widget child, MainModel model) {
        return model.isLoading ? CircularProgressIndicator(): IconButton(
                icon: Icon(Icons.playlist_add_check),
                onPressed: () =>{
                  ss= model.allusers[index].id,
                  model.selectUser(ss),
                  _submitForm(
                  model.approvedProviders,
                  ss,
                  model.user 
                   )} ,
              );
      },
    );
  }





  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<MainModel>(builder: (BuildContext context,Widget child,MainModel model){

return model.allusers.length == 0 ? Scaffold(body:Center(child:Text("No Request Avaliable")))
      :ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: (){
            print('object');
          },
            //       child: Dismissible(  
            //                                          // this is used to make left to right or vice versa swipe option on the product in the product list
            // key: Key(model.allServiceProviders[index].id),                         // this is key which tells flutter to update the list and dont show this certain product in list
            // onDismissed: (DismissDirection direction){
            //   if(direction == DismissDirection.endToStart){
                
            //    model.selectProudct(model.allServiceProviders[index].id);
            //    model.allServiceProviders.removeAt(model.selectedProviderIndex);
              
            //   }
            //   else if(direction == DismissDirection.startToEnd){

            //     print('Swaipr Other Side');
            //   }


            // },
            // background: Container(
            //   padding:EdgeInsets.symmetric(horizontal:30,vertical: 30,),
            //   child:Text('DELETE',textAlign: TextAlign.right,style:TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
            //   color: Colors.red
              
            // ),
            
                        child: Column( 
                  children: <Widget>[
                    ListTile(
                      leading: CircleAvatar(radius: 25,
                          backgroundImage:NetworkImage(model.allusers[index].image)),                        // NetworkImage(model.allServiceProviders[index].image)
                      title: Text(model.allusers[index].name),
                      subtitle: Text(model.allusers[index].cnic),
                      trailing: _buildSubmitButton(index),
                    ),
                    Divider(            // this is used to make bar between two cards like <hr> tag in css
                      color: Colors.red,
                      height: 10.0,
                    )
                    
                  ],
                ),
            
            
          
        );
      },
      itemCount:model.allusers.length,
    );
  },
  ); 
  }
}



  
