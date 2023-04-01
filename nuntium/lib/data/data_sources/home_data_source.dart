
// class HomeDataSource {
//   void fetchAllItemFromDatabase() {
//     CollectionReference news = FirebaseFirestore.instance.collection('news');
//     final response = news.withConverter(
//       fromFirestore: (snapshot, options) {
//         return NewsModel().fromFirebase(snapshot);
//       },
//       toFirestore: (value, options) {
//         if (value == null) throw Exception();
//         return value.toJson();
//       },
//     ).get();
//   }
// }
