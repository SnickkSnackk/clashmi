import 'package:board_service/board_client.dart';

export 'package:board_service/board_client.dart' show BoardResponse;

class StringPair {
  final String item1;
  final String item2;

  StringPair(this.item1, this.item2);
}

class SSPanelUimClient extends BoardClient {
  SSPanelUimClient({
    required super.baseUrl,
    super.baseDomains,
    required super.id,
    required super.persistent,
  });

  static bool validateEmail(String? value) => BoardClient.validateEmail(value);

  static int getPasswordMinLen() => BoardClient.getPasswordMinLen();

  Future<BoardResponse<void>> login(String email, String password) async =>
      const BoardResponse.unsupported();

  Future<BoardResponse<StringPair>> getUserProfileUrlAndToken() async =>
      const BoardResponse.unsupported();
}
