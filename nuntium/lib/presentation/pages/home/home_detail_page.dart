import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grock/grock.dart';
import 'package:nuntium/bloc/home/home_detail_state.dart';
import 'package:nuntium/data/model/responses/category_model.dart';

import '../../../bloc/home/home_detail_cubit.dart';

class HomeDetailPage extends StatefulWidget {
  const HomeDetailPage({super.key});

  @override
  State<HomeDetailPage> createState() => _HomeDetailPageState();
}

class _HomeDetailPageState extends State<HomeDetailPage> {
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
                      items: state.items.map((e) {
                        return DropdownMenuItem<CategoryModel>(
                          value: e,
                          child: Text(e.name ?? ''),
                        );
                      }).toList(),
                      onChanged: (value) {},
                    ),
                    TextFormField(),
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
