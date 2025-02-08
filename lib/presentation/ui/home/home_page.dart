import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/presentation/bloc/home/home_bloc.dart';
import 'package:todo_app/presentation/core/colors/colors.dart';
import 'package:todo_app/presentation/core/constant/constant.dart';
import 'package:todo_app/presentation/ui/add/custom_bottomshet.dart';
import 'package:todo_app/presentation/ui/home/widget/search_bar_widget.dart';
import 'package:todo_app/presentation/ui/home/widget/todo_list_widget.dart';
import '../../core/widget/custom_appbar.dart';

class HomePage extends StatelessWidget {

   HomePage({super.key});
    final TextEditingController headerController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeBloc, HomeState>(
      listener: (context, state) {
        if (state is BottomSheetVisibleState) {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            backgroundColor: white,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            ),
            builder: (context) {
              return CustomeBottmSheet(
                header: headerController,
                description: descriptionController,
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
         body: Padding(
           padding: const EdgeInsets.symmetric(horizontal: 10.0),
           child: Column(
            children: [
              Searchbarmain(hintText: 'Search for your tasks', onSearchPressed:(p0) {
                
              }, controller: TextEditingController()),hight10,
              TodoListWidget(onTap: (){},delete: (){}, title: 'We are going to goa djkhkjhdkj', description: 'Goa is a beautifull place', isCompleted: true)
            ],
           ),
         ),
      )
      );
  }
}