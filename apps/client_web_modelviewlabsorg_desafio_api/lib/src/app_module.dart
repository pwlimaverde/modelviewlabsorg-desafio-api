import 'package:dependencies/dependencies.dart';

final class AppModule implements ModuleSystem {
  @override
  List<GetPage> routes = [
    ...HomeModule().routes,
    GetPage(
      name: Routes.acessoNegado.caminho,
      page: () => const PaginaAcessoNegado(),
    ),
  ];
}
