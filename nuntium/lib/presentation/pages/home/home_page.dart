import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grock/grock.dart';

import '../../../bloc/home/home_cubit.dart';
import '../../../bloc/home/home_state.dart';
import '../../../utility/constants/colors.dart';
import '../../../utility/constants/icon_path.dart';
import '../../../utility/constants/strings.dart';
import '../../global/custom_text_description.dart';
import '../../global/custom_text_field.dart';
import '../../global/custom_text_title.dart';
import 'home_detail_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(),
      bottomNavigationBar: _bottomNavigationBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) {
              return const HomeDetailPage();
            },
          ));
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  BottomNavigationBar _bottomNavigationBar() {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(label: '', icon: Image.asset(HomeIcon.home.toPath())),
        BottomNavigationBarItem(label: '', icon: Image.asset(HomeIcon.apps.toPath())),
        BottomNavigationBarItem(label: '', icon: Image.asset(HomeIcon.bookmark.toPath())),
        BottomNavigationBarItem(label: '', icon: Image.asset(HomeIcon.profile.toPath())),
      ],
    );
  }

  Widget _body() {
    return SafeArea(
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          if (state is HomeInProgress) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is HomeSuccess) {
            final newsValue = state.newsItems;
            final tagValue = state.tagItems;

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
                  SizedBox(
                    height: context.dynamicHeight(0.1),
                    child: ListView.builder(
                      itemCount: tagValue?.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: 12.onlyRightP,
                          child: Chip(
                              labelPadding: const EdgeInsets.all(8),
                              backgroundColor: (tagValue?[index].isactive ?? false)
                                  ? AppColors.primaryColors
                                  : AppColors.chipPrimaryColor,
                              label: FittedBox(
                                fit: BoxFit.fill,
                                child: InkWell(
                                  onTap: () {},
                                  child: SizedBox(
                                    width: MediaQuery.of(context).size.width * 0.2,
                                    child: Center(
                                      child: Text(
                                        tagValue?[index].name ?? '',
                                        style: const TextStyle(
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              )),
                        );
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: context.dynamicHeight(0.3),
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: newsValue?.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: 20.paddingOnlyRight,
                          child: Stack(children: [
                            Image.network(
                              newsValue?[index].image ?? '',
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
                                          newsValue?[index].title ?? '',
                                          style: Theme.of(context).textTheme.displaySmall,
                                        ),
                                        Text(
                                          newsValue?[index].description ?? '',
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
                    height: context.dynamicHeight(0.5),
                    child: ListView.builder(
                      itemCount: newsValue?.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: 8.onlyBottomP,
                          child: Row(
                            children: [
                              Image.network(
                                newsValue?[index].image ?? '',
                                height: 96,
                              ),
                              Expanded(
                                child: ListTile(
                                  title: CustomTextDescription(
                                    textAlign: TextAlign.start,
                                    title: newsValue?[index].title ?? '',
                                  ),
                                  subtitle: Text(
                                    newsValue?[index].description ?? '',
                                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                        ),
                                  ),
                                ),
                              ),
                            ],
                          ),
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
    );
  }
}

class _HomeRecommended extends StatelessWidget {
  const _HomeRecommended();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: 10.verticalP,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            HomeStrings.recommended,
            style: TextStyle(color: Colors.black, fontSize: 24, fontWeight: FontWeight.w500),
          ),
          TextButton(
              onPressed: () {},
              child: const Text(
                HomeStrings.seeAll,
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 20,
                ),
              ))
        ],
      ),
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
