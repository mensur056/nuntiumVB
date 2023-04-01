import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';

enum FirebaseColllections {
  version;

  CollectionReference get reference => FirebaseFirestore.instance.collection(name);
}

enum PlatformEnum {
  android,
  ios;

  static String get versionName {
    if (Platform.isIOS) {
      return PlatformEnum.ios.name;
    }
    if (Platform.isAndroid) {
      return PlatformEnum.android.name;
    }
    throw Exception('Error');
  }
}

// class SplashDataSource {
//   String? getVersionNumberFromDataBase() {
//     if (kIsWeb) return null;
//     final response = FirebaseColllections.version.reference
//         .withConverter<VersionModel>(
//           fromFirestore: (snapshot, options) => VersionModel().fromFirebase(snapshot.data()),
//           toFirestore: (value, options) {
//             return value.toJson();
//           },
//         )
//         .doc(PlatformEnum.versionName);

//     return null;
//   }
// }
