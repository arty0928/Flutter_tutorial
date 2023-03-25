import 'package:flutter/material.dart';
import 'package:toonfix/widgets/button.dart';

class Player {
  String? name;

  Player();
}

void main() {
  var nico = Player();

  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color(0xFF181818),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Text(
                      'Hey selena',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                          fontWeight: FontWeight.w800),
                    ),
                    Text(
                      'Welcome back',
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.8),
                        fontSize: 14,
                      ),
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 60,
            ),
            Text(
              'Total Balance',
              style: TextStyle(
                fontSize: 22,
                color: Colors.white.withOpacity(0.8),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            const Text(
              '\$5 194 482',
              style: TextStyle(
                fontSize: 44,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Button(
                    text: 'Transfer',
                    bgColor: Colors.amber,
                    textColor: Colors.black),
                Button(
                    text: 'Request',
                    bgColor: Colors.black,
                    textColor: Colors.white),
              ],
            )
          ]),
        ),
      ),
    );
  }
}
