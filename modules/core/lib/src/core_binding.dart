import 'package:dependencies/dependencies.dart';

class CoreBinding implements Binding {
  @override
  List<Bind> dependencies() =>[
    Bind.put<CoreController>(
      CoreController(),
    ),
  ];
  
}