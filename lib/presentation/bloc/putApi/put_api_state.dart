part of 'put_api_bloc.dart';

@immutable
sealed class PutApiState {}
class FormSubmittingPutState extends PutApiState {}
final class PutApiInitial extends PutApiState {}
class CheckboxCheckedState extends PutApiState {}
class CheckboxUncheckedState extends PutApiState {}
class FormSubmissionSuccessPutState extends PutApiState{}
class FormSubmissionFailurePutState extends PutApiState {
  final String error;

  FormSubmissionFailurePutState({required this.error});
}

