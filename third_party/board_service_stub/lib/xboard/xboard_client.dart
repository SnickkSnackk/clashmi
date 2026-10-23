import 'package:board_service/board_client.dart';
import 'package:board_service/xboard/xboard_models.dart';

export 'package:board_service/board_client.dart' show BoardResponse;

class XboardClient extends BoardClient {
  XboardClient({
    required super.baseUrl,
    super.baseDomains,
    required super.id,
    required super.persistent,
  });

  static bool validateEmail(String? value) => BoardClient.validateEmail(value);

  static int getPasswordMinLen() => BoardClient.getPasswordMinLen();

  Future<BoardResponse<void>> login(LoginRequest request) async =>
      const BoardResponse.unsupported();

  Future<BoardResponse<SubscribeData>> getSubscribe() async =>
      const BoardResponse.unsupported();
}
