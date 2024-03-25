import 'package:counter_app_bloc/bloc/counter_bloc.dart';
import 'package:counter_app_bloc/cubit/counter_cubit.dart';
import 'package:counter_app_bloc/home_page.dart';
import 'package:counter_app_bloc/inc_dec_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Provide the CounterCubit to the entire application
    // Thanks to the MultiBlocProvider, we can provide multiple Cubits/Blocs without nesting
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => CounterCubit(),
        ),
        BlocProvider(
          create: (context) => CounterBloc(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        debugShowCheckedModeBanner: false,
        home: const MyHomePage(title: 'Flutter Demo Home Page'),
        routes: {
          '/home': (context) =>
              const MyHomePage(title: 'Flutter Demo Home Page'),
          '/inc_dec': (context) => const IncDecPage(),
        },
      ),
    );
  }
}
