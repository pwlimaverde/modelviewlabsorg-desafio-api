import 'package:flutter/material.dart';

class AcessoNegadoPadrao extends StatelessWidget {
  const AcessoNegadoPadrao({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(
          'assets/acesso_negado.png',
          height: 400,
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Erro de Acesso!',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        )
      ],
    );
  }
}
