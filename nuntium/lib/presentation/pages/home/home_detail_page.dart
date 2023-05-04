import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grock/grock.dart';
import 'package:nuntium/bloc/home/home_detail_state.dart';

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
      body: BlocBuilder<HomeDetailCubit, HomeDetailState>(
        builder: (context, state) {
          if (state is HomeDetailInProgress) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is HomeDetailSuccess) {
            final values = state.items.docs.map((e) => e.data()).toList();
            return Padding(
              padding: 20.allP,
              child: ListView.builder(
                itemCount:values.length ,

                itemBuilder: (context, index) {
                return Text(values[index].name??'');
              },)
            );
          } else {
            return const Center(child: Text("There is a Error"));
          }
        },
      ),
    );
  }
}
