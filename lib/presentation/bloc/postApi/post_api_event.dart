part of 'post_api_bloc.dart';

@immutable
sealed class PostApiEvent {}

class SubmitFormEvent extends PostApiEvent{
  final String header;
  final String description;

  SubmitFormEvent({required this.header, required this.description});
  
}

