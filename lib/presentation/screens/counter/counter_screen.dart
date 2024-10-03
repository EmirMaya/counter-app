import 'package:flutter/material.dart';


class CounterScreen extends StatefulWidget {
  
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  int clickCounter = 0;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Counter App'),
      ),
      body:  Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text('$clickCounter', style: const TextStyle( fontSize: 160, fontWeight: FontWeight.w100 ),),
          Text('Click${ clickCounter == 1 ? '' : 's' }', style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold))
          // (clickCounter != 1  ? const Text('Clicks', style: TextStyle( fontSize: 25)) : const Text('Click', style: TextStyle( fontSize: 25))) 
           ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() { // set state es para que renderice en la pantalla los nuevos valores
            clickCounter++;
          });
        },
        child: const Icon(Icons.plus_one),
      ),
    );
  }
}
