import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

import 'valida_senha_controller.dart';

class ValidaSenhaPage extends StatefulWidget {
  const ValidaSenhaPage({super.key});

  @override
  State<ValidaSenhaPage> createState() => _ValidaSenhaPageState();
}

class _ValidaSenhaPageState extends State<ValidaSenhaPage> {
  final _formKey = GlobalKey<FormState>();
  final _passwordEC = TextEditingController();
  final _passwordFocus = FocusNode();

  @override
  void dispose() {
    super.dispose();
    _passwordEC.dispose();
    _passwordFocus.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageBase(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(
            height: 10,
          ),
          const LogoPadrao(),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 40,
              vertical: 20,
            ),
            child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    FieldPadrao(
                      label: 'Teste sua senha',
                      controller: _passwordEC,
                      focusNode: _passwordFocus,
                      validator: Validatorless.multiple([
                        Validatorless.required("Senha obrigatória"),
                        Validatorless.min(
                            8, "Senha deve ter no mínimo 8 caracteres!"),
                        Validatorless.regex(RegExp(r'^(?=.*[0-9]).*$'),
                            'Senha deve ter pelo menos um número!'),
                        Validatorless.regex(RegExp(r'^(?=.*[A-Z]).*$'),
                            'Senha deve ter pelo menos uma letra maiúscula!'),
                        Validatorless.regex(RegExp(r'^(?=.*[a-z]).*$'),
                            'Senha deve ter pelo menos uma letra minúscula!'),
                        Validatorless.regex(RegExp(r'^(?=.*[\W_]).*$'),
                            'Senha deve ter pelo menos um caracter especial!'),
                      ]),
                      obscureText: true,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                          onPressed: () async {
                            var passwordGerado = await ValidaSenhaController.to
                                .consumoApiRandom();
                            if (passwordGerado != null) {
                              _passwordEC.text = passwordGerado;
                              _passwordFocus.requestFocus();
                            }
                          },
                          child: const Text('Gerar senha forte!'),
                        ),
                        ElevatedButtonPadrao(
                          onPressed: () {
                            final formValid =
                                _formKey.currentState?.validate() ?? false;
                            if (formValid) {
                              final password = _passwordEC.text;
                              ValidaSenhaController.to
                                  .consumoApiValidator(password: password);
                            }
                          },
                          label: 'Validar Senha',
                        ),
                      ],
                    ),
                  ],
                )),
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color:
                    Theme.of(context).colorScheme.inversePrimary.withAlpha(80),
                border: Border(
                  top: BorderSide(
                    width: 2,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                ),
              ),
              child: Column(
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Quer testar a API?'),
                      TextButton(
                        onPressed: () =>
                            ValidaSenhaController.to.consumoApiPing(),
                        child: Obx(() =>
                            Text("${ValidaSenhaController.to.testeApiPing}")),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Obx(
                    () => Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: Text(
                        "${ValidaSenhaController.to.alertasAPI}",
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.primary,
                            fontSize: 15),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
