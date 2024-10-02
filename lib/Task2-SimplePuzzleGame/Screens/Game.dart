import 'dart:async';

import 'package:cognorise_infotech/Task2-SimplePuzzleGame/Providers/HelpProvider.dart';
import 'package:cognorise_infotech/Task2-SimplePuzzleGame/Widgets/PuzzleGrid.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Providers/GameProvider.dart';
import '../Widgets/ImageDialog.dart';

class Game extends StatefulWidget {
  const Game({super.key});

  @override
  State<Game> createState() => _GameState();
}

class _GameState extends State<Game> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Slido Puzzle",
              style: TextStyle(
                  fontWeight: FontWeight.w900,
                  color: Colors.purpleAccent,
                  shadows: [
                    Shadow(
                      color: Colors.black45,
                      blurRadius: 5,
                      offset: Offset(2.0, 2.0),
                    )
                  ])),
          centerTitle: true,
          backgroundColor: Colors.blueGrey[900],
          shadowColor: Colors.purpleAccent,
          elevation: 8,
        ),
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.blueGrey[800]!, Colors.purple[900]!],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Consumer<HelpProvider>(
                        builder: (context, helpProvider, child) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Material(
                            elevation: 10,
                            shape: const CircleBorder(),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.blueGrey[900],
                                // Background color
                                shape: BoxShape.circle,
                              ),
                              child: IconButton(
                                  onPressed: () {
                                    showDialog(context: context, builder: (context)=>ImageDialog());
                                  },
                                  icon: Icon(Icons.image_outlined,
                                    color: Colors.white,
                                    size: 35,
                                  )),
                            ),
                          ),
                          Material(
                            elevation: 10,
                            shape: const CircleBorder(),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.blueGrey[900],
                                // Background color

                                boxShadow: helpProvider.needHelp
                                    ? [
                                        BoxShadow(
                                          color: Colors.yellowAccent
                                              .withOpacity(0.5),
                                          blurRadius: 10,
                                          spreadRadius: 1,
                                          // Offset to enhance the shadow effect
                                        ),
                                      ]
                                    : [],
                                shape: BoxShape.circle,
                              ),
                              child: IconButton(
                                  onPressed: () {
                                    helpProvider.startHelp();
                                  },
                                  icon: Icon(
                                    !helpProvider.needHelp
                                        ? Icons.star_border
                                        : Icons.star,
                                    color: (helpProvider.helps != 0)
                                        ? Colors.yellowAccent
                                        : Colors.black45,
                                    size: 35,
                                  )),
                            ),
                          ),
                        ],
                      );
                    }),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Moves: ",
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.purpleAccent,
                              shadows: [
                                Shadow(
                                    color: Colors.black45,
                                    offset: Offset(2.0, 2.0))
                              ]),
                        ),
                        Consumer<GameProvider>(
                            builder: (context, gameProvider, child) {
                          return Text("${gameProvider.moves}",
                              style: const TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blueAccent,
                                  shadows: [
                                    Shadow(
                                        color: Colors.black45,
                                        offset: Offset(2.0, 2.0))
                                  ]));
                        }),
                      ],
                    ),
                  ],
                ),
                Consumer<HelpProvider>(builder: (context, helpProvider, child) {
                  return Container(
                      height: 321,
                      width: 351,
                      decoration: BoxDecoration(
                          color: Colors.blueGrey[900],
                          boxShadow: [
                            BoxShadow(
                              color: !helpProvider.needHelp
                                  ? Colors.purpleAccent.withOpacity(0.7)
                                  : Colors.yellowAccent,
                              blurRadius: 20,
                            ),
                          ],
                          borderRadius: BorderRadius.circular(5)),
                      child: Consumer<GameProvider>(
                          builder: (context, gameProvider, child) {
                        return gameProvider.isChangeSelected
                            ? FutureBuilder(
                                future: gameProvider.loadAndSplitImage(),
                                builder: (context, snapshot) {
                                  if (snapshot.connectionState ==
                                      ConnectionState.waiting) {
                                    return const Center(
                                        child: CircularProgressIndicator());
                                  } else if (snapshot.hasError) {
                                    return const Center(
                                        child: Text(
                                            "Sorry he image can't be loaded"));
                                  } else {
                                    return getPuzzleGrid();
                                  }
                                })
                            : getPuzzleGrid();
                      }));
                }),
                Padding(
                  padding: const EdgeInsets.only(bottom: 70.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                          width: 90,
                          height: 50,
                          decoration: BoxDecoration(
                              color: Colors.blueAccent,
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.purpleAccent.withOpacity(0.7),
                                    blurRadius: 15)
                              ],
                              borderRadius: BorderRadius.circular(20)),
                          child: TextButton(
                            onPressed: () {
                              Provider.of<GameProvider>(context, listen: false)
                                  .shuffle();
                              Provider.of<HelpProvider>(context, listen: false)
                                  .restart();
                            },
                            child: const Text("Shuffle",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    shadows: [
                                      Shadow(
                                          color: Colors.black45,
                                          offset: Offset(2, 2))
                                    ])),
                          )),
                      Container(
                          width: 140,
                          height: 50,
                          decoration: BoxDecoration(
                              color: Colors.blueAccent,
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.purpleAccent.withOpacity(0.7),
                                    blurRadius: 15)
                              ],
                              borderRadius: BorderRadius.circular(20)),
                          child: TextButton(
                            onPressed: () {
                              Provider.of<GameProvider>(context, listen: false)
                                  .isChangeSelected = true;
                              Provider.of<HelpProvider>(context, listen: false)
                                  .restart();
                            },
                            child: const Text("Change Image",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    shadows: [
                                      Shadow(
                                          color: Colors.black45,
                                          offset: Offset(2, 2))
                                    ])),
                          )),
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
