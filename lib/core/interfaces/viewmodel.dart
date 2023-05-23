import 'package:get/get.dart';

mixin ViewModel<T> {
  T onError(
    dynamic error,
    StackTrace stackTrace, {
    Function()? onError,
  }) {
    Get.snackbar(
      'Erro',
      'Ocorreu um erro interno. Por favor, tente novamente em alguns momentos.',
    );
    onError?.call();
    return Object() as T;
  }
}
