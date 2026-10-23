import 'package:board_service/board_session_persistent.dart';

const String kBoardUnsupportedMessage =
    "Panel login is not supported in this build";

class BoardResponse<T> {
  final int statusCode;
  final bool? ret;
  final T? data;

  const BoardResponse({required this.statusCode, this.ret, this.data});

  const BoardResponse.unsupported()
    : statusCode = 501,
      ret = false,
      data = null;

  String getFullMessage() => kBoardUnsupportedMessage;
}

class BoardClient {
  String baseUrl;
  final List<String> baseDomains;
  final String id;
  final BoardSessionPersistent persistent;
  String? proxyUrl;
  String userAgent = "";
  Duration timeout = const Duration(seconds: 30);

  BoardClient({
    required this.baseUrl,
    this.baseDomains = const [],
    required this.id,
    required this.persistent,
  });

  static bool validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return false;
    }
    return RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$').hasMatch(value);
  }

  static int getPasswordMinLen() => 8;

  Map<String, String>? getAuthHeaders() => null;

  Map<String, String>? getAuthCookies() => null;

  Map<String, String>? getAuthLocalStorage() => null;

  void setAccount(String account) {}

  void setAuthToken(String authData) {}

  void setHeadersAndCookiesForBot(
    Map<String, String> headers,
    List<String> cookies,
  ) {}

  Future<void> logout() async {}
}
