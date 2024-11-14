// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dependencies/dependencies.dart';

class ValidaSenhaController extends GetxController
    with LoaderMixin, MessagesMixin {
  final CoreController _coreController;
  ValidaSenhaController({
    required CoreController coreController,
  }) : _coreController = coreController;

  @override
  void onInit() {
    super.onInit();
    loaderListener(
      statusLoad: statusLoad,
    );
    messageListener(
      message: message,
    );
  }

  final message = Rxn<MessageModel>();
  final statusLoad = false.obs;

  final testeApiPing = 'Ping...'.obs;
  final alertasAPI = ''.obs;

  Future<void> consumoApiPing() async {
    try {
      statusLoad(true);
      final result = await _coreController.consumoApiPing();

      if (result) {
        testeApiPing('Pong!');
        alertasAPI('API Funcionando!');
        message(
          MessageModel.info(
            title: "Sucesso",
            message: "Sucesso ao verificar a API Ping!",
          ),
        );
      } else {
        testeApiPing('Ping...');
        alertasAPI('Falha ao verificar a API Ping!');
        message(
          MessageModel.error(
            title: "Erro",
            message: "Erro ao verificar a API Ping!",
          ),
        );
      }
    } catch (e) {
      testeApiPing('Ping...');
      alertasAPI('Falha ao verificar a API Ping!');
      message(
        MessageModel.error(
          title: "Erro",
          message: "Erro ao ao verificar a API Ping!",
        ),
      );
    } finally {
      statusLoad(false);
    }
  }

  Future<String?> consumoApiRandom() async {
    try {
      statusLoad(true);
      final result = await _coreController.consumoApiRandom();
      alertasAPI('Senha forte gerada pela API Random! Teste a validação!');
      message(
        MessageModel.info(
          title: "Sucesso",
          message: "Sucesso ao Gerar senha pela API Random!",
        ),
      );
      return result;
    } catch (e) {
      alertasAPI('Falha ao Gerar senha pela API Random!');
      message(
        MessageModel.error(
          title: "Erro",
          message: "Erro ao Gerar senha pela API Random!",
        ),
      );
      return null;
    } finally {
      statusLoad(false);
    }
  }

  Future<void> consumoApiValidator({
    required String password,
  }) async {
    try {
      statusLoad(true);
      final result = await _coreController.consumoApiValidator(password);
      if (result.validateSuccess != null) {
        message(
          MessageModel.info(
            title: "Sucesso",
            message: "Sucesso ao Validar a senha pela API",
          ),
        );
        await Get.offAllNamed(Routes.confirmaValidaSenha.caminho, arguments: [
          result.validateSuccess?.id,
          result.validateSuccess?.message
        ]);
      } else if (result.errorResponse != null) {
        alertasAPI(
            'Senha Invalidada! - Message ${result.errorResponse!.message}. Errors ${result.errorResponse!.errors}.');
        message(
          MessageModel.error(
            title: "Erro",
            message: "Erro ao Validar a senha pela API",
          ),
        );
      }
    } catch (e) {
      alertasAPI('Erro ao Validar a senha pela API! $e.');
      message(
        MessageModel.error(
          title: "Erro",
          message: "Erro ao Validar a senha pela API",
        ),
      );
    } finally {
      statusLoad(false);
    }
  }

  static ValidaSenhaController get to => Get.find<ValidaSenhaController>();
}
