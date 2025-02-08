import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:todo_app/presentation/repo/api_post.dart';

part 'post_api_event.dart';
part 'post_api_state.dart';

class PostApiBloc extends Bloc<PostApiEvent, PostApiState> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  PostApiBloc() : super(PostApiInitial()) {
    on<SubmitFormEvent>(_onSubmitForm);
  }


  Future<void> _onSubmitForm(
    SubmitFormEvent event, Emitter<PostApiState> emit
  ) async{
     if (!formKey.currentState!.validate()) {
    return;
   }
    try {
      emit(FormSubmittingState());
      
      bool success = await PostMethod.addPost(title: event.header, description: event.description);
      if (success) {
        log('${event.header} & ${event.description}');
        emit(FormSubmissionSuccessState());
      } else {
        emit(FormSubmissionFailureState(error: 'Submission failed'));
      }
    } catch (e) {
       emit(FormSubmissionFailureState(error: e.toString()));
    }
  }
}


