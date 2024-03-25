import 'package:counter_app_bloc/bloc/counter_bloc.dart';
import 'package:counter_app_bloc/cubit/counter_cubit.dart';
import 'package:counter_app_bloc/inc_dec_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    // Access the CounterCubit instance through the BlocProvider
    final counterBloc = BlocProvider.of<CounterBloc>(context);

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(title),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'You have pushed the button this many times:',
              ),
              // Use BlocBuilder to listen for state changes in the CounterCubit
              // and build the UI based on the current state
              BlocBuilder<CounterBloc, int>(
                  // Pass in the instance of the CounterCubit, it's optional to pass it in
                  // because the BlocBuilder will automatically find the instance of the CounterCubit, because it is provided above in the widget tree
                  bloc: counterBloc,
                  // The builder function has access to the current state
                  builder: (context, counter) {
                    return Text(
                      '$counter',
                      style: Theme.of(context).textTheme.headlineMedium,
                    );
                  }),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          heroTag: 'goto_inc_dec',
          onPressed: () {
            Navigator.pushNamed(context, '/inc_dec');
          },
          tooltip: 'Increment',
          child: const Icon(Icons.navigate_next),
        ));
  }
}
