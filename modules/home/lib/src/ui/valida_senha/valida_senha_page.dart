import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';
import 'valida_senha_controller.dart';

class ValidaSenhaPage extends GetView<ValidaSenhaController> {
  const ValidaSenhaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Center(
            child: SizedBox(
              width: 80,
              height: 80,
              child: IconButton(
                  onPressed: () {
                    Get.toNamed(Routes.confirmaValidaSenha.caminho);
                  },
                  icon: const FaIcon(FontAwesomeIcons.google)),
            ),
          ),
          Center(
            child: SizedBox(
              width: 80,
              height: 80,
              child: IconButton(
                  onPressed: () {
                    controller.consumoApiPing(
                      onSuccess: () {
                        Get.snackbar("Sucesso", "Sucesso ao Chamar API");
                      },
                      onFail: () {
                        Get.snackbar("Erro", "Erro ao Chamar API");
                      },
                    );
                  },
                  icon: const FaIcon(FontAwesomeIcons.arrowRightFromBracket)),
            ),
          ),
          Center(
            child: SizedBox(
              width: 80,
              height: 80,
              child: IconButton(
                  onPressed: () {
                    controller.consumoApiRandom(
                      onSuccess: () {
                        Get.snackbar(
                            "Sucesso", "Sucesso ao Gerar senha pela API");
                      },
                      onFail: () {
                        Get.snackbar("Erro", "Erro ao Gerar senha pela API");
                      },
                    );
                  },
                  icon: const FaIcon(FontAwesomeIcons.userXmark)),
            ),
          ),
          Center(
            child: SizedBox(
              width: 80,
              height: 80,
              child: IconButton(
                  onPressed: () {
                    controller.consumoApiValidator(
                      onSuccess: () {
                        Get.snackbar(
                            "Sucesso", "Sucesso ao Validar a senha pela API");
                      },
                      onFail: () {
                        Get.snackbar(
                            "Erro", "Erro ao Validar a senha pela API");
                      },
                      password: '123456',
                    );
                  },
                  icon: const FaIcon(FontAwesomeIcons.angellist)),
            ),
          ),
          Center(
            child: SizedBox(
              width: 80,
              height: 80,
              child: Obx(() => Text(controller.isPong.value.toString())),
            ),
          ),
          Center(
            child: SizedBox(
              width: 80,
              height: 80,
              child: Obx(() => Text(controller.radomPassword.value)),
            ),
          ),
          Center(
            child: SizedBox(
              width: 200,
              height: 200,
              child:
                  Obx(() => Text(controller.validatePassword.value['message'].toString())),
            ),
          ),
          Center(
            child: SizedBox(
              width: 200,
              height: 200,
              child:
                  Obx(() => Text(controller.validatePassword.value['errors'].toString())),
            ),
          ),
        ],
      ),
    );
  }
}

// void _mostrarDialogoConfirmacao({
//   required VoidCallback onSuccess,
// }) {
//   Get.defaultDialog(
//     title: "Confirmação",
//     middleText: "Tem certeza que deseja apagar sua conta?",
//     textConfirm: "Sim",
//     textCancel: "Não",
//     confirmTextColor: Colors.white,
//     onConfirm: onSuccess,
//     onCancel: () {
//       Get.back(); // Fecha o diálogo
//     },
//   );
// }
