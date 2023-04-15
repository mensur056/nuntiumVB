import 'package:flutter/material.dart';
import 'package:grock/grock.dart';
import 'package:nuntium/utility/constants/colors.dart';

import '../../../utility/constants/strings.dart';
import '../../global/custom_text_description.dart';
import '../../global/custom_text_title.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: 20.allP,
          child: ListView(
            children: [
              const _HomeTitle(),
              const _HomeSubtitle(),
              const _HomeSearchField(),
              const _HomeChip(),
              SizedBox(
                height: context.dynamicHeight(0.3),
                child: ListView.builder(
                  itemCount: 5,
                  itemBuilder: (BuildContext context, int index) {
                    return const Placeholder();
                  },
                ),
              ),
              const _HomeRecommended(),
              SizedBox(
                height: context.dynamicHeight(0.2),
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return const ListTile(
                      title: Text('sdfsd'),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _HomeRecommended extends StatelessWidget {
  const _HomeRecommended();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text(HomeStrings.recommended),
        TextButton(onPressed: () {}, child: const Text(HomeStrings.seeAll))
      ],
    );
  }
}

class _HomeChip extends StatelessWidget {
  const _HomeChip();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.dynamicHeight(0.1),
      child: ListView.builder(
        itemCount: 5,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return const Chip(label: Text("data"));
        },
      ),
    );
  }
}

class _HomeSearchField extends StatelessWidget {
  const _HomeSearchField();

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        prefixIcon: IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
        suffixIcon: IconButton(onPressed: () {}, icon: const Icon(Icons.mic)),
        hintText: HomeStrings.hintTextSearch,
        fillColor: AppColors.textFieldColor,
        filled: true,
        border: const OutlineInputBorder(
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}

class _HomeSubtitle extends StatelessWidget {
  const _HomeSubtitle();

  @override
  Widget build(BuildContext context) {
    return const Align(
        alignment: Alignment.topLeft, child: CustomTextDescription(title: HomeStrings.discover));
  }
}

class _HomeTitle extends StatelessWidget {
  const _HomeTitle();

  @override
  Widget build(BuildContext context) {
    return const CustomTextTitle(
      title: HomeStrings.browse,
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
