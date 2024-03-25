import 'package:flutter_bloc/flutter_bloc.dart';

// Define a CounterCubit which extends Cubit<int>
class CounterCubit extends Cubit<int> {
  // The initial state of the CounterCubit is 0.
  CounterCubit() : super(0);

  // Define a `increment` method that will emit the next state
  // emit will notify all listeners of the new state
  void increment() => emit(state + 1);

  // Define a `decrement` method that will emit the next state
  void decrement() {
    if (state > 0) {
      emit(state - 1);
    }
  }
}