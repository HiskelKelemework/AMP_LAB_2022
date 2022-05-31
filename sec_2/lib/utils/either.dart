class Either<T> {
  final T? val;
  final String? error;

  Either({this.val, this.error});

  bool get hasError => error != null;
}
