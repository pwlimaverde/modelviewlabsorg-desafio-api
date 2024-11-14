import 'package:dependencies/dependencies.dart';

import '../models/pong_response_model.dart';
import '../utils/erros.dart';
import '../utils/parameters.dart';
import '../utils/typedefs.dart';

final class FeaturesCorePresenter {
  static FeaturesCorePresenter? _instance;

  final CAPUsecase _consumoApiPingUsecase;
  final CARUsecase _consumoApiRandomUsecase;
  final CAVUsecase _consumoApiValidateUsecase;

  FeaturesCorePresenter._({
    required CAPUsecase consumoApiPingUsecase,
    required CARUsecase consumoApiRandomUsecase,
    required CAVUsecase consumoApiValidateUsecase,
  })  : _consumoApiPingUsecase = consumoApiPingUsecase,
        _consumoApiValidateUsecase = consumoApiValidateUsecase,
        _consumoApiRandomUsecase = consumoApiRandomUsecase;

  factory FeaturesCorePresenter({
    required CAPUsecase consumoApiPingUsecase,
    required CARUsecase consumoApiRandomUsecase,
    required CAVUsecase consumoApiValidateUsecase,
  }) {
    _instance ??= FeaturesCorePresenter._(
      consumoApiPingUsecase: consumoApiPingUsecase,
      consumoApiRandomUsecase: consumoApiRandomUsecase,
      consumoApiValidateUsecase: consumoApiValidateUsecase,
    );
    return _instance!;
  }

  Future<bool> consumoApiPing() async {
    final data = await _consumoApiPingUsecase(
      NoParams(
        error: ApiPingError(message: "Errro ao carregar dados da API"),
      ),
    );
    switch (data) {
      case SuccessReturn<PongResponseModel>():
        return true;
      case ErrorReturn<PongResponseModel>():
        throw data.result;
    }
  }

  Future<String> consumoApiRandom() async {
    final data = await _consumoApiRandomUsecase(
      ParametrosRandom(
        error: ApiRandomError(message: "Errro ao carregar dados da API"),
      ),
    );
    switch (data) {
      case SuccessReturn<PasswordSchemaModel>():
        return data.result.password;
      case ErrorReturn<PasswordSchemaModel>():
        throw data.result;
    }
  }

  Future<ResultValidate> consumoApiValidator(String password) async {
    final data = await _consumoApiValidateUsecase(
      ParametrosValidate(
        error: ApiValidateError(
          message: "Errro ao carregar dados da API",
        ),
        password: password,
      ),
    );
    switch (data) {
      case SuccessReturn<ValidateSuccessModel>():
        return ResultValidate(validateSuccess: data.result);
      case ErrorReturn<ValidateSuccessModel>():
        final error = data.result;
        if (error is ApiValidateError) {
          return ResultValidate(errorResponse: error.errorResponse);
        } else {
          throw error.message;
        }
    }
  }

  static FeaturesCorePresenter get to => Get.find<FeaturesCorePresenter>();
}
