import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';


mixin MessagesMixin on GetxController {
  void messageListener({
    required Rxn<MessageModel> message,
  }) {
    ever<MessageModel?>(message, (model) {
      WidgetsBinding.instance.addPostFrameCallback((duration) async {
        if (model != null) {
          Get.snackbar(model.title, model.message,
              backgroundColor: model.type.color.withAlpha(30));
        }
      });
    });
  }
}
