import 'package:dependencies/dependencies.dart';

import 'erros.dart';

final class ParametrosRandom implements ParametersReturnResult {
  @override
  final ApiRandomError error;

  ParametrosRandom({
    required this.error,
  });
}

final class ParametrosValidate implements ParametersReturnResult {
  final String password;
  @override
  final ApiValidateError error;

  ParametrosValidate({
    required this.error,
    required this.password,
  });
}