import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/presentation/bloc/putApi/put_api_bloc.dart';

import '../../home/home_bloc.dart';
import '../../core/colors/colors.dart';
import '../../core/widget/action_buttons.dart';
import '../../core/widget/snackbar_widget.dart';
import '../add/widget/text_fileds.dart';

class Specification extends StatelessWidget {
  final TextEditingController header;
  final TextEditingController description;
  final bool isCompleted;
  final String id;

  const Specification({
    super.key,
    required this.header,
    required this.description,
    required this.isCompleted,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    final putApiBloc = context.read<PutApiBloc>();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: BlocListener<PutApiBloc, PutApiState>(
        listener: (context, state) async {
          if (state is FormSubmissionSuccessPutState) {
            Navigator.pop(context);
            CustomeSnackBar.show(
              context: context,
              title: 'Task Progress Updated',
              description: 'Task was submitted successfully!',
              backgroundColor: garen,
              icon: Icons.check_circle,
            );
            context.read<HomeBloc>().add(FetchTodosEvent());
          } else if (state is FormSubmissionFailurePutState) {
            if (context.mounted) {
              Navigator.pop(context);
              CustomeSnackBar.show(
                context: context,
                title: 'Task Submission Failed',
                description: 'Task submission failed. Please try again.',
                backgroundColor: red,
                icon: Icons.thumb_down,
              );
            }
          }
        },
        child: Container(
          height: 560,
          decoration: const BoxDecoration(
            color: white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Form(
              key: putApiBloc.formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.close_sharp,
                        color: grey,
                      ),
                    ),
                  ),
                  BlocBuilder<PutApiBloc, PutApiState>(
                    builder: (context, state) {
                      final isCheced = state is CheckboxCheckedState;
                      return Column(
                        children: [
                          CustomTextFormFild(
                            description: description,
                            header: header,
                            color: isCheced ? garen : red,
                            icon: isCheced
                                ? Icons.check_circle
                                : Icons.cancel_sharp,
                            title: 'Organize Your Day',
                            comment: isCheced
                                ? 'Plan tasks efficiently to enhance productivity.'
                                : "Mark the day and proced your progress",
                          ),
                          Center(
                            child: CheckboxListTile(
                              title: Text(isCheced
                                  ? 'Task Complited'
                                  : 'Mark as Complited'),
                              value: isCheced,
                              onChanged: (bool? value) {
                                putApiBloc.add(ToggleCheckboxEvent());
                              },
                              controlAffinity: ListTileControlAffinity.leading,
                              checkColor: white,
                              fillColor: WidgetStateProperty.resolveWith<Color>(
                                (states) => isCheced ? garen : white,
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                  ActionButtons(
                    onCancelPressed: () => Navigator.pop(context),
                    onSubmitPressed: () {
                      if (putApiBloc.formKey.currentState!.validate() &&
                          (header.text.isNotEmpty &&
                              description.text.isNotEmpty)) {
                        putApiBloc.add(SubmitFormPutEvent(
                            id: id,
                            header: header.text,
                            description: description.text,
                            isCompleted: isCompleted));
                             putApiBloc.add(ToggleCheckboxEvent());
                      }
                    },
                    cancelText: 'Cancel',
                    submitText: 'Confirm',
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
