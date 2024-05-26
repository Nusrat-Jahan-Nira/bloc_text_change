import 'package:bloc_text_change/bloc/app_bloc_bloc.dart';
import 'package:bloc_text_change/bloc/app_bloc_event.dart';
import 'package:bloc_text_change/bloc/app_bloc_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (context) => TextBloc(),
        child: TextChangeScreen(),
      ),
    );
  }
}

class TextChangeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final textBloc = BlocProvider.of<TextBloc>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Flutter Bloc Example')),
      body: Center(
        child: BlocBuilder<TextBloc, TextState>(
          builder: (context, state) {
            String displayText = (state as TextInitial).text;
            Color displayColor = (state).color;
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(displayText,
                    style: TextStyle(
                        color: displayColor,
                        fontSize: 24
                    )),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    textBloc.add(ChangeTextEvent());
                  },
                  child: const Text('Change Text'),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
