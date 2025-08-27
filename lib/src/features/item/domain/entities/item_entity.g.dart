// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ItemEntity _$ItemEntityFromJson(Map<String, dynamic> json) => _ItemEntity(
  name: json['name'] as String,
  brand: json['brand'] as String,
  category: json['category'] as String,
  subCategory: json['subCategory'] as String,
);

Map<String, dynamic> _$ItemEntityToJson(_ItemEntity instance) =>
    <String, dynamic>{
      'name': instance.name,
      'brand': instance.brand,
      'category': instance.category,
      'subCategory': instance.subCategory,
    };
