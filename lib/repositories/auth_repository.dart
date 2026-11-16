import 'package:onmi_art_central/data/data_source.dart';
import 'package:onmi_art_central/models/auth_model/request_register_model.dart';
import 'package:onmi_art_central/utill/api_exception.dart';


class AuthRepository {
  final AuthDataSource _dataSource = AuthDataSource();

  Future<void> registerUser(RequestRegisterModel user) async {
    try {
      final response = await _dataSource.registerUser(user.toJson());
      if (response['success'] != true) {
        throw ApiException(response['message'] ?? 'Registration failed.');
      }
    } on ApiException catch (e) {
      throw ApiException(e.message);
    } catch (e) {
      throw ApiException('Failed to connect to the server.');
    }
  }
}