import 'package:flutter/material.dart';
import 'package:vibration/vibration.dart';

class CounterFunctionsScreen extends StatefulWidget {
  const CounterFunctionsScreen({super.key});

  @override
  State<CounterFunctionsScreen> createState() => _CounterFunctionsScreenState();
}

class _CounterFunctionsScreenState extends State<CounterFunctionsScreen> {
  int clickCounter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            centerTitle: true,
            title: const Text('Counter Functions'),
            actions: [
              IconButton(
                icon: const Icon(Icons.refresh_rounded), // PARA REFRESCAR LA
                onPressed: () {
                  setState(() {
                    clickCounter = 0;
                  });
                },
              ),
            ]),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '$clickCounter',
                style:
                    const TextStyle(fontSize: 160, fontWeight: FontWeight.w100),
              ),
              Text('Click${clickCounter == 1 ? '' : 's'}',
                  style: const TextStyle(
                      fontSize: 25, fontWeight: FontWeight.bold))
              // (clickCounter != 1  ? const Text('Clicks', style: TextStyle( fontSize: 25)) : const Text('Click', style: TextStyle( fontSize: 25)))
            ],
          ),
        ),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            CustomButton(
              icon: Icons.refresh_outlined,
              vibrationDuration: 300,
              onPressed: () {
                setState(() {
                  clickCounter = 0;
                });
              },
            ),
            const SizedBox(height: 15),
            CustomButton(
              icon: Icons.plus_one,
              vibrationDuration: 70,
              onPressed: () {
                setState(() {
                  clickCounter++;
                });
              },
            ),
            const SizedBox(height: 15),
            CustomButton(
              icon: Icons.exposure_minus_1_outlined,
              vibrationDuration: 70,
              onPressed: () {
                if (clickCounter == 0) return;
                setState(() {
                  clickCounter--;
                });
              },
            ),
          ],
        ));
  }
}

class CustomButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onPressed;
  final int vibrationDuration;

  const CustomButton({
    super.key,
    required this.icon,
    this.onPressed, required this.vibrationDuration,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      enableFeedback: true,
      backgroundColor: const Color.fromARGB(255, 175, 255, 234),
      elevation: 10.0,
      shape: const StadiumBorder(),
      onPressed: () async {
       Vibration.hasVibrator().then((hasVibrator) {
          if (hasVibrator ?? false) {
            Vibration.vibrate(duration: vibrationDuration);
          }
        });

        // Llama al callback de `onPressed`, si está definido
        if (onPressed != null) {
          onPressed!();
        }
      },
      child: Icon(icon),
    );
  }
}
