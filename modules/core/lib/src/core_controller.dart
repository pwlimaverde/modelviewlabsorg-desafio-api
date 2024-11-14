import 'package:dependencies/dependencies.dart';

import 'utils/erros.dart';

final class CoreController extends GetxController {
  final FeaturesCorePresenter _featuresCorePresenter;
  CoreController({
    required FeaturesCorePresenter featuresCorePresenter,
  }) : _featuresCorePresenter = featuresCorePresenter;

  Future<bool> consumoApiPing() async {
    try {
      return await _featuresCorePresenter.consumoApiPing();
    } on ApiPingError catch (_) {
      rethrow;
    } catch (e) {
      throw Exception('Erro ao consumir API Ping: ${e.toString()}');
    }
  }

  Future<String> consumoApiRandom() async {
    try {
      return await _featuresCorePresenter.consumoApiRandom();
    } on ApiRandomError catch (_) {
      rethrow;
    } catch (e) {
      throw Exception('Erro ao consumir API Random: ${e.toString()}');
    }
  }

  Future<ResultValidate> consumoApiValidator(
    String password,
  ) async {
    try {
      return await _featuresCorePresenter.consumoApiValidator(password);
    } on ApiValidateError catch (_) {
      rethrow;
    } catch (e) {
      throw Exception('Erro ao consumir API Validate: ${e.toString()}');
    }
  }

  static CoreController get to => Get.find<CoreController>();
}
