import 'dart:developer';

import 'package:bookia/features/auth/data/models/auth_params.dart';
import 'package:bookia/features/auth/data/models/auth_response/auth_response.dart';
import 'package:bookia/services/dio/dio_endpoints.dart';
import 'package:bookia/services/dio/dio_provider.dart';

class AuthRepo {
  static Future<AuthResponse?> register(AuthParams params) async {
    try {
      var res = await DioProvider.post(
        endPoint: DioEndpoints.register,
        data: params.toJson(),
      );

      if (res.statusCode == 201) {
        var body = res.data;

        return AuthResponse.fromJson(body);
      } else {
        return null;
      }
    } on Exception catch (e) {
      log(e.toString());
      return null;
    }
  }

  static Future<AuthResponse?> login(AuthParams params) async {
    try {
      var res = await DioProvider.post(
        endPoint: DioEndpoints.login,
        data: params.toJson(),
      );

      if (res.statusCode == 200) {
        var body = res.data;

        return AuthResponse.fromJson(body);
      } else {
        return null;
      }
    } on Exception catch (e) {
      log(e.toString());
      return null;
    }
  }
}
