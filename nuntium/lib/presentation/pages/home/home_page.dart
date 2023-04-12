import 'package:flutter/material.dart';
import 'package:grock/grock.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: ListView(
        children: [
          const Text("Browse"),
          const Text("Discover things of this world"),
          const TextField(),
          SizedBox(
            height: context.dynamicHeight(0.1),
            child: ListView.builder(
              itemCount: 5,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return const Chip(label: Text("data"));
              },
            ),
          ),
          SizedBox(
            height: context.dynamicHeight(0.3),
            child: ListView.builder(
              itemCount: 5,
              itemBuilder: (BuildContext context, int index) {
                return const Placeholder();
              },
            ),
          ),
        ],
      ),
    );
  }
}
























// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:nuntium/data/model/responses/news_model.dart';

// class HomePage extends StatefulWidget {
//   const HomePage({super.key});

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   @override
//   Widget build(BuildContext context) {
//     CollectionReference news = FirebaseFirestore.instance.collection("news");
//     final response = news.withConverter<NewsModel>(
//       fromFirestore: (snapshot, options) {
//         return NewsModel.fromJson(snapshot.data()!);
//       },
//       toFirestore: (value, options) {
//         if (value == null) throw Exception();
//         return value.toJson();
//       },
//     ).get();
//     return Scaffold(
//       appBar: AppBar(),
//       body: FutureBuilder(
//         future: response,
//         builder: (context, AsyncSnapshot snapshot) {
//           switch (snapshot.connectionState) {
//             case ConnectionState.none:
//               return const LinearProgressIndicator();

//             case ConnectionState.active:
//               return const LinearProgressIndicator();

//             case ConnectionState.waiting:
//               return const LinearProgressIndicator();
//             case ConnectionState.done:
//               if (snapshot.hasData) {
//                 final values = snapshot.data!.docs.map((e) => e.data()).toList();
//                 return ListView.builder(
//                   itemCount: values.length,
//                   itemBuilder: (BuildContext context, int index) {
//                     return Card(
//                       child: Column(
//                         children: [
//                           Image.network(values[index]?.image ?? ''),
//                           Text(values[index]?.title ?? '')
//                         ],
//                       ),
//                     );
//                   },
//                 );
//               } else {
//                 print(snapshot.data);
//                 return const Text('sdfsdfsdfsdfsdf');
//               }
//           }
//         },
//       ),
//     );
//   }
// }
