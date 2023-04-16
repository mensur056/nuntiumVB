import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grock/grock.dart';
import 'package:nuntium/bloc/home/home_state.dart';
import 'package:nuntium/presentation/global/custom_text_field.dart';
import 'package:nuntium/utility/constants/colors.dart';
import 'package:nuntium/utility/constants/icon_path.dart';

import '../../../bloc/home/home_cubit.dart';
import '../../../utility/constants/strings.dart';
import '../../global/custom_text_description.dart';
import '../../global/custom_text_title.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            if (state is HomeInProgress) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is HomeSuccess) {
              final values = state.items.docs.map((e) => e.data()).toList();
              return Padding(
                padding: 20.allP,
                child: ListView(
                  children: [
                    const _HomeTitle(),
                    const SizedBox(
                      height: 20,
                    ),
                    const _HomeSubtitle(),
                    const SizedBox(
                      height: 30,
                    ),
                    _HomeSearchField(),
                    const SizedBox(
                      height: 20,
                    ),
                    _HomeChip(),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: context.dynamicHeight(0.3),
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: values.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: 20.paddingOnlyRight,
                            child: Stack(children: [
                              Image.network(
                                values[index].image ?? '',
                                fit: BoxFit.cover,
                              ),
                              Positioned.fill(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Padding(
                                      padding: 12.paddingOnlyTopRight,
                                      child: InkWell(
                                          onTap: () {}, child: Image.asset(HomeIcon.save.toPath())),
                                    ),
                                    const Spacer(),
                                    Padding(
                                      padding: 12.allP,
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            values[index].title ?? '',
                                            style: Theme.of(context).textTheme.displaySmall,
                                          ),
                                          Text(
                                            values[index].description ?? '',
                                            style: Theme.of(context).textTheme.displayMedium,
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ]),
                          );
                        },
                      ),
                    ),
                    const _HomeRecommended(),
                    SizedBox(
                      height: context.dynamicHeight(0.4),
                      child: ListView.builder(
                        itemCount: 10,
                        itemBuilder: (context, index) {
                          return const ListTile(
                            title: Text('sdfsd'),
                          );
                        },
                      ),
                    )
                  ],
                ),
              );
            } else {
              return const Center(child: Text("There is a Error"));
            }
          },
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

class _HomeChip extends StatefulWidget {
  @override
  State<_HomeChip> createState() => _HomeChipState();
}

class _HomeChipState extends State<_HomeChip> {
  final List chipItems = ['Random', 'Sports', 'Gaming', 'Politics', 'Art', 'Food'];

  final Color chipColor = Colors.red;

  int selectIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.dynamicHeight(0.1),
      child: ListView.builder(
        itemCount: chipItems.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: 12.onlyRightP,
            child: Chip(
                labelPadding: const EdgeInsets.all(8),
                backgroundColor:
                    selectIndex == index ? AppColors.primaryColors : AppColors.chipPrimaryColor,
                label: FittedBox(
                  fit: BoxFit.fill,
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        selectIndex = index;
                      });
                    },
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.2,
                      child: Center(
                        child: Text(
                          chipItems[index],
                          style: TextStyle(
                            fontSize: 16,
                            color: selectIndex == index ? Colors.white : Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                )),
          );
        },
      ),
    );
  }
}

class _HomeSearchField extends StatelessWidget {
  final TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return CustomTextField(
        suffixIcon: InkWell(onTap: () {}, child: Image.asset(HomeIcon.mic.toPath())),
        controller: searchController,
        title: HomeStrings.hintTextSearch,
        iconPath: HomeIcon.search.toPath());
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
