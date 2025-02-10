part of 'post_api_bloc.dart';


@immutable
sealed class PostApiState {}

final class PostApiInitial extends PostApiState {}

class FormSubmittingState extends PostApiState {}
class FormSubmissionSuccessState extends PostApiState{}
class FormSubmissionFailureState extends PostApiState {
  final String error;

  FormSubmissionFailureState({required this.error});
}
