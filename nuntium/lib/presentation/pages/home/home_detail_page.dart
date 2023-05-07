import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grock/grock.dart';
import 'package:kartal/kartal.dart';
import 'package:nuntium/bloc/home/home_detail_state.dart';
import 'package:nuntium/data/model/responses/category_model.dart';
import 'package:nuntium/presentation/pages/home/logic/home_detail_logic.dart';
import '../../../bloc/home/home_detail_cubit.dart';

class HomeDetailPage extends StatefulWidget {
  const HomeDetailPage({super.key});

  @override
  State<HomeDetailPage> createState() => _HomeDetailPageState();
}

class _HomeDetailPageState extends State<HomeDetailPage> with Loading {
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
        actions: [
          if (isLoading)
            const Center(
              child: CircularProgressIndicator(
                color: Colors.white,
              ),
            )
        ],
        title: const Text("Add Item Page"),
      ),
      body: BlocBuilder<HomeDetailCubit, HomeDetailState>(
        builder: (context, state) {
          if (state is HomeDetailInProgress) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is HomeDetailSuccess) {
            final category = state.items;
            return Form(
              key: _homeDetailLogic.formKey,
              onChanged: () {
                _homeDetailLogic.checkValidateAndSave(
                  (value) {
                    setState(() {});
                  },
                );
              },
              child: Padding(
                  padding: 20.allP,
                  child: Column(
                    children: [
                      _HomeCategoryDropDown(
                        categories: category,
                        onSelected: _homeDetailLogic.updateCategory,
                      ),
                      TextFormField(
                        controller: _homeDetailLogic.titleController,
                        validator: (value) => value.isNullOrEmpty ? 'Not empty' : null,
                        decoration: const InputDecoration(
                          hintText: 'Description',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      InkWell(
                        onTap: () async {
                          await _homeDetailLogic.pickAndCheck(
                            (value) {
                              setState(() {});
                            },
                          );
                          setState(() {});
                        },
                        child: SizedBox(
                          height: 200,
                          child: DecoratedBox(
                            decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
                            child: Center(
                                child: _homeDetailLogic.selectedFileBytes != null
                                    ? Image.memory(_homeDetailLogic.selectedFileBytes!)
                                    : const Icon(Icons.add_a_photo_outlined)),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      ElevatedButton(
                        onPressed: _homeDetailLogic.isValidateAllForm
                            ? () async {
                                changeLoading();
                                final response = await _homeDetailLogic.save();
                                changeLoading();
                                if (!mounted) return;
                                await context.pop<bool>(response);
                              }
                            : null,
                        child: const Center(
                          child: Text("Send"),
                        ),
                      )
                    ],
                  )),
            );
          } else {
            return const Center(child: Text("There is a Error"));
          }
        },
      ),
    );
  }
}

class _HomeCategoryDropDown extends StatelessWidget {
  const _HomeCategoryDropDown({
    required this.onSelected,
    required this.categories,
  });

  final List<CategoryModel> categories;
  final ValueSetter<CategoryModel> onSelected;
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<CategoryModel>(
      validator: (value) => value == null ? 'Not empty' : null,
      hint: const Text('Select Category'),
      items: categories.map((e) {
        return DropdownMenuItem<CategoryModel>(
          value: e,
          child: Text(e.name ?? ''),
        );
      }).toList(),
      onChanged: (value) {
        if (value == null) return;
        onSelected.call(value);
      },
    );
  }
}

mixin Loading on State<HomeDetailPage> {
  bool isLoading = false;

  void changeLoading() {
    setState(() {
      isLoading = !isLoading;
    });
  }
}
