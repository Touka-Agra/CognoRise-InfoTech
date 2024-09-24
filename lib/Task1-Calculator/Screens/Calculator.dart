import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Classes/Button.dart';
import '../Providers/ScreenProvider.dart';
import '../Providers/ThemeProvider.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  final Color c = Colors.deepOrange[300]!;

  bool switchValue = false;

  List<String> numbers=["1","2","3","4","5","6","7","8","9","0","(",")","."];
  List<String> operation=['+','-','x','÷'];

  String query="";


  @override
  Widget build(BuildContext context) {
    final bgc = Theme.of(context).scaffoldBackgroundColor;

    final textC = bgc == Colors.white ? Colors.black : Colors.white;

    List<Button> buttons = [
      Button(text: "C", color: c, backgroundColor: bgc),
      Button(text: "(", color: c, backgroundColor: bgc),
      Button(text: ")", color: c, backgroundColor: bgc),
      Button(text: "÷", color: Colors.white, backgroundColor: c),
      Button(text: "7", color: textC, backgroundColor: bgc),
      Button(text: "8", color: textC, backgroundColor: bgc),
      Button(text: "9", color: textC, backgroundColor: bgc),
      Button(text: "x", color: Colors.white, backgroundColor: c),
      Button(text: "4", color: textC, backgroundColor: bgc),
      Button(text: "5", color: textC, backgroundColor: bgc),
      Button(text: "6", color: textC, backgroundColor: bgc),
      Button(text: "−", color: Colors.white, backgroundColor: c),
      Button(text: "1", color: textC, backgroundColor: bgc),
      Button(text: "2", color: textC, backgroundColor: bgc),
      Button(text: "3", color: textC, backgroundColor: bgc),
      Button(text: "+", color: Colors.white, backgroundColor: c),
      Button(text: ".", color: textC, backgroundColor: bgc),
      Button(text: "0", color: textC, backgroundColor: bgc),
      Button(text: "", color: c, backgroundColor: bgc),
      Button(text: "=", color: Colors.white, backgroundColor: c),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text("Calculator",
            style: TextStyle(color: c, fontWeight: FontWeight.w600)),
        centerTitle: true,
        leading: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Switch(
            value: switchValue,
            inactiveThumbColor: Colors.deepOrange[200],
            activeColor: c,
            inactiveTrackColor: Colors.grey[300],
            thumbIcon: switchValue
                ? MaterialStateProperty.all(Icon(Icons.dark_mode, color: Colors.white))
                : MaterialStateProperty.all(Icon(Icons.light_mode, color: Colors.black)),
            onChanged: (value) {
              setState(() {
                switchValue = value;
                Provider.of<ThemeProvider>(context, listen: false)
                    .themeToggle();
              });
            },
          ),
        ),
        backgroundColor: bgc,
      ),
      body: Container(
          color: bgc,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Consumer<ScreenProvider>(
                    builder: (context , screenProvider , child){
                      return SingleChildScrollView(
                          reverse: true,
                          child: Container(
                              alignment: Alignment.bottomRight,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 20),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(screenProvider.isEqualPressed?screenProvider.text:"", style: TextStyle(fontSize: 25,fontWeight: FontWeight.w500, color: Colors.grey[400])),
                                    SizedBox(height: 10),
                                    Text(screenProvider.isEqualPressed?screenProvider.total.toString():screenProvider.text, style: TextStyle(fontSize: 35,fontWeight: FontWeight.w500, color: textC),),
                                  ],
                                ),
                              ))
                      );
                    }
                ),
              ),
              Flexible(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4,
                          mainAxisSpacing: 10.0,
                          crossAxisSpacing: 10.0,
                        ),
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: buttons.length,
                        itemBuilder: (context, index) {
                          Button button = buttons[index];
                          if (index == 18) {
                            return Container(
                                decoration: BoxDecoration(
                                  color: bgc,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.4),
                                      blurRadius: 8,
                                    )
                                  ],
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: IconButton(
                                    onPressed: () {
                                      Provider.of<ScreenProvider>(context, listen:false).removeText();
                                    },
                                    style: ButtonStyle(
                                      backgroundColor: MaterialStatePropertyAll(
                                          button.backgroundColor),
                                      shape: MaterialStatePropertyAll(
                                          RoundedRectangleBorder(
                                              borderRadius:
                                              BorderRadius.circular(15))),
                                    ),
                                    icon: Icon(
                                      Icons.backspace_outlined,
                                      color: button.color,
                                      size: 30,
                                    )));
                          }
                          return Container(
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.45),
                                  blurRadius: 5,
                                )
                              ],
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: TextButton(
                              onPressed: () {
                                String text=button.text;
                                if(text!="C" && text!="="){
                                  Provider.of<ScreenProvider>(context, listen:false).addText(text);
                                }
                                else if(text=="C"){
                                  Provider.of<ScreenProvider>(context, listen:false).clearText();
                                }
                                else if(text=="="){
                                  bool isValid= Provider.of<ScreenProvider>(context, listen: false).calculate();
                                  if(!isValid){
                                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(backgroundColor: textC,content: Text("Invalid Expression")));
                                  }
                                }

                              },
                              style: ButtonStyle(
                                backgroundColor: MaterialStatePropertyAll(
                                    button.backgroundColor),
                                shape: MaterialStatePropertyAll(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                        BorderRadius.circular(15))),
                                overlayColor: MaterialStateProperty.all(
                                    Colors.grey[200]), // Disable ripple effect
                              ),
                              child: Text(button.text,
                                  style: TextStyle(
                                      fontSize: 25,
                                      color: button.color,
                                      fontWeight: FontWeight.w500)),
                            ),
                          );
                        }),
                  ))
            ],
          )),
    );
  }
}
