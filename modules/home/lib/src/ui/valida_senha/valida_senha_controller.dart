// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dependencies/dependencies.dart';

class ValidaSenhaController extends GetxController {
  final FeaturesCorePresenter _featuresCorePresenter;
  ValidaSenhaController({
    required FeaturesCorePresenter featuresCorePresenter,
  }) : _featuresCorePresenter = featuresCorePresenter;

  final isPong = false.obs;
  final radomPassword = ''.obs;
  final validatePassword = <String, dynamic>{}.obs;

  Future<void> consumoApiPing({
    required VoidCallback onSuccess,
    required VoidCallback onFail,
  }) async {
    try {
      final result = await _featuresCorePresenter.consumoApiPing();

      if (result) {
        isPong(true);
        onSuccess();
      } else {
        isPong(false);
        onFail();
      }
    } catch (e) {
      isPong(false);
      onFail();
    }
  }

  Future<void> consumoApiRandom({
    required VoidCallback onSuccess,
    required VoidCallback onFail,
  }) async {
    try {
      final result = await _featuresCorePresenter.consumoApiRandom();

      radomPassword(result);
      onSuccess();
    } catch (e) {
      radomPassword('Erro ao gerar senha');
      onFail();
    }
  }
  Future<void> consumoApiValidator({
    required VoidCallback onSuccess,
    required VoidCallback onFail,
    required String password,
  }) async {
    try {
      final result = await _featuresCorePresenter.consumoApiValidator(password);
      Logger().i(result);
      validatePassword(result);
      onSuccess();
    } catch (e) {
      radomPassword('Erro ao validar senha');
      onFail();
    }
  }
}
