import 'package:blog_app/core/error/exeptions.dart';
import 'package:blog_app/core/error/failures.dart';
import 'package:blog_app/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:blog_app/features/auth/domain/repository/auth_repository.dart';
import 'package:fpdart/fpdart.dart';

class AuthrepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;
  const AuthrepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, String>> loginWithEmailPassword(
      {required String email, required String password}) {
    // TODO: implement LoginWithEmailPassword
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, String>> signUpWithEmailPassword({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      final userId = await remoteDataSource.SignUpWithEmailPassword(
        name: name,
        email: email,
        password: password,
      );

      return right(userId);
    } on ServerExeption catch (e) {
      return left(Failure(e.message));
    }
  }
}
