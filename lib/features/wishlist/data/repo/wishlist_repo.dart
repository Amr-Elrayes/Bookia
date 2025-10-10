import 'dart:developer';

import 'package:bookia/features/wishlist/data/models/wishlistresponse/wishlistresponse.dart';
import 'package:bookia/services/dio/dio_endpoints.dart';
import 'package:bookia/services/dio/dio_provider.dart';
import 'package:bookia/services/local/shared_pref.dart';

class WishlistRepo {
  static Future<Wishlistresponse?> getWishlist() async {
    try {
      var res = await DioProvider.get(
        path: DioEndpoints.wishlist,
        headers: {"Authorization": "Bearer ${SharedPref.getUserData()?.token}"},
      );

      if (res.statusCode == 200) {
        return Wishlistresponse.fromJson(res.data);
      } else {
        return null;
      }
    } on Exception catch (e) {
      log(e.toString());
      return null;
    }
  }

  static Future<Wishlistresponse?> addToWishlist({required int productId}) async {
    try {
      var res = await DioProvider.post(
        endPoint: DioEndpoints.add_to_wishlist,
        headers: {"Authorization": "Bearer ${SharedPref.getUserData()?.token}"},
        data: {"product_id": productId},
      );

      if (res.statusCode == 200) {
        return Wishlistresponse.fromJson(res.data);
      } else {
        return null;
      }
    } on Exception catch (e) {
      log(e.toString());
      return null;
    }
  }

  static Future<Wishlistresponse?> removeFromtWishlist({required int productId}) async {
    try {
      var res = await DioProvider.post(
        endPoint: DioEndpoints.remove_from_wishlist,
        headers: {"Authorization": "Bearer ${SharedPref.getUserData()?.token}"},
        data: {"product_id": productId},
      );

      if (res.statusCode == 200) {
        return Wishlistresponse.fromJson(res.data);
      } else {
        return null;
      }
    } on Exception catch (e) {
      log(e.toString());
      return null;
    }
  }
}
