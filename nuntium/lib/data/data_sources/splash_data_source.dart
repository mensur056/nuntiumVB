import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

enum FirebaseColllections {
  version;

  CollectionReference get reference => FirebaseFirestore.instance.collection(name);
}

enum PlatformEnum {
  android,
  ios;

  static String get versionName{
    if(Platform.isIOS){
      return PlatformEnum.ios.name;
    }
    if(Platform.isAndroid){
      return PlatformEnum.android.name;

    }
return '';
  }
}

class SplashDataSource {
  String? getVersionNumberFromDataBase() {
    if(kIsWeb) return null;
    FirebaseColllections.version.reference.doc()
  
    return null;}
}
