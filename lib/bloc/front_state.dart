part of 'front_bloc.dart';

@immutable
abstract class FrontState extends Equatable {}

class FrontInitial extends FrontState {
  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}

class GameStartedState extends FrontState {
  final String palabra;
  final String titulo;
  final int contador;

  GameStartedState(
      {@required this.palabra, @required this.titulo, @required this.contador});

  @override
  //TODO: implement props
  List<Object> get props => [palabra, titulo, contador];
}

class GameEndState extends FrontState {
  final String titulo;
  final int contador;

  GameEndState({@required this.titulo, @required this.contador});

  @override
  //TODO: implement props
  List<Object> get props => [titulo, contador];
}

class GameNextState extends FrontState {
  final String palabra;
  final String titulo;
  final int contador;

  GameNextState(
      {@required this.palabra, @required this.titulo, @required this.contador});

  @override
  //TODO: implement props
  List<Object> get props => [palabra, titulo, contador];
}
