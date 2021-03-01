import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/front_bloc.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
      ),
      home: Scaffold(
        appBar: AppBar(
            title: Text('Guess the word',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
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
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(state.titulo),
                            SizedBox(
                              height: 20.0,
                            ),
                            Text(
                              state.palabra,
                              style: TextStyle(
                                fontSize: 30,
                              ),
                            ),
                            Text(state.contador.toString()),
                          ],
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            MaterialButton(
                              color: Colors.white,
                              child: Text("SKIP"),
                              onPressed: () {
                                BlocProvider.of<FrontBloc>(context)
                                    .add(SkipEvent());
                              },
                            ),
                            MaterialButton(
                              color: Colors.lightGreen,
                              child: Text("GOT IT",
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              onPressed: () {
                                BlocProvider.of<FrontBloc>(context)
                                    .add(GotEvent());
                              },
                            ),
                            MaterialButton(
                              color: Colors.white,
                              child: Text("END GAME"),
                              onPressed: () {
                                BlocProvider.of<FrontBloc>(context)
                                    .add(EndEvent());
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              } else if (state is GameEndState) {
                return Container(
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(state.titulo),
                            SizedBox(
                              height: 20.0,
                            ),
                            Text(
                              state.contador.toString(),
                              style: TextStyle(
                                fontSize: 30,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: MaterialButton(
                          color: Colors.lightGreen,
                          child: Text("PLAY AGAIN!",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          onPressed: () {
                            BlocProvider.of<FrontBloc>(context)
                                .add(StartEvent());
                          },
                        ),
                      ),
                    ],
                  ),
                );
              } else
              return Container(
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Get ready to"),
                          SizedBox(height: 20.0),
                          Text(
                            "Guess the word!",
                            style: TextStyle(fontSize: 30),
                          ),
                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: MaterialButton(
                        child: Text(
                          "PLAY",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        color: Colors.lightGreen,
                        onPressed: () {
                          BlocProvider.of<FrontBloc>(context)
                              .add(StartEvent());
                        },
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
