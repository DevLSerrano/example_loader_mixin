import 'package:example_loader_mixin/class/async_class.dart';

extension AsyncLoader<T> on Future<T> {
  Future<T> asyncLoader() async {
    return await AsyncLoaderClass().callAsyncLoader(this);
  }
}

// extension GetAsyncLoader on get {
//   Future<T> showLoading<T>(Future<T> func) async {
//     return await AsyncLoaderClass().callAsyncLoader(func);
//   }
// }
