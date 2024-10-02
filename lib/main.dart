import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Task1-Calculator/Classes/Theme.dart';
import 'Task1-Calculator/Providers/ScreenProvider.dart';
import 'Task1-Calculator/Providers/ThemeProvider.dart';
import 'Task2-SimplePuzzleGame/Providers/GameProvider.dart';
import 'Task2-SimplePuzzleGame/Providers/HelpProvider.dart';

import 'Task1-Calculator/Screens/Calculator.dart';
import 'Task2-SimplePuzzleGame/Screens/GameSplash.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        //Calculator
        ChangeNotifierProvider(create: (_)=>ThemeProvider()),
        ChangeNotifierProvider(create: (_)=>ScreenProvider()),

        //Game
        ChangeNotifierProvider(create: (_)=>GameProvider()),
        ChangeNotifierProvider(create: (_)=>HelpProvider()),

      ],
      child: Consumer<ThemeProvider>(
          builder:(context , themeProvider , child){
            return MaterialApp(
                title: 'Flutter Demo',
                debugShowCheckedModeBanner: false,
                theme: themeProvider.isLight?lightTheme:darkTheme,

                //Calcultor=> Calculator()
                //Sliding Game=>GameSplash()
                home: GameSplash()
            );
          }
      ),
    );
  }
}
