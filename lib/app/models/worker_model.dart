import 'package:freezed_annotation/freezed_annotation.dart';

part 'worker_model.freezed.dart';
part 'worker_model.g.dart';

@freezed
class UserModel with _$UserModel {
  factory UserModel({
    @JsonKey(name: 'name') required UserNameModel name,
    @JsonKey(name: 'picture') required UserPictureModel avatar,
    @JsonKey(name: 'location') required LocationModel location,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  const UserModel._();

  String get fullName =>
      '${name.title ?? ''} ${name.first ?? ''} ${name.last ?? ''}'.trim();

  String get avatarUrl =>
      avatar.large ?? avatar.medium ?? avatar.thumbnail ?? '';

  String get geo => '${location.city}, ${location.country}';
}

@freezed
class UserNameModel with _$UserNameModel {
  factory UserNameModel({String? first, String? last, String? title}) =
      _UserNameModel;

  factory UserNameModel.fromJson(Map<String, dynamic> json) =>
      _$UserNameModelFromJson(json);
}

@freezed
class UserPictureModel with _$UserPictureModel {
  factory UserPictureModel({String? large, String? medium, String? thumbnail}) =
      _UserPictureModel;

  factory UserPictureModel.fromJson(Map<String, dynamic> json) =>
      _$UserPictureModelFromJson(json);
}

@freezed
class LocationModel with _$LocationModel {
  factory LocationModel({
    @JsonKey(name: 'city') required String city,
    @JsonKey(name: 'country') required String country,
  }) = _LocationModel;

  factory LocationModel.fromJson(Map<String, dynamic> json) =>
      _$LocationModelFromJson(json);
}
