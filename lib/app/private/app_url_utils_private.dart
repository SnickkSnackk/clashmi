// Open source replacement for the private file of the official build. It has
// no signing key and no private service endpoints: the services that need them
// (board provider lookup and notices, subscription download through the
// provider proxy) report an error instead.
import 'package:tuple/tuple.dart';

abstract final class AppUrlUtilsPrivate {
  static String signQueryParams(
    String version,
    String bodyLen,
    Map<String, dynamic> params,
  ) {
    return signQueryParams2(version, params, bodyLen: bodyLen);
  }

  static String signQueryParams2(
    String version,
    Map<String, dynamic> params, {
    String bodyLen = "0",
  }) {
    final values = <String, String>{
      'version': version,
      'body_len': bodyLen,
      for (final entry in params.entries) entry.key: entry.value.toString(),
    };
    final keys = values.keys.toList()..sort();
    return keys.map((key) => '$key=${values[key] ?? ''}').join('&');
  }
}

// (url, backup url, body). An empty url makes the request fail.
const Tuple3<String, String, String> _unavailable = Tuple3("", "", "");

abstract final class BoardProviderPrivate {
  static Tuple3<String, String, String> getBycodeUrlAndBody({
    required String app,
    required String version,
    required String did,
    required String code,
  }) => _unavailable;

  static Tuple3<String, String, String> getNotifyIntegrationUrlAndBody({
    required String app,
    required String version,
    required String did,
    required String url,
    required String type,
  }) => _unavailable;

  static Tuple3<String, String, String> getNoticePushUrlAndBody({
    required String app,
    required String version,
    required String did,
    required String pid,
  }) => _unavailable;
}

abstract final class ProfileProxyProviderPrivate {
  static Tuple3<String, String, String> getProviderProxyUrlAndBody({
    required String app,
    required String version,
    required String did,
    required String boardProviderId,
    required String url,
    required String userAgent,
    required Map<String, String> xhwidHeaders,
  }) => _unavailable;
}
