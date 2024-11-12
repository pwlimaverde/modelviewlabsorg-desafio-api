import 'package:dependencies/dependencies.dart';


final class AppModule implements ModuleSystem {
  @override
  List<GetPage> routes = [
    ...HomeModule().routes,
  ];
}
