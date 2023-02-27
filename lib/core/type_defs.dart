//fpdart lib is used to return two data
import 'package:fpdart/fpdart.dart';
import 'package:tweetverse/core/failure.dart';

// Failure and Sucess are classes located in this folder
typedef FutureEither<T> = Future<Either<Failure, T>>;
typedef FutureEitherVoid = FutureEither<void>;
