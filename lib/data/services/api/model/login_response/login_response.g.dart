// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_loginResponse _$loginResponseFromJson(Map<String, dynamic> json) =>
    _loginResponse(
      token: json['token'] as String,
      userId: json['userId'] as String,
    );

Map<String, dynamic> _$loginResponseToJson(_loginResponse instance) =>
    <String, dynamic>{'token': instance.token, 'userId': instance.userId};
