// failure.dart
abstract class Failure {
  final String message;

  Failure(this.message);
}

class NetworkFailure extends Failure {
  NetworkFailure(super.message);
}

class EmptyDataFailure extends Failure {
  EmptyDataFailure(super.message);
}

class DBInsertFailed extends Failure {
  DBInsertFailed(super.message);
}

class DBFailure extends Failure {
  DBFailure(super.message);
}

class DBDeleteFailed extends Failure {
  DBDeleteFailed(super.message);
}
