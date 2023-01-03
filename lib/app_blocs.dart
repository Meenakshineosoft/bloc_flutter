import 'package:flutter_bloc/flutter_bloc.dart';

import 'app_states.dart';
//Blocs are creating using the combination of events and states. Earlier we created CounterEvents and CounterStates class.
class CounterBlocs extends Bloc<CounterEvents, CounterStates>{
  CounterBlocs():super(InitialState()){
    on<Increment>((event, emit){
      emit(CounterStates(counter: state.counter+1));
    });

    on<Decrement>((event, emit){
      emit(CounterStates(counter:state.counter-1));
    });
  }
}