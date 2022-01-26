import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'home_controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
      initState: (_) {},
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Modelo de Mixin'),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: ElevatedButton(
                  onPressed: () async => controller.loginSucesso(),
                  child: const Text('Login Sucesso'),
                ),
              ),
              ElevatedButton(
                onPressed: () async => controller.loginError(),
                child: const Text('Login Falha'),
              ),
              ElevatedButton(
                onPressed: () async {
                  if (await controller.isValidUser()) {
                    Get.showSnackbar(const GetSnackBar(
                      title: 'Sucesso',
                      message: 'É um user valido.',
                      duration: Duration(seconds: 1),
                    ));
                  }
                },
                child: const Text('User Valido ?'),
              ),
              ElevatedButton(
                onPressed: () async {
                  await controller.isValidUserAndLogin();
                },
                child: const Text('User Valido ? + Login Sucesso'),
              ),
              ElevatedButton(
                onPressed: () async {
                  await controller.isValidUserAndLoginError();
                },
                child: const Text('User Valido ? + Login erro'),
              ),
            ],
          ),
        );
      },
    );
  }
}
