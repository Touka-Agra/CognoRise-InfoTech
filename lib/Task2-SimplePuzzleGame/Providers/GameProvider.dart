import 'package:cognorise_infotech/Task2-SimplePuzzleGame/Providers/HelpProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image/image.dart' as imglib;
import 'package:http/http.dart' as http;

import 'package:provider/provider.dart';

import '../Classes/ImageIdx.dart';

class GameProvider extends ChangeNotifier {

  late imglib.Image image;
  List<ImageIdx> imageParts = [];

  Image emptyImage = Image.asset(
    'assets/SlideGame/images/white.png',
    fit: BoxFit.fill,
    color: Colors.transparent,
  );
  int emptyImageIndex = 8;

  int moves = 0;

  List<int> selectedParts = [];

  bool isChangeSelected=true;


  Future<void> loadAndSplitImage() async {
    restart();
    imageParts=[];
    isChangeSelected=false;
    try{
      final response =await http.get(Uri.parse("https://picsum.photos/300/300"));

      if(response.statusCode==200){
        final Uint8List bytes = response.bodyBytes;

        image = imglib.decodeImage(bytes)!;

        int width = (image.width / 3).floor();
        int height = (image.height / 3).floor();

        int counter=0;
        for (int i = 0; i < 3; i++) {
          for (int j = 0; j < 3; j++) {
            imglib.Image part = imglib.copyCrop(image,
                x: width * j, y: height * i, width: width, height: height);

            if (i == 2 && j == 2) {
              imageParts.add(ImageIdx(image: emptyImage, idx: 8));
              break;
            }
            imageParts.add(ImageIdx(
                image: Image.memory(
                  Uint8List.fromList(imglib.encodeJpg(part)),
                  fit: BoxFit.fill,
                ), idx: counter));
            counter++;
          }
        }][;pllllllll]
              notifyListeners();
      }
    }catch(e){
      print(e);
    }
  }

  shuffle() {
    imageParts.shuffle();
    restart();
    emptyImageIndex = _findEmptyPart();

    notifyListeners();
  }

  restart() {
    emptyImageIndex = 8;
    moves = 0;
    selectedParts.clear();
  }

  int _findEmptyPart() {
    return imageParts.indexWhere((imageIdx) => imageIdx.image == emptyImage);
  }

  moveSelectedPart(int selectedIndex) {
    if (_isAdjacent(selectedIndex)) {
      ImageIdx selectedPart = imageParts[selectedIndex];

      imageParts[selectedIndex] =
          imageParts[emptyImageIndex]; //selected be the empty
      imageParts[emptyImageIndex] = selectedPart; //empty be the selected

      emptyImageIndex = selectedIndex;
      moves++;

      notifyListeners();
    }
  }

  bool _isAdjacent(int selectedIndex) {
    return (((selectedIndex == emptyImageIndex + 1)  && selectedIndex%3!=0) ||
        ((selectedIndex == emptyImageIndex - 1) && selectedIndex%3!=2) ||
        (selectedIndex == emptyImageIndex - 3) ||
        (selectedIndex == emptyImageIndex + 3));
  }

  addSelectedPart(int index){
    selectedParts.add(index);
    imageParts[index].isSelected=true;

    notifyListeners();
  }

  swapParts() {
    int firstPartIndex = selectedParts[0];
    int secondPartIndex = selectedParts[1];

    print(imageParts[firstPartIndex].isSelected);

    ImageIdx temp = imageParts[firstPartIndex];

    imageParts[firstPartIndex] = imageParts[secondPartIndex]; //first be second;
    imageParts[secondPartIndex] = temp; //second be first

    //adjust the empty index if changed
    if (firstPartIndex == emptyImageIndex)
      emptyImageIndex = secondPartIndex;
    else if (secondPartIndex == emptyImageIndex)
      emptyImageIndex = firstPartIndex;


    //remove the shadow of selected parts
    imageParts[firstPartIndex].isSelected=false;
    imageParts[secondPartIndex].isSelected=false;

    selectedParts.clear();

    notifyListeners();
  }



  bool isWin() {
    for (int i = 0; i < imageParts.length; i++) {
      if (imageParts[i].idx != i) return false;
    }
    return true;
  }
}
