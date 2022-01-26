import 'package:example_loader_mixin/class/async_class.dart';

mixin AsyncLoaderMixin<T> {
  final _myClass = AsyncLoaderClass();

  Future<T> callAsyncLoader(Future<T> futureFunction) async {
    return await _myClass.callAsyncLoader(futureFunction);
  }
}
