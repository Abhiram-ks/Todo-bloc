import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/presentation/repo/api_get.dart';

import '../model/todo_model.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  List<TodoModel> allTodos = []; 

  HomeBloc() : super(BottomSheetVisibleState()){
    on<FetchTodosEvent>(_fetchTodos);
     on<ShowBottomSheetEvent>((event, emit) =>emit(BottomSheetVisibleState()));
     on<HideBottomSheetEvent>((event, emit) =>emit(BottomSheetHiddenState()));
     on<DeleteTodoEvent>(_deleteTod);
     on<SearchTaskEvent>(_searchTasks);
  }

   Future<void> _fetchTodos(
    FetchTodosEvent event, Emitter<HomeState> emit
   ) async{
     try {
       final todos = await GetMethod.fetchTodos();
       allTodos = List.from(todos);
         emit(TodoListLoadedState(List.from(allTodos)));
     } catch (e) {
       log(e.toString());
     }
   }

  void _searchTasks(SearchTaskEvent event, Emitter<HomeState> emit) {
    final currentState = state;

    if (currentState is TodoListLoadedState) {
      if (event.quary.isEmpty) {
         emit(TodoListLoadedState(allTodos));
      } else {
        final filteredTodos = allTodos.where((todo){
          return todo.title.toLowerCase().contains(event.quary.toLowerCase()) || todo.description.toLowerCase().contains(event.quary.toLowerCase());
        }).toList();
        emit(TodoListLoadedState(filteredTodos));
      }
    }
  }



   Future<void> _deleteTod(
    DeleteTodoEvent event, Emitter<HomeState> emit
   )async{
    final currentState = state;
    if (currentState is TodoListLoadedState) {
      final updatedTodos =currentState.todos.where((todo) => todo.id != event.id).toList();
    emit(TodoListLoadedState(updatedTodos));
    }
   }

}


