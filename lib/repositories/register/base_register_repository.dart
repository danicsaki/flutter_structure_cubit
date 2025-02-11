abstract class BaseRegisterRepository {
  Future<dynamic> register(
      String phone, String fullname, String email, String password) async {}
}
