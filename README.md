# Flutter Counter App with Bloc Architecture

This Flutter application demonstrates the usage of the Bloc architecture pattern to manage state in a simple counter application.

## What is Bloc Architecture?

Bloc (Business Logic Component) architecture is a design pattern introduced by Google as a way to manage state in Flutter applications. It helps to separate the presentation layer from the business logic and data layer, resulting in a more modular and testable codebase.

In a Bloc architecture, the application's UI components (widgets) interact with Blocs or Cubits to trigger state changes. Blocs handle the business logic and emit new states in response to events received from the UI. Widgets listen to these state changes and update their appearance accordingly.

## Implementation Details

### CounterCubit Implementation

The `CounterCubit` class extends `Cubit<int>`, representing a simple counter state. It emits new states in response to events such as increment and decrement. The `CounterCubit` is provided to the entire application using `BlocProvider` in the `MultiBlocProvider`.

```dart
import 'package:flutter_bloc/flutter_bloc.dart';

// Define a CounterCubit which extends Cubit<int>
// Cubit relies on functions to emit new states
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
```

### CounterBloc Implementation

The `CounterBloc` class extends `Bloc<CounterEvent, int>`, where `CounterEvent` represents the events that can trigger state changes. In this implementation, `CounterIncremented` and `CounterDecremented` events are defined. The `CounterBloc` listens to these events and updates the counter state accordingly.

```dart
import 'package:flutter_bloc/flutter_bloc.dart';

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
```
```dart
//part of permit to "link" file with others as it was one
part of 'counter_bloc.dart';

sealed class CounterEvent {}

final class CounterIncremented extends CounterEvent {}

final class CounterDecremented extends CounterEvent {}

```

### MyApp Configuration

The `MyApp` widget configures the application's entry point. It uses `MultiBlocProvider` to provide both `CounterCubit` and `CounterBloc` instances to the entire application. This setup allows widgets to access and interact with these Blocs without nesting providers.

## How to Use

To run the application, simply clone the repository and open it in your Flutter development environment. Ensure that you have the necessary dependencies installed. Then, run the app on a simulator or physical device.

## Feedback and Contributions

If you have any feedback, suggestions, or contributions to improve this example application, feel free to open an issue or pull request on the GitHub repository. Your contributions are highly appreciated!

Thank you for exploring the Bloc architecture pattern in Flutter! Happy coding!
