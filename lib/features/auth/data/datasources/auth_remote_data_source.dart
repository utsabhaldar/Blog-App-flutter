import 'package:blog_app/core/error/exeptions.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract interface class AuthRemoteDataSource {
  Future<String> SignUpWithEmailPassword({
    required String name,
    required String email,
    required String password,
  });
  Future<String> LoginWithEmailPassword({
    required String email,
    required String password,
  });
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final SupabaseClient supabaseClient;
  AuthRemoteDataSourceImpl(this.supabaseClient);

  @override
  Future<String> LoginWithEmailPassword({
    required String email,
    required String password,
  }) {
    // TODO: implement LoginWithEmailPassword
    throw UnimplementedError();
  }

  @override
  Future<String> SignUpWithEmailPassword({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      final response = await supabaseClient.auth.signUp(
        password: password,
        email: email,
        data: {
          'name': name,
        },
      );
      if (response.user == null) {
        throw const ServerExeption('User is null!');
      }

      return response.user!.id;
    } catch (e) {
      throw ServerExeption(e.toString());
    }
  }
}
