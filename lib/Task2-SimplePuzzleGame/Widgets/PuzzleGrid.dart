import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Providers/GameProvider.dart';
import '../Providers/HelpProvider.dart';
import 'WinDialog.dart';

Widget getPuzzleGrid() {
  return Consumer<HelpProvider>(builder: (context, helpProvider, child) {
    return Consumer<GameProvider>(builder: (context, gameProvider, child) {
      return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 3,
          crossAxisSpacing: 3,
        ),
        physics: const NeverScrollableScrollPhysics(),
        itemCount: gameProvider.imageParts.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              if (helpProvider.needHelp) {
                if (gameProvider.selectedParts.length != 2) {
                  gameProvider.addSelectedPart(index);
                  gameProvider.imageParts[index].isSelected = true;
                  if (gameProvider.selectedParts.length == 2) {
                    gameProvider.swapParts();
                    helpProvider.removeHelp();
                  }
                }
              } else {
                gameProvider.moveSelectedPart(index);
              }

              if (gameProvider.isWin() && gameProvider.selectedParts.length != 1) {
                showDialog(
                    context: context, builder: (context) => const WinDialog());
              }
            },
            child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),

                  border: Border.all(
                      color: gameProvider.imageParts[index].isSelected
                          ? Colors.yellowAccent
                          : Colors.transparent),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: gameProvider.imageParts[index].image,
                )),
          );
        },
      );
    });
  });
}
