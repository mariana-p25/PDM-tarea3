import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/front_bloc.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
            //title: Text('Material App Bar'),
            ),
        body: BlocProvider(
          create: (context) => FrontBloc(),
          child: BlocConsumer<FrontBloc, FrontState>(
            listener: (context, state) {
              // TODO: implement listener
            },
            builder: (context, state) {
              if (state is GameStartedState) {
                return Container(
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(state.titulo),
                        SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          state.palabra,
                          style: TextStyle(
                            fontSize: 30,
                          ),
                        ),
                        Text(state.contador.toString()),
                        SizedBox(
                          height: 35.0,
                        ),
                        MaterialButton(
                          color: Colors.green,
                          child: Text("SKIP"),
                          onPressed: () {
                            BlocProvider.of<FrontBloc>(context)
                                .add(SkipEvent());
                          },
                        ),
                        MaterialButton(
                          color: Colors.green,
                          child: Text("GOT IT"),
                          onPressed: () {
                            BlocProvider.of<FrontBloc>(context).add(GotEvent());
                          },
                        ),
                        MaterialButton(
                          color: Colors.green,
                          child: Text("END GAME"),
                          onPressed: () {
                            BlocProvider.of<FrontBloc>(context).add(EndEvent());
                          },
                        ),
                      ],
                    ),
                  ),
                );
              } else if (state is GameEndState) {
                return Container(
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(state.titulo),
                        SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          state.contador.toString(),
                          style: TextStyle(
                            fontSize: 30,
                          ),
                        ),
                        SizedBox(
                          height: 35.0,
                        ),
                        MaterialButton(
                          color: Colors.green,
                          child: Text("PLAY AGAIN!"),
                          onPressed: () {
                            BlocProvider.of<FrontBloc>(context)
                                .add(StartEvent());
                          },
                        ),
                      ],
                    ),
                  ),
                );
              } else
                return Container(
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text("Get ready to"),
                        SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          "Guess the word!",
                          style: TextStyle(
                            fontSize: 30,
                          ),
                        ),
                        SizedBox(
                          height: 35.0,
                        ),
                        MaterialButton(
                          color: Colors.green,
                          child: Text("PLAY"),
                          onPressed: () {
                            BlocProvider.of<FrontBloc>(context)
                                .add(StartEvent());
                          },
                        ),
                      ],
                    ),
                  ),
                );
            },
          ),
        ),
      ),
    );
  }
}
