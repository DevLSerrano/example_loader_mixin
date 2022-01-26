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
            title: Row(
              children: [
                Container(
                  width: 30,
                  height: 30,
                  color: Colors.blue,
                ),
                const SizedBox(
                  width: 16,
                ),
                const Text('Mixin'),
                const Spacer(),
                Container(
                  width: 30,
                  height: 30,
                  color: Colors.red,
                ),
                const SizedBox(
                  width: 16,
                ),
                const Text('Extension')
              ],
            ),
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
              Center(
                child: ElevatedButton(
                  onPressed: () async => controller.extensionloginSucesso(),
                  child: const Text('Login Sucesso'),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.red,
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () async => controller.extensionloginError(),
                child: const Text('Login Falha'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.red,
                ),
              ),
              ElevatedButton(
                onPressed: () async {
                  if (await controller.extensionisValidUser()) {
                    Get.showSnackbar(const GetSnackBar(
                      title: 'Sucesso',
                      message: 'É um user valido.',
                      duration: Duration(seconds: 1),
                    ));
                  }
                },
                child: const Text('User Valido ?'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.red,
                ),
              ),
              ElevatedButton(
                onPressed: () async {
                  await controller.extensionisValidUserAndLogin();
                },
                child: const Text('User Valido ? + Login Sucesso'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.red,
                ),
              ),
              ElevatedButton(
                onPressed: () async {
                  await controller.extensionisValidUserAndLoginError();
                },
                child: const Text('User Valido ? + Login erro'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.red,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
