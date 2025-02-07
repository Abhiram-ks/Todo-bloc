import 'package:flutter/material.dart';
import 'package:todo_app/presentation/core/widget/custom_appbar.dart';

class AddTodo extends StatelessWidget {
  const AddTodo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(title: 'Add Todo'),
    );
  }
}