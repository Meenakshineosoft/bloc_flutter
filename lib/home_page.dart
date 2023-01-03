import 'package:bloc_flutter/second_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app_blocs.dart';
import 'app_states.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  /*  BlocBuilder is used for finding events and states of the app. If you wrap your widget inside BlocBuilder, you would be able to find them.

    If you can find them, you can trigger events and change the states of the app, variables and things like that.

        Most importantly, you may add new events which will trigger change of the states. */
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<CounterBlocs, CounterStates>(
          builder: (context, state){
            return  Column(
              //crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  state.counter.toString(), style: const TextStyle(
                    fontSize: 30
                ),
                )    ,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                        onPressed:
                            ()=>BlocProvider.of<CounterBlocs>(context).add(Increment()),
                        child: const Icon(Icons.add)
                    ),

                    const SizedBox(width: 10,),

                    ElevatedButton(
                        onPressed:
                            ()=>BlocProvider.of<CounterBlocs>(context).add(Decrement()),
                        child: const Icon(Icons.remove)
                    )
                  ],
                ),
                const SizedBox(height: 10,),
                InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(
                            builder: (context) => const SecondPage()));
                  },
                  child: Container(
                    width: 138,
                    height: 35,

                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.grey,
                    ),
                    child: const Center(child: Text("click", style: TextStyle(color: Colors.white),)),
                  ),

                )
              ],
            );

          }
      ),
    );
  }}
