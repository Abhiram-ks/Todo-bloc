import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/presentation/home/home_bloc.dart';
import 'package:todo_app/presentation/bloc/putApi/put_api_bloc.dart';
import 'package:todo_app/presentation/ui/home/widget/detailwidget.dart';
import 'package:todo_app/presentation/ui/spec/specification.dart';
import '../../../core/colors/colors.dart';

class TodoListWidget extends StatelessWidget {
  final String title;
  final String id;
  final String description;
  final VoidCallback? delete;
  final bool isCompleted;

  const TodoListWidget({
    super.key,
    required this.title,
    required this.description,
    required this.isCompleted,
    required this.id,
    required this.delete,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    final TextEditingController headerController =
        TextEditingController(text: title);
    final TextEditingController descriptionController =
        TextEditingController(text: description);

    return Card(
      elevation: 6,
      shadowColor: black,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Stack(
          children: [
            Detailwidgets(
                screenHeight: screenHeight,
                screenWidth: screenWidth,
                id: id,
                title: title,
                description: description,
                delete: delete),
            Positioned(
              bottom: 0,
              left: 0,
              child: IconButton(
                icon: Icon(
                  isCompleted
                      ? Icons.check_box
                      : Icons.check_box_outline_blank_outlined,
                  size: 24,
                ),
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    backgroundColor: Colors.white,
                    shape: const RoundedRectangleBorder(
                      borderRadius:
                      BorderRadius.vertical(top: Radius.circular(20)),
                    ),
                    builder: (context) {
                      return BlocProvider(
                        create: (context) => PutApiBloc(isCompleted: isCompleted),
                        child: Specification(
                          id: id,
                          header: headerController,
                          description: descriptionController,
                          isCompleted: isCompleted,
                        ),
                      );
                    },
                  ).whenComplete(() {
                    context.read<HomeBloc>().add(HideBottomSheetEvent());
                  });
                },
                color: isCompleted ? blue : black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
