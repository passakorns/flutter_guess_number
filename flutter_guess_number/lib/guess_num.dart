import 'dart:math';

import 'package:flutter/material.dart';

class GuessNum extends StatefulWidget {
  const GuessNum({super.key});

  @override
  State<GuessNum> createState() => _GuessNumState();
}

class _GuessNumState extends State<GuessNum> {
  final _ctrlNumber = TextEditingController();
  

  var rnd = Random();
  int _guessNum = 0;
  int _randNum = 0;
  String _str = 'เดาตัวเลข 1 - 9';

  Widget textFieldNumber() => TextField(
        controller: _ctrlNumber,
        decoration: InputDecoration(border: outlineBorder(), hintText: 'ตัวเลข'),
        style: textStyle(),
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        //onChanged: (text) => updateText(),
      );
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

  void start() => setState(() {
    _ctrlNumber.text = '';
    _str = 'เดาตัวเลข 1 - 9';
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('G U E S S (1 - 9)'),
        backgroundColor: const Color.fromARGB(255, 133, 191, 238),),
      body: Center(
          child: Column(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(height: 90,),
                  textFieldNumber(),
                  const SizedBox(height: 10,),
                  Text(_str, style: textStyle(),),
                  const SizedBox(height: 10,),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                ElevatedButton(
                  style:ElevatedButton.styleFrom(
                    backgroundColor:Colors.blue,
                    foregroundColor: Colors.white, 
                  ),
                  onPressed: () => guess(), 
                  child: const Text('ส่งคำตอบ')),
                  const SizedBox(width: 15),
                ElevatedButton(
                  style:ElevatedButton.styleFrom(
                    backgroundColor:Colors.red,
                    foregroundColor: Colors.white, 
                  ),
                  onPressed: () => start(),
                  child: const Text('เริ่มใหม่')),
              ],)
            ],
          )
    ));
  }
}