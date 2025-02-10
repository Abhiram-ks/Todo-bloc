part of 'put_api_bloc.dart';

@immutable
sealed class PutApiEvent {}

class ToggleCheckboxEvent extends PutApiEvent{}

class SubmitFormPutEvent extends PutApiEvent{
  final String id;
  final String header;
  final String description;
  final bool isCompleted;

  SubmitFormPutEvent({required this.id,required this.header, required this.description, required this.isCompleted});
}
