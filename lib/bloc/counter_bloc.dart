import 'package:flutter_bloc/flutter_bloc.dart';
//part permit to split the file into multiple files
part 'counter_event.dart';

//Bloc relies on events to emit new states
class CounterBloc extends Bloc<CounterEvent, int> {
  CounterBloc() : super(0) {
    on<CounterIncremented>((event, emit) {
      emit(state + 1);
    });

    on<CounterDecremented>((event, emit) {
      if (state > 0) {
        emit(state - 1);
      }
    });
  }
}
