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
  final isPong = false.obs;
  final radomPassword = ''.obs;
  final validatePassword = <String, dynamic>{}.obs;

  Future<void> consumoApiPing() async {
    try {
      statusLoad(true);
      final result = await _coreController.consumoApiPing();

      if (result) {
        isPong(true);
        message(
          MessageModel.info(
            title: "Sucesso",
            message: "Sucesso ao verificar a API Ping!",
          ),
        );
      } else {
        isPong(false);
        message(
        MessageModel.error(
          title: "Erro",
          message: "Erro ao verificar a API Ping!",
        ),
      );
      }
    } catch (e) {
      isPong(false);
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

  Future<void> consumoApiRandom() async {
    try {
      statusLoad(true);
      final result = await _coreController.consumoApiRandom();
      radomPassword(result);
      message(
        MessageModel.info(
          title: "Sucesso",
          message: "Sucesso ao Gerar senha pela API Random!",
        ),
      );
    } catch (e) {
      radomPassword('Erro ao gerar senha');
      message(
        MessageModel.error(
          title: "Erro",
          message: "Erro ao Gerar senha pela API Random!",
        ),
      );
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
      validatePassword(result);
      message(
        MessageModel.info(
          title: "Sucesso",
          message: "Sucesso ao Validar a senha pela API",
        ),
      );
    } catch (e) {
      radomPassword('Erro ao validar senha');
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
}
