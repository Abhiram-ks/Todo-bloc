import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/presentation/repo/api_post.dart';

part 'post_api_event.dart';
part 'post_api_state.dart';

class PostApiBloc extends Bloc<PostApiEvent, PostApiState> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  PostApiBloc() : super(PostApiInitial()) {
    on<SubmitFormEvent>(_onSubmitForm);
  }


  Future<void> _onSubmitForm(SubmitFormEvent event, Emitter<PostApiState> emit) async {
  try {
    if(formKey.currentState == null || !formKey.currentState!.validate()){
      return;
    }
    emit(FormSubmittingState());
    log('Submitting form: ${event.header} - ${event.description}');

    bool success = await PostMethod.addPost(
      title: event.header, 
      description: event.description,
    
    );

    if (success) {
      log('Form submitted successfully');
      emit(FormSubmissionSuccessState());
    } else {
      log('Form submission failed');
      emit(FormSubmissionFailureState(error: 'Submission failed'));
    }
  } catch (e) {
    log('Error Post: $e');
    emit(FormSubmissionFailureState(error: e.toString()));
  }
}

}


