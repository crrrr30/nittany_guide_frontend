import 'dart:core';

import 'package:get/get.dart' hide FormData, MultipartFile;
import 'package:dio/dio.dart';
import 'package:nittany_guide_frontend/common/constants.dart';

class HttpService {
  static final dio = Dio(BaseOptions(validateStatus: (status) => true));

  static Future<void> uploadFile(
      List<int> bytes, void Function(int, int) onSendProgress) async {
    dio.options.headers['Access-Control-Allow-Origin'] = '*';
    dio.options.headers['Access-Control-Allow-Methods'] = '*';
    dio.options.headers['Access-Control-Request-Headers'] =
        'origin, x-requested-with';
    try {
      final formData =
          FormData.fromMap({"what-if": MultipartFile.fromBytes(bytes)});
      final response = await dio.post(API_BASE_URL + UPLOAD_API_ENDPOINT,
          data: formData,
          onSendProgress: (count, total) => print("$count / $total}"));
      if (response.statusCode == 200) {
        print(response.data);
        return;
      } else {
        return;
      }
    } on DioException catch (e) {
      print(e);
      return;
    }
  }
}
