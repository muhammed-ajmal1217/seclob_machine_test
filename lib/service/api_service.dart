
import 'package:dio/dio.dart';
import 'package:seclob_task/model/data_model.dart';

class ApiService {
  Dio dio = Dio();
  static const apiUrl = 'https://rubidya.com/api/users/get-media';
  Future<List<DataModel>> getData() async {
    try {
      Response response = await dio.get(apiUrl,
          options: Options(headers: {
            'Authorization':
                'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI2NjBiZmUxODE3ZmYzZjBkMmZjMmQwNGUiLCJpYXQiOjE3MTQ3MTkyMDMsImV4cCI6MTc4MzgzOTIwM30.HfsYDcVEzMsdi6pU24IzHzmGAxfDQ2NAJYIptOAu_9I '
          }));
      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = response.data!;
        final List data = responseData['media'];
        return data.map((data) => DataModel.fromJson(data)).toList();
      } else {
        throw Exception('Satatus code error');
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
