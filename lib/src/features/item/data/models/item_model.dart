import 'package:equatable/equatable.dart';
import 'dart:convert';
import 'package:store_service_app/src/features/item/domain/entities/item_entity.dart';

ItemModel itemModelFromJson(String str) => ItemModel.fromJson(json.decode(str));

String itemModelToJson(ItemModel data) => json.encode(data.toJson());

List<ItemModel> itemModelListFromJson(String str) => List<ItemModel>.from(json.decode(str).map((x) => ItemModel.fromJson(x)));

String itemModelListToJson(List<ItemModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ItemModel extends Equatable {
  final String? id;
  final String? name;
  final String? brand;
  final String? category;
  final String? subCategory;

  const ItemModel({this.id, this.name, this.brand, this.category, this.subCategory});

  factory ItemModel.fromJson(Map<String, dynamic> json) {
    return ItemModel(id: json['id'], name: json['name'], brand: json['brand'], category: json['category'], subCategory: json['subCategory']);
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'name': name, 'brand': brand, 'category': category, 'subCategory': subCategory};
  }

  @override
  List<Object?> get props => [id, name, brand, category, subCategory];

  ItemEntity toEntity() {
    return ItemEntity(name: name ?? '', brand: brand ?? '', category: category ?? '', subCategory: subCategory ?? '');
  }
}

extension ItemModelListExtension on List<ItemModel> {
  List<ItemEntity> toEntity() {
    return map((item) => item.toEntity()).toList();
  }
}
