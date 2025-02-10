import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/presentation/repo/api_put.dart';

part 'put_api_event.dart';
part 'put_api_state.dart';

class PutApiBloc extends Bloc<PutApiEvent, PutApiState> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  PutApiBloc({required bool isCompleted})
      : super(isCompleted ? CheckboxCheckedState() : CheckboxUncheckedState()) {
      on<ToggleCheckboxEvent>(_onToggleCheckbox);
      on<SubmitFormPutEvent>(_onSubmitPutForm);
     }

  void _onToggleCheckbox(
      ToggleCheckboxEvent event, Emitter<PutApiState> emit) {
    if (state is CheckboxCheckedState) {
      emit(CheckboxUncheckedState());
    } else {
      emit(CheckboxCheckedState());
    }
  }

  Future<void> _onSubmitPutForm(SubmitFormPutEvent event,Emitter<PutApiState> emit) async {
    try {
      if (formKey.currentState == null || !formKey.currentState!.validate()) {
        return;
      }

      bool wasChecked = state is CheckboxCheckedState;
      emit(FormSubmittingPutState());
      log('Submitting form: put ${event.header} - ${event.description} - ${event.isCompleted}');

      bool successPut = await PutMethod.updateTodo(
        id: event.id, 
        title: event.header, 
        description: event.description, 
        isCompleted: event.isCompleted);

        if (successPut) {
          log('Form updating SUccessfully');
          emit(FormSubmissionSuccessPutState());
        } else {
           log('Form Updating failed');
            emit(FormSubmissionFailurePutState(error: 'Updation failed'));
            emit(wasChecked ? CheckboxCheckedState() : CheckboxUncheckedState());
        }
    } catch (e) {
      log('Error put: $e');
      emit(FormSubmissionFailurePutState(error: e.toString()));
       emit(state is CheckboxCheckedState ? CheckboxCheckedState() : CheckboxUncheckedState());
    }
  }
}