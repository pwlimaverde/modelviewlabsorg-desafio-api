import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

import '../widgets/acesso_negado_padrao.dart';



class PaginaAcessoNegado extends StatelessWidget {
  const PaginaAcessoNegado({super.key});

  @override
  Widget build(BuildContext context) {
    return PageBase(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(
            height: 10,
          ),
          const AcessoNegadoPadrao(),
          const SizedBox(
            height: 10,
          ),
          const Text('Você não tem permissão para acessar esta página!'),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 40,
              vertical: 20,
            ),
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButtonPadrao(
                      onPressed: () => Get.offAllNamed(Routes.home.caminho),
                      label: 'Página Inicial',
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
