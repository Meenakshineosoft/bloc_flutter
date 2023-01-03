//States are caused by events. In general you want to cleare your states as classes. Different states you have to delcare different classes.
class CounterStates{
  int counter;
  CounterStates({required this.counter});
}

class InitialState extends CounterStates{
  InitialState():super(counter:0);
}

//Events are caused by users interactions like a button click. Events are also declared as classes.
abstract class CounterEvents{}
class Increment extends CounterEvents{}
class Decrement extends CounterEvents{}

