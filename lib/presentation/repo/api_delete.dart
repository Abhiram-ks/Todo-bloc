import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:todo_app/presentation/bloc/home/home_bloc.dart';
import 'package:todo_app/presentation/core/colors/colors.dart';
import 'package:todo_app/presentation/core/widget/snackbar_widget.dart';

Future<void> deleteTodo(BuildContext context, String id) async {
  try {
    final response = await http.delete(
      Uri.parse('https://api.nstack.in/v1/todos/$id'),
      headers: {'accept': 'application/json'},
    );

    if (response.statusCode == 200) {
      log(id.toString());
      // ignore: use_build_context_synchronously
      context.read<HomeBloc>().add(DeleteTodoEvent(id));

      CustomeSnackBar.show(
          // ignore: use_build_context_synchronously
          context: context,
          title: "Deletion Success",
          description: 'Todo deleted successfully',
          backgroundColor: garen,
          icon: Icons.delete_sweep);
    } else {
      log(response.statusCode.toString());
      CustomeSnackBar.show(
          // ignore: use_build_context_synchronously
          context: context,
          title: "Deletion Failure",
          description: "Todo deletion failed",
          backgroundColor: red,
          icon: Icons.delete_sweep);
    }
  } catch (e) {
    log(e.toString());
    CustomeSnackBar.show(
        // ignore: use_build_context_synchronously
        context: context,
        title: "Server Down",
        description: 'Todo deletion failed! Try Again',
        backgroundColor: red,
        icon: Icons.delete_sweep);
  }
}
