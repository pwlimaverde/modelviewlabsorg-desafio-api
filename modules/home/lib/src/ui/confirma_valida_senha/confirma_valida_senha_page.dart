import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';
import 'confirma_valida_senha_controller.dart';

class ConfirmaValidaSenhaPage extends GetView<ConfirmaValidaSenhaController> {
  const ConfirmaValidaSenhaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      body: Column(
        children: [
          Center(
            child: SizedBox(
              width: 80,
              height: 80,
              child: IconButton(
                  onPressed: () {
                    // controller.signInGoogleLogin(
                    //   onSuccess: () {
                    //     Get.snackbar("Sucesso", "Sucesso ao fazer login");
                    //   },
                    //   onFail: () {
                    //     Get.snackbar("Erro", "Erro ao fazer login");
                    //   },
                    // );
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
                    // controller.logOut(
                    //   onSuccess: () {
                    //     Get.snackbar("Sucesso", "Sucesso ao fazer LogOut");
                    //   },
                    //   onFail: () {
                    //     Get.snackbar("Erro", "Erro ao fazer LogOut");
                    //   },
                    // );
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
                    // mostrarDialogoConfirmacao(onSuccess: () {
                    //   controller.apagarConta(
                    //     confirmacao: true,
                    //     onSuccess: () {
                    //       Get.snackbar("Sucesso", "Sucesso ao apagar a conta");
                    //       Get.toNamed("/login");
                    //     },
                    //     onFail: () {
                    //       Get.snackbar("Erro", "Erro ao apagar a conta");
                    //     },
                    //   );
                    //   Get.back();
                    // });
                  },
                  icon: const FaIcon(FontAwesomeIcons.userXmark)),
            ),
          ),
          Center(
            child: SizedBox(
              width: 80,
              height: 80,
              child: Obx(() => Text(controller.teste.value)),
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
