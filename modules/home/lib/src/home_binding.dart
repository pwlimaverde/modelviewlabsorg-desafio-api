import 'package:dependencies/dependencies.dart';

import 'ui/confirma_valida_senha/confirma_valida_senha_controller.dart';
import 'ui/valida_senha/valida_senha_controller.dart';

class HomeBinding implements Binding {
  @override
  List<Bind> dependencies() =>[
    Bind.lazyPut<ConfirmaValidaSenhaController>(
      () => ConfirmaValidaSenhaController(),
    ),
    Bind.lazyPut<ValidaSenhaController>(
      () => ValidaSenhaController(),
    ),
  ];
}
