import 'dart:math';

import 'package:flutter/material.dart';

class FallingLeaves extends StatefulWidget {
  @override
  _FallingLeavesState createState() => _FallingLeavesState();
}

class _FallingLeavesState extends State<FallingLeaves> {
  List<double> initialPositions = [];
  List<double> fallHeights = [];
  List<Duration> durations = [];
  List<bool> isVisible = [];

  @override
  void initState() {
    super.initState();
    var rng = Random();
    for (int i = 0; i < 50; i++) {
      initialPositions.add(rng.nextDouble() * 720); // Posición inicial en X
      fallHeights.add(
          rng.nextDouble() * -300.0); // Altura inicial (arriba de la pantalla)
      durations.add(Duration(
          seconds:
              rng.nextInt(5) + 3)); // Duración aleatoria entre 3 y 7 segundos
      isVisible.add(true); // Inicialmente todas las hojas son visibles
    }

    _startAnimation();
  }

  void _startAnimation() {
    Future.delayed(Duration(milliseconds: 100)).then((_) {
      setState(() {
        for (int i = 0; i < fallHeights.length; i++) {
          fallHeights[i] = MediaQuery.of(context).size.height;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: List.generate(initialPositions.length, (index) {
        return AnimatedPositioned(
          duration: durations[index],
          curve: Curves.linear,
          top: fallHeights[index],
          left: initialPositions[index],
          child: Visibility(
            visible: isVisible[index],
            child: Image.asset(
              'assets/images/8bit-mint.png', // Asegúrate de tener esta imagen en tu carpeta de assets
              width: 50,
            ),
          ),
          onEnd: () {
            setState(() {
              isVisible[index] = false; // Hacer la hoja invisible
              fallHeights[index] = Random().nextDouble() * -300.0;
              initialPositions[index] = Random().nextDouble() * 720;
              durations[index] = Duration(seconds: Random().nextInt(5) + 3);
            });

            // Hacer que la hoja sea visible de nuevo después de 1 segundo y reiniciar el ciclo
            Future.delayed(Duration(seconds: 1)).then((_) {
              setState(() {
                isVisible[index] = true; // Hacer la hoja visible de nuevo
              });
            });
          },
        );
      }),
    );
  }
}
