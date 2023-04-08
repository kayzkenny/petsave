import 'package:json_annotation/json_annotation.dart';

part 'auth_response_rm.g.dart';

@JsonSerializable(createToJson: false)
class AuthResponseRM {
  AuthResponseRM({
    this.tokenType,
    this.expiresIn,
    this.accessToken,
  });

  @JsonKey(name: 'token_type')
  final String? tokenType;
  @JsonKey(name: 'expires_in')
  final int? expiresIn;
  @JsonKey(name: 'access_token')
  final String? accessToken;

  static const fromJson = _$AuthResponseRMFromJson;
}
