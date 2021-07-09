// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'refrigerator.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Refrigerator _$RefrigeratorFromJson(Map<String, dynamic> json) {
  return _Refrigerator.fromJson(json);
}

/// @nodoc
class _$RefrigeratorTearOff {
  const _$RefrigeratorTearOff();

  _Refrigerator call(
      {required String id,
      required String name,
      required List<String> users,
      required String author}) {
    return _Refrigerator(
      id: id,
      name: name,
      users: users,
      author: author,
    );
  }

  Refrigerator fromJson(Map<String, Object> json) {
    return Refrigerator.fromJson(json);
  }
}

/// @nodoc
const $Refrigerator = _$RefrigeratorTearOff();

/// @nodoc
mixin _$Refrigerator {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  List<String> get users => throw _privateConstructorUsedError;
  String get author => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RefrigeratorCopyWith<Refrigerator> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RefrigeratorCopyWith<$Res> {
  factory $RefrigeratorCopyWith(
          Refrigerator value, $Res Function(Refrigerator) then) =
      _$RefrigeratorCopyWithImpl<$Res>;
  $Res call({String id, String name, List<String> users, String author});
}

/// @nodoc
class _$RefrigeratorCopyWithImpl<$Res> implements $RefrigeratorCopyWith<$Res> {
  _$RefrigeratorCopyWithImpl(this._value, this._then);

  final Refrigerator _value;
  // ignore: unused_field
  final $Res Function(Refrigerator) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? users = freezed,
    Object? author = freezed,
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
      users: users == freezed
          ? _value.users
          : users // ignore: cast_nullable_to_non_nullable
              as List<String>,
      author: author == freezed
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$RefrigeratorCopyWith<$Res>
    implements $RefrigeratorCopyWith<$Res> {
  factory _$RefrigeratorCopyWith(
          _Refrigerator value, $Res Function(_Refrigerator) then) =
      __$RefrigeratorCopyWithImpl<$Res>;
  @override
  $Res call({String id, String name, List<String> users, String author});
}

/// @nodoc
class __$RefrigeratorCopyWithImpl<$Res> extends _$RefrigeratorCopyWithImpl<$Res>
    implements _$RefrigeratorCopyWith<$Res> {
  __$RefrigeratorCopyWithImpl(
      _Refrigerator _value, $Res Function(_Refrigerator) _then)
      : super(_value, (v) => _then(v as _Refrigerator));

  @override
  _Refrigerator get _value => super._value as _Refrigerator;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? users = freezed,
    Object? author = freezed,
  }) {
    return _then(_Refrigerator(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      users: users == freezed
          ? _value.users
          : users // ignore: cast_nullable_to_non_nullable
              as List<String>,
      author: author == freezed
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_Refrigerator implements _Refrigerator {
  _$_Refrigerator(
      {required this.id,
      required this.name,
      required this.users,
      required this.author});

  factory _$_Refrigerator.fromJson(Map<String, dynamic> json) =>
      _$_$_RefrigeratorFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final List<String> users;
  @override
  final String author;

  @override
  String toString() {
    return 'Refrigerator(id: $id, name: $name, users: $users, author: $author)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Refrigerator &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.users, users) ||
                const DeepCollectionEquality().equals(other.users, users)) &&
            (identical(other.author, author) ||
                const DeepCollectionEquality().equals(other.author, author)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(users) ^
      const DeepCollectionEquality().hash(author);

  @JsonKey(ignore: true)
  @override
  _$RefrigeratorCopyWith<_Refrigerator> get copyWith =>
      __$RefrigeratorCopyWithImpl<_Refrigerator>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_RefrigeratorToJson(this);
  }
}

abstract class _Refrigerator implements Refrigerator {
  factory _Refrigerator(
      {required String id,
      required String name,
      required List<String> users,
      required String author}) = _$_Refrigerator;

  factory _Refrigerator.fromJson(Map<String, dynamic> json) =
      _$_Refrigerator.fromJson;

  @override
  String get id => throw _privateConstructorUsedError;
  @override
  String get name => throw _privateConstructorUsedError;
  @override
  List<String> get users => throw _privateConstructorUsedError;
  @override
  String get author => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$RefrigeratorCopyWith<_Refrigerator> get copyWith =>
      throw _privateConstructorUsedError;
}
