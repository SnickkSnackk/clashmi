import 'package:board_service/board_client.dart';
import 'package:board_service/v2board/v2board_models.dart';

export 'package:board_service/board_client.dart' show BoardResponse;

class V2BoardClient extends BoardClient {
  V2BoardClient({
    required super.baseUrl,
    super.baseDomains,
    required super.id,
    required super.persistent,
  });

  static bool validateEmail(String? value) => BoardClient.validateEmail(value);

  static int getPasswordMinLen() => BoardClient.getPasswordMinLen();

  void setVersion(String version) {}

  Future<BoardResponse<void>> login(LoginRequest request) async =>
      const BoardResponse.unsupported();

  Future<BoardResponse<SubscribeData>> getSubscribe() async =>
      const BoardResponse.unsupported();
}
