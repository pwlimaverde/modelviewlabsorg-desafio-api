import 'package:dependencies/dependencies.dart';

class ConfirmaValidaSenhaMiddlewares extends GetMiddleware {
  ConfirmaValidaSenhaMiddlewares({super.priority});

 @override
  Future<RouteDecoder?> redirectDelegate(RouteDecoder route) async {


    if (!CoreController.to.statusValidate.value) {
      return RouteDecoder.fromRoute(Routes.acessoNegado.caminho);
    }
    return await super.redirectDelegate(route);
  }
}
