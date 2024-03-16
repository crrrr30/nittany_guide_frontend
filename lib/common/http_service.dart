import 'dart:io';
import 'dart:core';

import 'package:flutter/material.dart';
import 'package:get/get.dart' hide FormData, MultipartFile;
import 'package:dio/dio.dart';

class HttpService {
  static final dio = Dio(BaseOptions(validateStatus: (status) => true));

  // static Future<({bool success})> updateProfile(UserProfile profile) async {
  //   dio.options.headers['Authorization'] = await UserProfile.token;
  //   try {
  //     final response = await dio.post(
  //       API_BASE_URL + UPDATE_PROFILE_API_ENDPOINT,
  //       data: profile.toJSON(),
  //     );

  //     if (response.statusCode == 200) {
  //       Globals.connected = true;
  //       debugPrint("Response: ${response.data}");
  //       return (success: true);
  //     } else if (response.statusCode == 400) {
  //       debugPrint("Serialization error");
  //       return (success: false);
  //     } else if (response.statusCode == 500 || response.statusCode == 502) {
  //       Globals.connected = false;
  //       debugPrint("Server down");
  //       return (success: false);
  //     }
  //     Globals.connected = false;
  //     debugPrint("updatePreferences failed with code ${response.statusCode}");
  //     return (success: false);
  //   } on DioException catch (e) {
  //     Globals.connected = false;
  //     debugPrint("DioException with error $e");
  //     return (success: false);
  //   }
  // }
}
