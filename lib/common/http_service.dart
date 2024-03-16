import 'dart:io';
import 'dart:core';

import 'package:get/get.dart' hide FormData, MultipartFile;
import 'package:dio/dio.dart';
import 'package:nittany_guide_frontend/common/constants.dart';

class HttpService {
  static final dio = Dio(BaseOptions(validateStatus: (status) => true));

  static Future<String?> uploadFile(
      List<int> bytes, void Function(int, int) onSendProgress) async {
    try {
      final formData =
          FormData.fromMap({"what-if": MultipartFile.fromBytes(bytes)});
      final response = await dio.post(API_BASE_URL + UPLOAD_API_ENDPOINT,
          data: formData,
          onSendProgress: (count, total) => print("$count / $total}"));
      if (response.statusCode == 200 &&
          (response.data as Map<String, dynamic>).keys.contains('status') &&
          response.data['status'] == true &&
          (response.data as Map<String, dynamic>).keys.contains('data')) {
        return response.data['data']['uri'];
      } else {
        return null;
      }
    } on DioException {
      return null;
    }
  }
}
