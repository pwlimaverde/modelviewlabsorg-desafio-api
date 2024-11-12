import 'package:dependencies/dependencies.dart';

import 'ui/login/login_controller.dart';

class LoginBinding implements Binding {
  @override
  List<Bind> dependencies() =>[
    Bind.lazyPut<LoginController>(
      () => LoginController(),
    ),
  ];
}
