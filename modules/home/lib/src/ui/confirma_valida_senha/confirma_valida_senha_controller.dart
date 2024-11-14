import 'package:dependencies/dependencies.dart';

class ConfirmaValidaSenhaController extends GetxController {

  final id = ''.obs;
  final message = ''.obs;


  @override
  void onInit() async {
    super.onInit();
    final arguments = Get.arguments;
    id(arguments[0]);
    message(arguments[1]);
  }

    

}
