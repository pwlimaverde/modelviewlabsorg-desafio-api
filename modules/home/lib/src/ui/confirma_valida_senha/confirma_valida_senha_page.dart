import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

import 'confirma_valida_senha_controller.dart';

class ConfirmaValidaSenhaPage extends GetView<ConfirmaValidaSenhaController> {
  const ConfirmaValidaSenhaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PageBase(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(
            height: 10,
          ),
          const VerificadoPadrao(),
          const SizedBox(
            height: 10,
          ),
          const Text('A senha foi validada com sucesso pela API!'),
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
                      label: 'Teste Nova Senha',
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color:
                    Theme.of(context).colorScheme.inversePrimary.withAlpha(80),
                border: Border(
                  top: BorderSide(
                    width: 2,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                ),
              ),
              child: Column(
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Obx(() => Text("id - ${controller.id}")),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                   Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Obx(() => Text("message -${controller.message}")),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
