import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'front_event.dart';
part 'front_state.dart';

class FrontBloc extends Bloc<FrontEvent, FrontState> {
  FrontBloc() : super(FrontInitial());
  List<String> list1 = ["Guitarra", "Teclado", "Batería", "Bajo", "Piano", "Micrófono", "Flauta", "Violín", "Arpa", "Acordeón"];
  List<String> list2 = ["Guitarra", "Teclado", "Batería", "Bajo", "Piano", "Micrófono", "Flauta", "Violín", "Arpa", "Acordeón"];
  int listSize;
  int count = 0;
  int i = 0;
  @override
  Stream<FrontState> mapEventToState(
    FrontEvent event,
  ) async* {
    print(list2);
    if (event is StartEvent) {
      list2.shuffle();
      listSize = list1.length;
      count = 0;
      i = 0;
      yield GameStartedState(
          contador: count, palabra: list1[i], titulo: "The word is...");
    } else if (event is SkipEvent) {
      if (list1[i] != list2[i]) count++;
      i++;
      if (i < listSize)
        yield GameStartedState(
            contador: count, palabra: list1[i], titulo: "The word is...");
      else
        yield GameEndState(contador: count, titulo: "You scored ");
    } else if (event is GotEvent) {
      if (list1[i] == list2[i]) count++;
      i++;
      if (i < listSize)
        yield GameStartedState(
            contador: count, palabra: list1[i], titulo: "The word is...");
      else
        yield GameEndState(contador: count, titulo: "You scored ");
    } else if (event is EndEvent) {
      yield GameEndState(contador: count, titulo: "You scored ");
    }
  }
}
