import 'package:dio/dio.dart';
import 'package:nittany_guide_frontend/common/components.dart';
import 'package:nittany_guide_frontend/common/constants.dart';
import 'package:nittany_guide_frontend/common/entities.dart';

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
      if (response.statusCode == 200) {
        AppComponents.showSnackBar("Upload succeeded.");
        return response.data['id'];
      } else {
        AppComponents.showSnackBar("Upload failed!");
      }
    } on DioException catch (e) {
      print(e);
    }
    return null;
  }

  static Future<Recommendation?> recommend(
      String id, String major, String campus, String query) async {
    try {
      final response =
          await dio.post(API_BASE_URL + RECOMMEND_API_ENDPOINT, data: {
        "id": id,
        "major": major,
        "campus": campus,
        "query": query,
      });
      if (response.statusCode == 200) {
        return Recommendation.fromJSON(response.data);
      } else {
        AppComponents.showSnackBar("Recommendation could not be generated!");
      }
    } on DioException catch (e) {
      print(e);
    }
    return null;
  }
}
