import 'package:collection/algorithms.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import '../Providers/GameProvider.dart';
import '../Providers/HelpProvider.dart';

class WinDialog extends StatefulWidget {
  const WinDialog({super.key});

  @override
  State<WinDialog> createState() => _WinDialogState();
}

class _WinDialogState extends State<WinDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor:Colors.blueGrey[900] ,
      shadowColor: Colors.purpleAccent ,
      elevation: 10,

      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 15.0),
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.min,
          children: [
            Lottie.asset("assets/SlideGame/lotties/winner.json"),
            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                    width: 115,
                    height: 40,
                    decoration: BoxDecoration(
                        color: Colors.blueAccent,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.purpleAccent.withOpacity(0.7),
                              blurRadius: 15)
                        ],
                        borderRadius: BorderRadius.circular(15)),
                    child: TextButton(
                      onPressed: () async {
                        await Provider.of<GameProvider>(context , listen: false).loadAndSplitImage();
                        Provider.of<HelpProvider>(context, listen: false).restart();
                        Navigator.pop(context);

                      },
                      child: const Text("New Image",
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
                SizedBox(width: 5),
                Container(
                    width: 115,
                    height: 40,
                    decoration: BoxDecoration(
                        color: Colors.blueAccent,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.purpleAccent.withOpacity(0.7),
                              blurRadius: 15)
                        ],
                        borderRadius: BorderRadius.circular(15)),
                    child: TextButton(
                      onPressed: () {
                        setState(() {
                          Provider.of<GameProvider>(context , listen:false).shuffle();
                          Provider.of<HelpProvider>(context, listen: false).restart();
                          Navigator.pop(context);
                        });

                      },
                      child: const Text("Play Again",
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
            )
          ],),
      ),
    );
  }
}
