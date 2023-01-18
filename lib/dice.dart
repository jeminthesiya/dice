import 'dart:math';

import 'package:flutter/material.dart';

class dice extends StatefulWidget {
  const dice({Key? key}) : super(key: key);

  @override
  State<dice> createState() => _diceState();
}

class _diceState extends State<dice> {
  List l1 = [
    "asset/image/1.png",
    "asset/image/2.png",
    "asset/image/3.png",
    "asset/image/4.png",
    "asset/image/5.png",
    "asset/image/6.png",
  ];
  List l2 = [];
  List l3 = [];
  int i = 0, n = 0, y = 0, z = 0, b = 0;
  TextEditingController txtno = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
            leading: Icon(Icons.arrow_back, color: Colors.black),
            actions: [
              Icon(Icons.search, color: Colors.black),
            ],
            title: Text("Dice play",
                style: TextStyle(
                    fontSize: 25,
                    color: Colors.black,
                    fontWeight: FontWeight.bold)),
            centerTitle: true,
            backgroundColor: Colors.orange.shade400),
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              TextField(
                controller: txtno,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.orange, width: 2)),
                    label: Text(
                      "ENTER THE NO.",
                      style: TextStyle(color: Colors.orange),
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.orange)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.orange))),
                style: TextStyle(color: Colors.orange),
              ),
              InkWell(
                onTap: () {
                  String a = txtno.text;
                  n = int.parse(a);
                  l3.clear();
                  l2.clear();
                  setState(() {
                    l2.length = n;
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Container(
                    width: 125,
                    height: 50,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Colors.orange.shade200,
                        borderRadius: BorderRadius.circular(25),
                        border: Border.all(
                            color: Colors.orange.shade700, width: 2)),
                    child: Text("Creat",
                        style: TextStyle(
                            color: Colors.orange.shade900, fontSize: 25)),
                  ),
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: l2
                      .asMap()
                      .entries
                      .map((e) => Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset(
                              l1[l3.isEmpty ? 0 : l3[e.key]],
                              height: 100,
                              width: 100,
                            ),
                          ))
                      .toList(),
                ),
              ),
              InkWell(
                onTap: () {
                  l3.clear();
                  setState(() {
                    var rnd = Random();
                    b = l2.length;
                    for (y = 0; y < n; y++) {
                      z = rnd.nextInt(6);
                      b = b + z;
                      l3.add(z);
                      print(b);
                    }
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Container(
                    width: 125,
                    height: 50,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Colors.orange.shade200,
                        borderRadius: BorderRadius.circular(25),
                        border: Border.all(
                            color: Colors.orange.shade700, width: 2)),
                    child: Text("Play",
                        style: TextStyle(
                            color: Colors.orange.shade900, fontSize: 25)),
                  ),
                ),
              ),
              Container(
                width: 550,
                height: 50,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.orange.shade200,
                    borderRadius: BorderRadius.circular(25),
                    border:
                        Border.all(color: Colors.orange.shade700, width: 2)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text("Sum of all dice",
                        style: TextStyle(
                            color: Colors.orange.shade900, fontSize: 25)),
                    Text("$b",
                        style: TextStyle(
                            color: Colors.orange.shade900, fontSize: 25)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
