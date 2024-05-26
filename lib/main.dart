import 'package:bloc_text_change/bloc/app_bloc_bloc.dart';
import 'package:bloc_text_change/bloc/app_bloc_event.dart';
import 'package:bloc_text_change/bloc/app_bloc_state.dart';
import 'package:bloc_text_change/bloc/dropdown_bloc.dart';
import 'package:bloc_text_change/bloc/dropdown_event.dart';
import 'package:bloc_text_change/bloc/dropdown_state.dart';
import 'package:bloc_text_change/bloc/option_string.dart';
import 'package:bloc_text_change/bloc/text_input_bloc.dart';
import 'package:bloc_text_change/bloc/text_input_event.dart';
import 'package:bloc_text_change/bloc/textinput_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => DropdownBloc()),
          BlocProvider(create: (context) => TextBloc()),
          BlocProvider(create: (context) => TextInputBloc()),
        ],
        child: const TextChangeScreen(),
      ),
    );
  }
}

class TextChangeScreen extends StatelessWidget {
  const TextChangeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textInputBloc = BlocProvider.of<TextInputBloc>(context);
    final textBloc = BlocProvider.of<TextBloc>(context);
    final dropdownBloc = BlocProvider.of<DropdownBloc>(context);


    return Scaffold(
      appBar: AppBar(title: const Text('Flutter Bloc Example')),
      body: Center(
        child:
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
        Padding(
        padding: const EdgeInsets.all(16.0),
        child: BlocBuilder<TextInputBloc, TextInputState>(
          builder: (context, state) {
            String text = '';
            if (state is TextInputInitial) {
              text = state.text;
            }

            return TextField(
              onChanged: (newText) {
                textInputBloc.add(TextChanged(newText));
              },
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter text',
              ),
              controller: TextEditingController.fromValue(
                TextEditingValue(
                  text: text,
                  selection: TextSelection.fromPosition(
                    TextPosition(offset: text.length),
                  ),
                ),
              ),
            );
          },
        ),
      ),
            // DropdownBloc
            BlocBuilder<DropdownBloc, DropdownState>(
              builder: (context, state) {
                String selectedValue = 'Select an option';
                if (state is DropdownInitial) {
                  selectedValue = state.selectedValue;
                }

                return DropdownButton<String>(
                  value: selectedValue == 'Select an option' ? null : selectedValue,
                  hint: const Text('Select an option'),
                  items: options.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (newValue) {
                    if (newValue != null) {
                      dropdownBloc.add(DropdownValueChanged(newValue));
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Selected $newValue')));
                    }
                  },
                );
              },
            ),
            const SizedBox(height: 20),

            // TextBloc
            BlocConsumer<TextBloc, TextState>(
              listener: (context, state) {
                if (state is SnackBarShown) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Text Clicked!')),
                  );
                }
              },
              builder: (context, state) {
                String displayText = 'Text';
                Color displayColor = Colors.orange;
               if (state is TextInitial) {
                 displayText = state.text;
                 displayColor = state.color;
               }
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: (){
                        textBloc.add(ShowSnackBarEvent());
                      },
                      child: const Text('Click for SnackBar',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 24
                          )),
                    ),
                    const SizedBox(height: 5),
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
          ],
        ),
      ),
    );
  }
}
