import 'package:flutter/material.dart';

class VerificadoPadrao extends StatelessWidget {
  const VerificadoPadrao({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(
          'assets/verificado.png',
          height: 200,
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Parabens!',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        )
      ],
    );
  }
}
