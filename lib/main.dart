import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<String> generateUniqueRandomNumbers() {
    Random random = Random();
    List<int> numbers = [];
    List<String> numStr = [];
    List<String> numStrs = [];
    String numberToStr = '';
    int num = 0;
    for (int i = 0; i < 3; i++) {
      numStr = [];
      numbers = [];
      while (numbers.length < 7) {
        num = random.nextInt(37) + 1;
        if (!numbers.contains(num)) {
          numbers.add(num);
        }
      }
      numbers.sort();
      for (var num in numbers) {
        numberToStr = num.toString();
        if (numStr.length != 6) {
          numStr.add('$numberToStr,');
        } else {
          numStr.add(numberToStr);
        }
      }
      numStrs.add(numStr.join(' '));
    }
    return numStrs;
  }

  @override
  Widget build(BuildContext context) {
    List<String> numString = generateUniqueRandomNumbers();
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.cyan,
          title: const Text('LOTO7'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        //for (int i = 0; i < numString.length; i++) ...{
                        for (var num in numString) ...{
                          Text(
                            num,
                            style: const TextStyle(
                              fontSize: 20,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          )
                        }
                      ],
                    )
                  ],
                )
              ])
            ],
          ),
        ),
      ),
    );
  }
}
