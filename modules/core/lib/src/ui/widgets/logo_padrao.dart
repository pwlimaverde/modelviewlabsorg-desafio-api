import 'package:flutter/material.dart';

class LogoPadrao extends StatelessWidget {
  const LogoPadrao({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'assets/logo.png',
          height: 200,
        ),
        Text(
          'Consumo API',
          style: Theme.of(context).textTheme.headlineMedium,
        )
      ],
    );
  }
}
