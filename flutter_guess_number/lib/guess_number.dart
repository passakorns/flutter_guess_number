import 'dart:math';

import 'package:flutter/material.dart';

class GuessNumber extends StatefulWidget {
  const GuessNumber({super.key});

  @override
  State<GuessNumber> createState() => _GuessNumberState();
}

class _GuessNumberState extends State<GuessNumber> {
  final _ctrlNumber = TextEditingController();

  int _guessNum = 0, _randNum = 0;
  String _str = 'เดาตัวเลข';
  var rnd = Random();

  TextStyle textStyle() => const TextStyle(
        color: Colors.indigo,
        fontSize: 20,
        fontWeight: FontWeight.normal,
      );

  OutlineInputBorder outlineBorder() => const OutlineInputBorder(
      borderSide: BorderSide(color: Colors.grey, width: 2));

  void guess() => setState(() {
        _guessNum = int.parse(_ctrlNumber.value.text);
        _randNum = rnd.nextInt(10) + 1;
        if (_guessNum == _randNum) {
          _str = 'สุดยอด';
        } else {
          _str = 'ผิด คำตอบที่ถูกคือ $_randNum';
        }
      });
  void start() => setState(() {});

  Widget textFieldNumber() => TextField(
        controller: _ctrlNumber,
        decoration: InputDecoration(border: outlineBorder(), hintText: 'Name'),
        style: textStyle(),
        keyboardType: TextInputType.number,
        //onChanged: (text) => updateText(),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Guess Number')),
        body:  Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  textFieldNumber(),
                  const SizedBox(
                    height: 30,
                  ),
                  Text(_str),
                ],
              ),
              Row(
                children: [
                  ElevatedButton(
                      onPressed: () => guess(), child: const Text('ส่งคำตอบ')),
                  const SizedBox(width: 15),
                  ElevatedButton(
                      onPressed: () => start(), child: const Text('เริ่มใหม่')),
                ],
              )
            ],
          ),
        ));
  }
}
