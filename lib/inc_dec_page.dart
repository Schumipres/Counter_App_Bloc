import 'package:counter_app_bloc/bloc/counter_bloc.dart';
import 'package:counter_app_bloc/components/my_back_button.dart';
import 'package:counter_app_bloc/cubit/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class IncDecPage extends StatelessWidget {
const IncDecPage({ super.key });

  @override
  Widget build(BuildContext context){
    // Access the CounterCubit instance through the BlocProvider
    final counterBloc = BlocProvider.of<CounterBloc>(context);

    return Scaffold(
      body: const Row(children: [
        Padding(
          padding: EdgeInsets.only(top : 50, left: 20),
          child: MyBackButton(),
        )
      ],),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: "inc",
            onPressed: () {
              // Call the increment method when the button is pressed
              counterBloc.add(CounterIncremented());
            },
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
            heroTag: "dec",
            onPressed: () {
              // Call the increment method when the button is pressed
              counterBloc.add(CounterDecremented());
            },
            tooltip: 'Decrement',
            child: const Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}