import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grock/grock.dart';
import 'package:nuntium/bloc/home/home_detail_state.dart';
import 'package:nuntium/data/model/responses/category_model.dart';
import 'package:nuntium/presentation/pages/home/logic/home_detail_logic.dart';

import '../../../bloc/home/home_detail_cubit.dart';

class HomeDetailPage extends StatefulWidget {
  const HomeDetailPage({super.key});

  @override
  State<HomeDetailPage> createState() => _HomeDetailPageState();
}

class _HomeDetailPageState extends State<HomeDetailPage> {
  late final HomeDetailLogic _homeDetailLogic;
  @override
  void initState() {
    super.initState();
    _homeDetailLogic = HomeDetailLogic();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Item Page"),
      ),
      body: BlocBuilder<HomeDetailCubit, HomeDetailState>(
        builder: (context, state) {
          if (state is HomeDetailInProgress) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is HomeDetailSuccess) {
            return Padding(
                padding: 20.allP,
                child: Column(
                  children: [
                    DropdownButtonFormField<CategoryModel>(
                      hint: const Text('Select Category'),
                      items: state.items.map((e) {
                        return DropdownMenuItem<CategoryModel>(
                          value: e,
                          child: Text(e.name ?? ''),
                        );
                      }).toList(),
                      onChanged: (value) {
                        _homeDetailLogic.updateCategory(value);
                      },
                    ),
                    TextFormField(),
                    const SizedBox(
                      height: 30,
                    ),
                    InkWell(
                      onTap: () async {
                        await _homeDetailLogic.pickImage();
                        setState(() {});
                      },
                      child: SizedBox(
                        height: context.dynamicHeight(0.2),
                        child: DecoratedBox(
                          decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
                          child: Center(
                              child: _homeDetailLogic.selectedImage != null
                                  ? Image.memory(_homeDetailLogic.selectedImage!)
                                  : const Icon(Icons.add_a_photo_outlined)),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    ElevatedButton(onPressed: () {}, child: const Center(child: Text("Send")))
                  ],
                ));
          } else {
            return const Center(child: Text("There is a Error"));
          }
        },
      ),
    );
  }
}
