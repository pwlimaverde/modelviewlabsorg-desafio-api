import 'package:flutter/material.dart';

class ErroPagePadrao extends StatelessWidget {
  const ErroPagePadrao({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(
          'assets/erro_404.png',
          height: 400,
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Erro 404!',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        )
      ],
    );
  }
}
