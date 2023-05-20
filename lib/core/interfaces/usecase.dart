abstract class Usecase<T> {
  Future<T> execute([dynamic args]);
}
