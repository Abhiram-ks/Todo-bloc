import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/presentation/bloc/home/home_bloc.dart';
import 'package:todo_app/presentation/ui/add/widget/custom_bottomshet.dart';

import '../../core/widget/custom_appbar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeBloc, HomeState>(
      listener: (context, state) {
        if (state is BottomSheetVisibleState) {
          showModalBottomSheet(
            context: context,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            ),
            builder: (context) {
              return CustomeBottmSheet(
                  onConfirm: () {},
                icon: Icons.check_circle,
                color: Colors.green,
                title: 'Confirmation',
                description: 'Are you sure you want to proceed?',
                );
            },
            ).whenComplete((){
              // ignore: use_build_context_synchronously
              context.read<HomeBloc>().add(HideBottomSheetEvent());
            },);
        }
      },child: Scaffold(
         appBar: CustomAppbar(title: 'To-Do All Lists'),
         floatingActionButton: FloatingActionButton(onPressed: (){
          context.read<HomeBloc>().add(ShowBottomSheetEvent());
         },
           backgroundColor: Colors.black,
          child: const Icon(
            Icons.assignment_add,
            color: Colors.white,
          ),
         ),
         floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      )
      );
  }
}