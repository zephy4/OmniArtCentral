import 'package:onmi_art_central/services/artist_service.dart';

class AuthDataSource {
  final BaseApiService _apiService = BaseApiService();

  Future<Map<String, dynamic>> registerUser(Map<String, dynamic> data) async {
    return await _apiService.post('/auth/signup', data);
  }
}