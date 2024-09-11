// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GameImpl _$$GameImplFromJson(Map<String, dynamic> json) => _$GameImpl(
      id: (json['id'] as num?)?.toInt(),
      title: json['title'] as String?,
      thumbnail: json['thumbnail'] as String?,
      shortDescription: json['short_description'] as String?,
      gameUrl: json['game_url'] as String?,
      genre: json['genre'] as String?,
      platform: json['platform'] as String?,
      publisher: json['publisher'] as String?,
      developer: json['developer'] as String?,
      releaseDate: json['release_date'] as String?,
      freetogameProfileUrl: json['freetogame_profile_url'] as String?,
    );

Map<String, dynamic> _$$GameImplToJson(_$GameImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'thumbnail': instance.thumbnail,
      'shortDescription': instance.shortDescription,
      'gameUrl': instance.gameUrl,
      'genre': instance.genre,
      'platform': instance.platform,
      'publisher': instance.publisher,
      'developer': instance.developer,
      'releaseDate': instance.releaseDate,
      'freetogameProfileUrl': instance.freetogameProfileUrl,
    };
