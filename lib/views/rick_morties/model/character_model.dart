import 'package:json_annotation/json_annotation.dart';
import 'package:rick_and_morty/core/model/base_model.dart';
part 'character_model.g.dart';

@JsonSerializable()
class CharacterModel {
  CharacterModel({
    this.id,
    this.name,
    this.status,
    this.species,
    this.type,
    this.gender,
    this.image,
    this.episode,
    this.url,
    this.created,
  });

  int? id;
  String? name;
  String? status;
  String? species;
  String? type;
  String? gender;

  String? image;
  String? episode;
  String? url;
  String? created;

  factory CharacterModel.fromJson(Map<String, dynamic> json) {
    return _$CharacterModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$CharacterModelToJson(this);
  }
}
@JsonSerializable()
class BaseResponseCharacter extends BaseResponseModel {
  List<CharacterModel>? results;
  BaseResponseCharacter({this.results});

  factory BaseResponseCharacter.fromJson(Map<String, dynamic> json) {
    return _$BaseResponseCharacterFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$BaseResponseCharacterToJson(this);
  }
}
