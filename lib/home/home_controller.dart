import 'package:example_loader_mixin/extension/async_extension.dart';
import 'package:example_loader_mixin/home/second_page.dart';
import 'package:example_loader_mixin/mixin/async_loader.dart';
import 'package:get/get.dart';

class HomeController extends GetxController with AsyncLoaderMixin {
  Future<void> loginSucesso() async {
    await callAsyncLoader(Future.delayed(const Duration(seconds: 3), () {}))
        .then((value) => Get.to(
              () => SecondPage(
                controller: this,
              ),
            ));
  }

  Future<void> loginError() async {
    await callAsyncLoader(_fakeError()).catchError((e) {
      Get.showSnackbar(GetSnackBar(
        title: 'Error',
        message: e,
        duration: const Duration(seconds: 1),
      ));
    });
  }

  Future<void> _fakeError() async {
    await Future.delayed(const Duration(seconds: 3), () {
      throw 'Erro em seus dados.';
    });
  }

  Future<bool> isValidUser() async {
    return await callAsyncLoader(Future.delayed(const Duration(seconds: 3), () {
      return true;
    }));
  }

  Future<void> isValidUserAndLogin() async {
    return await callAsyncLoader(isValidUser()).then((value) async {
      await loginSucesso();
    });
  }

  Future<void> isValidUserAndLoginError() async {
    return await callAsyncLoader(isValidUser()).then((value) async {
      await loginError();
    });
  }

  Future<void> goBack() async {
    return await callAsyncLoader(Future.delayed(const Duration(seconds: 3), () {
      Get.back();
    }));
  }

  ///! extension
  ///
  ///
  Future<void> extensionloginSucesso() async {
    await Future.delayed(const Duration(seconds: 3), () {})
        .asyncLoader()
        .then((value) => Get.to(
              () => SecondPage(
                controller: this,
              ),
            ));
  }

  Future<void> extensionloginError() async {
    await _extensionfakeError().asyncLoader().catchError((e) {
      Get.showSnackbar(GetSnackBar(
        title: 'Error',
        message: e,
        duration: const Duration(seconds: 1),
      ));
    });
  }

  Future<void> _extensionfakeError() async {
    await Future.delayed(const Duration(seconds: 3), () {
      throw 'Erro em seus dados.';
    });
  }

  Future<bool> extensionisValidUser() async {
    return await Future.delayed(const Duration(seconds: 3), () {
      return true;
    }).asyncLoader();
  }

  Future<void> extensionisValidUserAndLogin() async {
    return await isValidUser().asyncLoader().then((value) async {
      await loginSucesso();
    });
  }

  Future<void> extensionisValidUserAndLoginError() async {
    return await isValidUser().asyncLoader().then((value) async {
      await loginError();
    });
  }
}
