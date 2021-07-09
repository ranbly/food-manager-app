// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'food.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Food _$FoodFromJson(Map<String, dynamic> json) {
  return _Food.fromJson(json);
}

/// @nodoc
class _$FoodTearOff {
  const _$FoodTearOff();

  _Food call(
      {required String id,
      required String name,
      required String author,
      required String refrigerator,
      required int count,
      @JsonKey(fromJson: dateTimeFromJson, toJson: dateTimeToJson)
          required DateTime expirationDate,
      required FoodCategory category}) {
    return _Food(
      id: id,
      name: name,
      author: author,
      refrigerator: refrigerator,
      count: count,
      expirationDate: expirationDate,
      category: category,
    );
  }

  Food fromJson(Map<String, Object> json) {
    return Food.fromJson(json);
  }
}

/// @nodoc
const $Food = _$FoodTearOff();

/// @nodoc
mixin _$Food {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get author => throw _privateConstructorUsedError;
  String get refrigerator => throw _privateConstructorUsedError;
  int get count => throw _privateConstructorUsedError;
  @JsonKey(fromJson: dateTimeFromJson, toJson: dateTimeToJson)
  DateTime get expirationDate => throw _privateConstructorUsedError;
  FoodCategory get category => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FoodCopyWith<Food> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FoodCopyWith<$Res> {
  factory $FoodCopyWith(Food value, $Res Function(Food) then) =
      _$FoodCopyWithImpl<$Res>;
  $Res call(
      {String id,
      String name,
      String author,
      String refrigerator,
      int count,
      @JsonKey(fromJson: dateTimeFromJson, toJson: dateTimeToJson)
          DateTime expirationDate,
      FoodCategory category});
}

/// @nodoc
class _$FoodCopyWithImpl<$Res> implements $FoodCopyWith<$Res> {
  _$FoodCopyWithImpl(this._value, this._then);

  final Food _value;
  // ignore: unused_field
  final $Res Function(Food) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? author = freezed,
    Object? refrigerator = freezed,
    Object? count = freezed,
    Object? expirationDate = freezed,
    Object? category = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      author: author == freezed
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as String,
      refrigerator: refrigerator == freezed
          ? _value.refrigerator
          : refrigerator // ignore: cast_nullable_to_non_nullable
              as String,
      count: count == freezed
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
      expirationDate: expirationDate == freezed
          ? _value.expirationDate
          : expirationDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      category: category == freezed
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as FoodCategory,
    ));
  }
}

/// @nodoc
abstract class _$FoodCopyWith<$Res> implements $FoodCopyWith<$Res> {
  factory _$FoodCopyWith(_Food value, $Res Function(_Food) then) =
      __$FoodCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      String name,
      String author,
      String refrigerator,
      int count,
      @JsonKey(fromJson: dateTimeFromJson, toJson: dateTimeToJson)
          DateTime expirationDate,
      FoodCategory category});
}

/// @nodoc
class __$FoodCopyWithImpl<$Res> extends _$FoodCopyWithImpl<$Res>
    implements _$FoodCopyWith<$Res> {
  __$FoodCopyWithImpl(_Food _value, $Res Function(_Food) _then)
      : super(_value, (v) => _then(v as _Food));

  @override
  _Food get _value => super._value as _Food;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? author = freezed,
    Object? refrigerator = freezed,
    Object? count = freezed,
    Object? expirationDate = freezed,
    Object? category = freezed,
  }) {
    return _then(_Food(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      author: author == freezed
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as String,
      refrigerator: refrigerator == freezed
          ? _value.refrigerator
          : refrigerator // ignore: cast_nullable_to_non_nullable
              as String,
      count: count == freezed
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
      expirationDate: expirationDate == freezed
          ? _value.expirationDate
          : expirationDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      category: category == freezed
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as FoodCategory,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_Food implements _Food {
  _$_Food(
      {required this.id,
      required this.name,
      required this.author,
      required this.refrigerator,
      required this.count,
      @JsonKey(fromJson: dateTimeFromJson, toJson: dateTimeToJson)
          required this.expirationDate,
      required this.category});

  factory _$_Food.fromJson(Map<String, dynamic> json) =>
      _$_$_FoodFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String author;
  @override
  final String refrigerator;
  @override
  final int count;
  @override
  @JsonKey(fromJson: dateTimeFromJson, toJson: dateTimeToJson)
  final DateTime expirationDate;
  @override
  final FoodCategory category;

  @override
  String toString() {
    return 'Food(id: $id, name: $name, author: $author, refrigerator: $refrigerator, count: $count, expirationDate: $expirationDate, category: $category)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Food &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.author, author) ||
                const DeepCollectionEquality().equals(other.author, author)) &&
            (identical(other.refrigerator, refrigerator) ||
                const DeepCollectionEquality()
                    .equals(other.refrigerator, refrigerator)) &&
            (identical(other.count, count) ||
                const DeepCollectionEquality().equals(other.count, count)) &&
            (identical(other.expirationDate, expirationDate) ||
                const DeepCollectionEquality()
                    .equals(other.expirationDate, expirationDate)) &&
            (identical(other.category, category) ||
                const DeepCollectionEquality()
                    .equals(other.category, category)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(author) ^
      const DeepCollectionEquality().hash(refrigerator) ^
      const DeepCollectionEquality().hash(count) ^
      const DeepCollectionEquality().hash(expirationDate) ^
      const DeepCollectionEquality().hash(category);

  @JsonKey(ignore: true)
  @override
  _$FoodCopyWith<_Food> get copyWith =>
      __$FoodCopyWithImpl<_Food>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_FoodToJson(this);
  }
}

abstract class _Food implements Food {
  factory _Food(
      {required String id,
      required String name,
      required String author,
      required String refrigerator,
      required int count,
      @JsonKey(fromJson: dateTimeFromJson, toJson: dateTimeToJson)
          required DateTime expirationDate,
      required FoodCategory category}) = _$_Food;

  factory _Food.fromJson(Map<String, dynamic> json) = _$_Food.fromJson;

  @override
  String get id => throw _privateConstructorUsedError;
  @override
  String get name => throw _privateConstructorUsedError;
  @override
  String get author => throw _privateConstructorUsedError;
  @override
  String get refrigerator => throw _privateConstructorUsedError;
  @override
  int get count => throw _privateConstructorUsedError;
  @override
  @JsonKey(fromJson: dateTimeFromJson, toJson: dateTimeToJson)
  DateTime get expirationDate => throw _privateConstructorUsedError;
  @override
  FoodCategory get category => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$FoodCopyWith<_Food> get copyWith => throw _privateConstructorUsedError;
}
