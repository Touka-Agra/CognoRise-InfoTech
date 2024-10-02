import 'dart:typed_data';

import 'package:cognorise_infotech/Task2-SimplePuzzleGame/Providers/GameProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:image/image.dart' as imglib;


class ImageDialog extends StatelessWidget {
  const ImageDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
        backgroundColor:Colors.blueGrey[900] ,
        shadowColor: Colors.purpleAccent ,
        elevation: 10,

        child:ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Image.memory(
            Uint8List.fromList(
              imglib.encodeJpg(Provider.of<GameProvider>(context, listen: false).image),
            ),
            fit: BoxFit.contain,
          ),
        ),
    );
  }
}
