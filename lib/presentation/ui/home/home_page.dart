import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:todo_app/presentation/bloc/home/home_bloc.dart';
import 'package:todo_app/presentation/repo/api_delete.dart';
import 'package:todo_app/presentation/ui/add/custom_bottomshet.dart';
import 'package:todo_app/presentation/ui/home/widget/todo_list_widget.dart';
import '../../core/colors/colors.dart';
import '../../core/widget/custom_appbar.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final TextEditingController headerController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(title: 'To-Do All Lists'),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          context.read<HomeBloc>().add(ShowBottomSheetEvent());
        },
        backgroundColor: black,
        child: const Icon(
          Icons.assignment_add,
          color: white,
        ),
        ),floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
     body: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        children: [
            Expanded(
              child: MultiBlocListener(
                listeners: [
                  BlocListener(
                    bloc: context.read<HomeBloc>(),
                    listenWhen: (previous, current) =>  current is BottomSheetVisibleState,
                    listener: (context, state) {
                       if (state is BottomSheetVisibleState) {
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              backgroundColor: Colors.white,
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
            });
                    }
                    }
                  )
                ],  child: BlocBuilder<HomeBloc, HomeState>(
      buildWhen: (previous, current) => current is TodoListLoadedState,
     builder: (context, state) {
  if (state is TodoListLoadedState) {
    return RefreshIndicator(
      onRefresh: () async {
        context.read<HomeBloc>().add(FetchTodosEvent()); 
      },
      child: state.todos.isEmpty
          ? SingleChildScrollView( 
              physics: AlwaysScrollableScrollPhysics(),
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.6,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'No tasks available',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
                    ),
                    const Text(
                      'Try Again!',
                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
            )
          : ListView.separated(
              itemCount: state.todos.length,
              itemBuilder: (context, index) {
                final todo = state.todos[index];
                return TodoListWidget(
                  onTap: () {},
                  title: todo.title,
                  id: todo.id,
                  description: todo.description,
                  isCompleted: todo.isCompleted,
                  delete: () {
                    deleteTodo(context, todo.id);
                  }
                );
              },
              separatorBuilder: (context, index) => const SizedBox(height: 10),
            ),
    );
  } else {
    return Center(
      child: Lottie.asset(
        'assets/loadingAnimation.json',
        width: MediaQuery.of(context).size.width * 0.6,
        height: MediaQuery.of(context).size.height * 0.3,
      ),
    );
  }
},

  ),
)
            )
        ]
      ),
      ),
    
    );
  }
}




// BlocConsumer(
//                 bloc: context.read<HomeBloc>(),
//                 listenWhen: (previous, current) => current is BottomSheetVisibleState,
//                 buildWhen: (previous, current) => current is! BottomSheetVisibleState,
//                 listener: (context, state) {
//                   if (state is BottomSheetVisibleState ) {
//                     showModalBottomSheet(
//                        context: context,
//                       isScrollControlled: true,
//                       backgroundColor: Colors.white,
//                       shape: const RoundedRectangleBorder(
//                         borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
//                       ),
//                       builder: (context) {
//                         return CustomeBottmSheet(
//                           header: headerController,
//                           description: descriptionController,
//                         );
//                       },
//                     ).whenComplete(() {
//                       // ignore: use_build_context_synchronously
//                       context.read<HomeBloc>().add(HideBottomSheetEvent());
//                       context.read<HomeBloc>().add(FetchTodosEvent());
//                     });
//                   }
//                 },
//                 builder: (context, state) {
//                   if (state is TodoListLoadedState) {
//                     return ListView.separated(
//                        itemCount: state.todos.length,
//                       itemBuilder: (context, index) {
//                         final todo = state.todos[index];
//                         return TodoListWidget(onTap: (){}, title: todo.title, description: todo.description, isCompleted: todo.isCompleted, delete: (){});
//                       }, separatorBuilder: (context, index) =>  const SizedBox(height: 10),);
//                   }else{
//                       return Center(
//                       child: Lottie.asset(
//                         'assets/loadingAnimation.json',
//                         width: MediaQuery.of(context).size.width * 0.6,
//                         height: MediaQuery.of(context).size.height * 0.3,
//                       ),
//                     );
//                   }
//                 },)