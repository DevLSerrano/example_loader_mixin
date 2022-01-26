import 'package:flutter/material.dart';
import 'package:get/get.dart';

mixin AsyncLoaderMixin on GetxController {
  bool _isOpen = false;

  Future<T> callAsyncLoader<T>(Future<T> futureFunction) async {
    if (!_isOpen) {
      _callDialog();
    }
    return await futureFunction.whenComplete(() {
      _isOpen = false;
      Get.back();
    });
  }

  void _callDialog() {
    _isOpen = true;
    Get.dialog(
      WillPopScope(
        onWillPop: () async => false,
        child: Center(
          child: Container(
            color: Colors.white,
            padding: const EdgeInsets.all(8),
            child: const CircularProgressIndicator(),
          ),
        ),
      ),
      barrierDismissible: false,
      name: 'AsyncLoaderMixin - Dialog',
      transitionDuration: const Duration(seconds: 0),
    );
  }
}
