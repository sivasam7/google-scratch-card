import 'dart:math';

import 'package:confetti/confetti.dart';
import "package:flutter/material.dart";
import 'package:scratcher/widgets.dart';

void main() {
  runApp(Myapp());
}

class Myapp extends StatefulWidget {
  const Myapp({Key? key}) : super(key: key);

  @override
  _MyappState createState() => _MyappState();
}

class _MyappState extends State<Myapp> {
  ConfettiController _confettiController =
      ConfettiController(duration: Duration(seconds: 1));
  ConfettiController _confettiController2 =
      ConfettiController(duration: Duration(seconds: 1));
  ConfettiController _confettiController3 =
      ConfettiController(duration: Duration(seconds: 1));
  ConfettiController _confettiController4 =
      ConfettiController(duration: Duration(seconds: 1));
  @override
  void initState() {
    super.initState();
    _confettiController;
    _confettiController2;
    _confettiController3;
    _confettiController4;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.blue, primarySwatch: Colors.blue),
      home: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text("Scratch card"),
        ),
        body: Container(
          child: Stack(children: [
            Align(
              alignment: Alignment.centerLeft,
              child: ConfettiWidget(
                blastDirection: 0,
                confettiController: _confettiController,
                blastDirectionality: BlastDirectionality.explosive,
                numberOfParticles: 70,
                shouldLoop: false,
                minimumSize: const Size(5, 5),
                maximumSize: const Size(10, 20),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: ConfettiWidget(
                blastDirection: pi,
                confettiController: _confettiController2,
                blastDirectionality: BlastDirectionality.explosive,
                numberOfParticles: 70,
                shouldLoop: false,
                minimumSize: const Size(5, 5),
                maximumSize: const Size(10, 20),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: ConfettiWidget(
                blastDirection: -pi / 2,
                confettiController: _confettiController3,
                blastDirectionality: BlastDirectionality.explosive,
                numberOfParticles: 70,
                shouldLoop: false,
                minimumSize: const Size(5, 5),
                maximumSize: const Size(10, 20),
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: ConfettiWidget(
                blastDirection: pi / 2,
                confettiController: _confettiController4,
                blastDirectionality: BlastDirectionality.explosive,
                numberOfParticles: 70,
                shouldLoop: false,
                minimumSize: const Size(5, 5),
                maximumSize: const Size(10, 20),
              ),
            ),
            SizedBox(
              child: Center(
                child: Scratcher(
                  brushSize: 60,
                  threshold: 75,
                  image: Image.network(
                    "https://i0.wp.com/trickscharge.com/wp-content/uploads/2020/11/google-pay-scratch-card-offer.png?w=250&ssl=1",
                    fit: BoxFit.cover,
                  ),
                  onChange: (value) => print("$value"),
                  onThreshold: () {
                    _confettiController.play();
                    _confettiController2.play();
                    _confettiController3.play();
                    _confettiController4.play();
                  },

                  // color: Colors.blue,
                  child: Container(
                    height: 200,
                    width: 200,

                    // color: Colors.lightBlue,
                    child: Image.network("https://dartpad.dev/dart-192.png"),
                  ),
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
