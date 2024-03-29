// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'quiz_score_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$QuizScoreState {
  int get score => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int score) initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int score)? initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int score)? initial,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_$InitialScoreState value) initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_$InitialScoreState value)? initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_$InitialScoreState value)? initial,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $QuizScoreStateCopyWith<QuizScoreState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuizScoreStateCopyWith<$Res> {
  factory $QuizScoreStateCopyWith(
          QuizScoreState value, $Res Function(QuizScoreState) then) =
      _$QuizScoreStateCopyWithImpl<$Res, QuizScoreState>;
  @useResult
  $Res call({int score});
}

/// @nodoc
class _$QuizScoreStateCopyWithImpl<$Res, $Val extends QuizScoreState>
    implements $QuizScoreStateCopyWith<$Res> {
  _$QuizScoreStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? score = null,
  }) {
    return _then(_value.copyWith(
      score: null == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$$InitialScoreStateImplCopyWith<$Res>
    implements $QuizScoreStateCopyWith<$Res> {
  factory _$$$InitialScoreStateImplCopyWith(_$$InitialScoreStateImpl value,
          $Res Function(_$$InitialScoreStateImpl) then) =
      __$$$InitialScoreStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int score});
}

/// @nodoc
class __$$$InitialScoreStateImplCopyWithImpl<$Res>
    extends _$QuizScoreStateCopyWithImpl<$Res, _$$InitialScoreStateImpl>
    implements _$$$InitialScoreStateImplCopyWith<$Res> {
  __$$$InitialScoreStateImplCopyWithImpl(_$$InitialScoreStateImpl _value,
      $Res Function(_$$InitialScoreStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? score = null,
  }) {
    return _then(_$$InitialScoreStateImpl(
      score: null == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$$InitialScoreStateImpl extends _$InitialScoreState {
  _$$InitialScoreStateImpl({this.score = 0}) : super._();

  @override
  @JsonKey()
  final int score;

  @override
  String toString() {
    return 'QuizScoreState.initial(score: $score)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$$InitialScoreStateImpl &&
            (identical(other.score, score) || other.score == score));
  }

  @override
  int get hashCode => Object.hash(runtimeType, score);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$$InitialScoreStateImplCopyWith<_$$InitialScoreStateImpl> get copyWith =>
      __$$$InitialScoreStateImplCopyWithImpl<_$$InitialScoreStateImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int score) initial,
  }) {
    return initial(score);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int score)? initial,
  }) {
    return initial?.call(score);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int score)? initial,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(score);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_$InitialScoreState value) initial,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_$InitialScoreState value)? initial,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_$InitialScoreState value)? initial,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _$InitialScoreState extends QuizScoreState {
  factory _$InitialScoreState({final int score}) = _$$InitialScoreStateImpl;
  _$InitialScoreState._() : super._();

  @override
  int get score;
  @override
  @JsonKey(ignore: true)
  _$$$InitialScoreStateImplCopyWith<_$$InitialScoreStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$QuizScoreEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() increment,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? increment,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? increment,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_IncrementScoreEvent value) increment,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_IncrementScoreEvent value)? increment,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_IncrementScoreEvent value)? increment,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuizScoreEventCopyWith<$Res> {
  factory $QuizScoreEventCopyWith(
          QuizScoreEvent value, $Res Function(QuizScoreEvent) then) =
      _$QuizScoreEventCopyWithImpl<$Res, QuizScoreEvent>;
}

/// @nodoc
class _$QuizScoreEventCopyWithImpl<$Res, $Val extends QuizScoreEvent>
    implements $QuizScoreEventCopyWith<$Res> {
  _$QuizScoreEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$IncrementScoreEventImplCopyWith<$Res> {
  factory _$$IncrementScoreEventImplCopyWith(_$IncrementScoreEventImpl value,
          $Res Function(_$IncrementScoreEventImpl) then) =
      __$$IncrementScoreEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$IncrementScoreEventImplCopyWithImpl<$Res>
    extends _$QuizScoreEventCopyWithImpl<$Res, _$IncrementScoreEventImpl>
    implements _$$IncrementScoreEventImplCopyWith<$Res> {
  __$$IncrementScoreEventImplCopyWithImpl(_$IncrementScoreEventImpl _value,
      $Res Function(_$IncrementScoreEventImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$IncrementScoreEventImpl implements _IncrementScoreEvent {
  const _$IncrementScoreEventImpl();

  @override
  String toString() {
    return 'QuizScoreEvent.increment()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IncrementScoreEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() increment,
  }) {
    return increment();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? increment,
  }) {
    return increment?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? increment,
    required TResult orElse(),
  }) {
    if (increment != null) {
      return increment();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_IncrementScoreEvent value) increment,
  }) {
    return increment(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_IncrementScoreEvent value)? increment,
  }) {
    return increment?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_IncrementScoreEvent value)? increment,
    required TResult orElse(),
  }) {
    if (increment != null) {
      return increment(this);
    }
    return orElse();
  }
}

abstract class _IncrementScoreEvent implements QuizScoreEvent {
  const factory _IncrementScoreEvent() = _$IncrementScoreEventImpl;
}
