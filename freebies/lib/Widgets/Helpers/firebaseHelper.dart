import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart' ;



class MYFirebase{


 static StorageUploadTask uploadTask(File file){


  try {
    final ress=FirebaseStorage.instance.ref(); 

return ress.putFile(file);
  } catch (e) {
    return e;
  }



 }




}