import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

import 'app_module.dart';

final class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Desafio - Model View Labs',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 0, 6, 59),
          brightness: Brightness.light,
          primary: const Color.fromARGB(255, 0, 6, 59),
          secondary: const Color.fromARGB(255, 159, 167, 241),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 0, 6, 59),
              textStyle: const TextStyle(
                color: Color.fromARGB(255, 159, 167, 241),
              )),
        ),
        useMaterial3: true,
      ),
      binds: [
        ...CoreBinding().dependencies(),
      ],
      getPages: AppModule().routes,
    );
  }
}
