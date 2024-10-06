import 'package:flutter/material.dart';
import 'package:hello_world_app/presentation/screens/counter/counter_functions_screen.dart';
// import 'package:hello_world_app/presentation/screens/counter/counter_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  
  const MyApp({super.key}); // buena practica

  
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false, // para quitar etiqueta de debugging
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.purple //
      ),
      home: const CounterFunctionsScreen()
    );
  }
}
