// To parse this JSON data, do
//
//     final nameSupabaseRequestDto = nameSupabaseRequestDtoFromJson(jsonString);

import 'dart:convert';

NameSupabaseRequestDto nameSupabaseRequestDtoFromJson(String str) =>
    NameSupabaseRequestDto.fromJson(json.decode(str));

String nameSupabaseRequestDtoToJson(NameSupabaseRequestDto data) =>
    json.encode(data.toJson());

class NameSupabaseRequestDto {
  String? name;

  NameSupabaseRequestDto({this.name});

  factory NameSupabaseRequestDto.fromJson(Map<String, dynamic> json) =>
      NameSupabaseRequestDto(name: json["name"]);

  Map<String, dynamic> toJson() => {"name": name};
}
