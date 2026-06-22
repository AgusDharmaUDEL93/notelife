// To parse this JSON data, do
//
//     final profileSupabaseDto = profileSupabaseDtoFromJson(jsonString);

import 'dart:convert';

import '../../../../domain/model/profile.dart';

ProfileSupabaseResponseDto profileSupabaseDtoFromJson(String str) =>
    ProfileSupabaseResponseDto.fromJson(json.decode(str));

String profileSupabaseDtoToJson(ProfileSupabaseResponseDto data) =>
    json.encode(data.toJson());

class ProfileSupabaseResponseDto {
  String? uid;
  String? name;
  String? email;

  ProfileSupabaseResponseDto({this.uid, this.name, this.email});

  factory ProfileSupabaseResponseDto.fromJson(Map<String, dynamic> json) =>
      ProfileSupabaseResponseDto(
        uid: json["uid"],
        name: json["name"],
        email: json["email"],
      );

  Map<String, dynamic> toJson() => {"uid": uid, "name": name, "email": email};
}

extension ProfileSupabaseDtoExtension on ProfileSupabaseResponseDto {
  Profile toDomain() {
    return Profile(uid: uid ?? "", name: name ?? '', email: email ?? '');
  }
}
