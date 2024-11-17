import 'package:dependencies/dependencies.dart';

import 'home_binding.dart';
import 'ui/confirma_valida_senha/confirma_valida_senha_middlewares.dart';
import 'ui/confirma_valida_senha/confirma_valida_senha_page.dart';
import 'ui/valida_senha/valida_senha_page.dart';

final class HomeModule implements ModuleSystem {
  @override
  List<GetPage> routes = [
    GetPage(
      name: Routes.home.caminho,
      page: () => const ValidaSenhaPage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.confirmaValidaSenha.caminho,
      page: () => const ConfirmaValidaSenhaPage(),
      binding: HomeBinding(),
      middlewares: [
        ConfirmaValidaSenhaMiddlewares(priority: 0),
      ]
    )
  ];
}
