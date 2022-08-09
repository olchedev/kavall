// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'delivery_statistic_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$DeliveryStatisticStateTearOff {
  const _$DeliveryStatisticStateTearOff();

  _State call({List<Statistic>? statisticList}) {
    return _State(
      statisticList: statisticList,
    );
  }
}

/// @nodoc
const $DeliveryStatisticState = _$DeliveryStatisticStateTearOff();

/// @nodoc
mixin _$DeliveryStatisticState {
  List<Statistic>? get statisticList => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DeliveryStatisticStateCopyWith<DeliveryStatisticState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeliveryStatisticStateCopyWith<$Res> {
  factory $DeliveryStatisticStateCopyWith(DeliveryStatisticState value,
          $Res Function(DeliveryStatisticState) then) =
      _$DeliveryStatisticStateCopyWithImpl<$Res>;
  $Res call({List<Statistic>? statisticList});
}

/// @nodoc
class _$DeliveryStatisticStateCopyWithImpl<$Res>
    implements $DeliveryStatisticStateCopyWith<$Res> {
  _$DeliveryStatisticStateCopyWithImpl(this._value, this._then);

  final DeliveryStatisticState _value;
  // ignore: unused_field
  final $Res Function(DeliveryStatisticState) _then;

  @override
  $Res call({
    Object? statisticList = freezed,
  }) {
    return _then(_value.copyWith(
      statisticList: statisticList == freezed
          ? _value.statisticList
          : statisticList // ignore: cast_nullable_to_non_nullable
              as List<Statistic>?,
    ));
  }
}

/// @nodoc
abstract class _$StateCopyWith<$Res>
    implements $DeliveryStatisticStateCopyWith<$Res> {
  factory _$StateCopyWith(_State value, $Res Function(_State) then) =
      __$StateCopyWithImpl<$Res>;
  @override
  $Res call({List<Statistic>? statisticList});
}

/// @nodoc
class __$StateCopyWithImpl<$Res>
    extends _$DeliveryStatisticStateCopyWithImpl<$Res>
    implements _$StateCopyWith<$Res> {
  __$StateCopyWithImpl(_State _value, $Res Function(_State) _then)
      : super(_value, (v) => _then(v as _State));

  @override
  _State get _value => super._value as _State;

  @override
  $Res call({
    Object? statisticList = freezed,
  }) {
    return _then(_State(
      statisticList: statisticList == freezed
          ? _value.statisticList
          : statisticList // ignore: cast_nullable_to_non_nullable
              as List<Statistic>?,
    ));
  }
}

/// @nodoc

class _$_State implements _State {
  const _$_State({this.statisticList});

  @override
  final List<Statistic>? statisticList;

  @override
  String toString() {
    return 'DeliveryStatisticState(statisticList: $statisticList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _State &&
            (identical(other.statisticList, statisticList) ||
                const DeepCollectionEquality()
                    .equals(other.statisticList, statisticList)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(statisticList);

  @JsonKey(ignore: true)
  @override
  _$StateCopyWith<_State> get copyWith =>
      __$StateCopyWithImpl<_State>(this, _$identity);
}

abstract class _State implements DeliveryStatisticState {
  const factory _State({List<Statistic>? statisticList}) = _$_State;

  @override
  List<Statistic>? get statisticList => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$StateCopyWith<_State> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
class _$DeliveryStatisticEventTearOff {
  const _$DeliveryStatisticEventTearOff();

  _Init init() {
    return const _Init();
  }
}

/// @nodoc
const $DeliveryStatisticEvent = _$DeliveryStatisticEventTearOff();

/// @nodoc
mixin _$DeliveryStatisticEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeliveryStatisticEventCopyWith<$Res> {
  factory $DeliveryStatisticEventCopyWith(DeliveryStatisticEvent value,
          $Res Function(DeliveryStatisticEvent) then) =
      _$DeliveryStatisticEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$DeliveryStatisticEventCopyWithImpl<$Res>
    implements $DeliveryStatisticEventCopyWith<$Res> {
  _$DeliveryStatisticEventCopyWithImpl(this._value, this._then);

  final DeliveryStatisticEvent _value;
  // ignore: unused_field
  final $Res Function(DeliveryStatisticEvent) _then;
}

/// @nodoc
abstract class _$InitCopyWith<$Res> {
  factory _$InitCopyWith(_Init value, $Res Function(_Init) then) =
      __$InitCopyWithImpl<$Res>;
}

/// @nodoc
class __$InitCopyWithImpl<$Res>
    extends _$DeliveryStatisticEventCopyWithImpl<$Res>
    implements _$InitCopyWith<$Res> {
  __$InitCopyWithImpl(_Init _value, $Res Function(_Init) _then)
      : super(_value, (v) => _then(v as _Init));

  @override
  _Init get _value => super._value as _Init;
}

/// @nodoc

class _$_Init implements _Init {
  const _$_Init();

  @override
  String toString() {
    return 'DeliveryStatisticEvent.init()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _Init);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
  }) {
    return init();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
  }) {
    return init(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init(this);
    }
    return orElse();
  }
}

abstract class _Init implements DeliveryStatisticEvent {
  const factory _Init() = _$_Init;
}
