// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'item_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ItemEntity {

 String get name; String get brand; String get category; String get subCategory;
/// Create a copy of ItemEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ItemEntityCopyWith<ItemEntity> get copyWith => _$ItemEntityCopyWithImpl<ItemEntity>(this as ItemEntity, _$identity);

  /// Serializes this ItemEntity to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ItemEntity&&(identical(other.name, name) || other.name == name)&&(identical(other.brand, brand) || other.brand == brand)&&(identical(other.category, category) || other.category == category)&&(identical(other.subCategory, subCategory) || other.subCategory == subCategory));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,brand,category,subCategory);

@override
String toString() {
  return 'ItemEntity(name: $name, brand: $brand, category: $category, subCategory: $subCategory)';
}


}

/// @nodoc
abstract mixin class $ItemEntityCopyWith<$Res>  {
  factory $ItemEntityCopyWith(ItemEntity value, $Res Function(ItemEntity) _then) = _$ItemEntityCopyWithImpl;
@useResult
$Res call({
 String name, String brand, String category, String subCategory
});




}
/// @nodoc
class _$ItemEntityCopyWithImpl<$Res>
    implements $ItemEntityCopyWith<$Res> {
  _$ItemEntityCopyWithImpl(this._self, this._then);

  final ItemEntity _self;
  final $Res Function(ItemEntity) _then;

/// Create a copy of ItemEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? brand = null,Object? category = null,Object? subCategory = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,brand: null == brand ? _self.brand : brand // ignore: cast_nullable_to_non_nullable
as String,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,subCategory: null == subCategory ? _self.subCategory : subCategory // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ItemEntity].
extension ItemEntityPatterns on ItemEntity {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ItemEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ItemEntity() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ItemEntity value)  $default,){
final _that = this;
switch (_that) {
case _ItemEntity():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ItemEntity value)?  $default,){
final _that = this;
switch (_that) {
case _ItemEntity() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  String brand,  String category,  String subCategory)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ItemEntity() when $default != null:
return $default(_that.name,_that.brand,_that.category,_that.subCategory);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  String brand,  String category,  String subCategory)  $default,) {final _that = this;
switch (_that) {
case _ItemEntity():
return $default(_that.name,_that.brand,_that.category,_that.subCategory);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  String brand,  String category,  String subCategory)?  $default,) {final _that = this;
switch (_that) {
case _ItemEntity() when $default != null:
return $default(_that.name,_that.brand,_that.category,_that.subCategory);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ItemEntity implements ItemEntity {
  const _ItemEntity({required this.name, required this.brand, required this.category, required this.subCategory});
  factory _ItemEntity.fromJson(Map<String, dynamic> json) => _$ItemEntityFromJson(json);

@override final  String name;
@override final  String brand;
@override final  String category;
@override final  String subCategory;

/// Create a copy of ItemEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ItemEntityCopyWith<_ItemEntity> get copyWith => __$ItemEntityCopyWithImpl<_ItemEntity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ItemEntityToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ItemEntity&&(identical(other.name, name) || other.name == name)&&(identical(other.brand, brand) || other.brand == brand)&&(identical(other.category, category) || other.category == category)&&(identical(other.subCategory, subCategory) || other.subCategory == subCategory));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,brand,category,subCategory);

@override
String toString() {
  return 'ItemEntity(name: $name, brand: $brand, category: $category, subCategory: $subCategory)';
}


}

/// @nodoc
abstract mixin class _$ItemEntityCopyWith<$Res> implements $ItemEntityCopyWith<$Res> {
  factory _$ItemEntityCopyWith(_ItemEntity value, $Res Function(_ItemEntity) _then) = __$ItemEntityCopyWithImpl;
@override @useResult
$Res call({
 String name, String brand, String category, String subCategory
});




}
/// @nodoc
class __$ItemEntityCopyWithImpl<$Res>
    implements _$ItemEntityCopyWith<$Res> {
  __$ItemEntityCopyWithImpl(this._self, this._then);

  final _ItemEntity _self;
  final $Res Function(_ItemEntity) _then;

/// Create a copy of ItemEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? brand = null,Object? category = null,Object? subCategory = null,}) {
  return _then(_ItemEntity(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,brand: null == brand ? _self.brand : brand // ignore: cast_nullable_to_non_nullable
as String,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,subCategory: null == subCategory ? _self.subCategory : subCategory // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
