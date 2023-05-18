import 'package:retrofit/retrofit.dart';

abstract class RepositoryPath<T> {
  Future<T> get(@Path() String arg);
}
