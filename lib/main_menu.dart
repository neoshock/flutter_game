import 'package:flutter/material.dart';
import 'package:pixel_adventure/main.dart';

class MainMenu extends StatefulWidget {
  const MainMenu({Key? key}) : super(key: key);

  @override
  _MainMenuState createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
  Widget _buildButton(String text, Function() onPressed) {
    return SizedBox(
      width: 360,
      height: 45,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
          elevation: MaterialStateProperty.all<double>(10),
          shadowColor:
              MaterialStateProperty.all<Color>(Colors.greenAccent.shade700),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.0),
            ),
          ),
        ),
        onPressed: onPressed,
        child: Text(text),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(
                            'assets/video/8-bit-xkgev2tzaemj20m0.jpg'))),
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 100,
                    ),
                    _buildButton('Jugar', () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => GameScreen()),
                      );
                    }),
                    SizedBox(
                      height: 20,
                    ),
                    _buildButton('Creditos', () {}),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ))));
  }
}
