// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dependencies/dependencies.dart';

class ValidaSenhaController extends GetxController {
  final FeaturesCorePresenter _featuresCorePresenter;
  ValidaSenhaController({
    required FeaturesCorePresenter featuresCorePresenter,
  }) : _featuresCorePresenter = featuresCorePresenter;

  final isPong = false.obs;

  Future<void> consumoApiPing({
    required VoidCallback onSuccess,
    required VoidCallback onFail,
  }) async {
    final result = await _featuresCorePresenter.consumoApiPing();
    
    if (result) {
      isPong(true);
      onSuccess();
    } else {
      isPong(false);
      onFail();
    }
  }
}
