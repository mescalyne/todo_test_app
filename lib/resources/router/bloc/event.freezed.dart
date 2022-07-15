// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$RouterEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() pop,
    required TResult Function() toHome,
    required TResult Function() toCreate,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? pop,
    TResult Function()? toHome,
    TResult Function()? toCreate,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? pop,
    TResult Function()? toHome,
    TResult Function()? toCreate,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OnPop value) pop,
    required TResult Function(ToHome value) toHome,
    required TResult Function(ToCreate value) toCreate,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(OnPop value)? pop,
    TResult Function(ToHome value)? toHome,
    TResult Function(ToCreate value)? toCreate,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OnPop value)? pop,
    TResult Function(ToHome value)? toHome,
    TResult Function(ToCreate value)? toCreate,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RouterEventCopyWith<$Res> {
  factory $RouterEventCopyWith(
          RouterEvent value, $Res Function(RouterEvent) then) =
      _$RouterEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$RouterEventCopyWithImpl<$Res> implements $RouterEventCopyWith<$Res> {
  _$RouterEventCopyWithImpl(this._value, this._then);

  final RouterEvent _value;
  // ignore: unused_field
  final $Res Function(RouterEvent) _then;
}

/// @nodoc
abstract class _$$OnPopCopyWith<$Res> {
  factory _$$OnPopCopyWith(_$OnPop value, $Res Function(_$OnPop) then) =
      __$$OnPopCopyWithImpl<$Res>;
}

/// @nodoc
class __$$OnPopCopyWithImpl<$Res> extends _$RouterEventCopyWithImpl<$Res>
    implements _$$OnPopCopyWith<$Res> {
  __$$OnPopCopyWithImpl(_$OnPop _value, $Res Function(_$OnPop) _then)
      : super(_value, (v) => _then(v as _$OnPop));

  @override
  _$OnPop get _value => super._value as _$OnPop;
}

/// @nodoc

class _$OnPop with DiagnosticableTreeMixin implements OnPop {
  const _$OnPop();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'RouterEvent.pop()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'RouterEvent.pop'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$OnPop);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() pop,
    required TResult Function() toHome,
    required TResult Function() toCreate,
  }) {
    return pop();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? pop,
    TResult Function()? toHome,
    TResult Function()? toCreate,
  }) {
    return pop?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? pop,
    TResult Function()? toHome,
    TResult Function()? toCreate,
    required TResult orElse(),
  }) {
    if (pop != null) {
      return pop();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OnPop value) pop,
    required TResult Function(ToHome value) toHome,
    required TResult Function(ToCreate value) toCreate,
  }) {
    return pop(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(OnPop value)? pop,
    TResult Function(ToHome value)? toHome,
    TResult Function(ToCreate value)? toCreate,
  }) {
    return pop?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OnPop value)? pop,
    TResult Function(ToHome value)? toHome,
    TResult Function(ToCreate value)? toCreate,
    required TResult orElse(),
  }) {
    if (pop != null) {
      return pop(this);
    }
    return orElse();
  }
}

abstract class OnPop implements RouterEvent {
  const factory OnPop() = _$OnPop;
}

/// @nodoc
abstract class _$$ToHomeCopyWith<$Res> {
  factory _$$ToHomeCopyWith(_$ToHome value, $Res Function(_$ToHome) then) =
      __$$ToHomeCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ToHomeCopyWithImpl<$Res> extends _$RouterEventCopyWithImpl<$Res>
    implements _$$ToHomeCopyWith<$Res> {
  __$$ToHomeCopyWithImpl(_$ToHome _value, $Res Function(_$ToHome) _then)
      : super(_value, (v) => _then(v as _$ToHome));

  @override
  _$ToHome get _value => super._value as _$ToHome;
}

/// @nodoc

class _$ToHome with DiagnosticableTreeMixin implements ToHome {
  const _$ToHome();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'RouterEvent.toHome()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'RouterEvent.toHome'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ToHome);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() pop,
    required TResult Function() toHome,
    required TResult Function() toCreate,
  }) {
    return toHome();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? pop,
    TResult Function()? toHome,
    TResult Function()? toCreate,
  }) {
    return toHome?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? pop,
    TResult Function()? toHome,
    TResult Function()? toCreate,
    required TResult orElse(),
  }) {
    if (toHome != null) {
      return toHome();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OnPop value) pop,
    required TResult Function(ToHome value) toHome,
    required TResult Function(ToCreate value) toCreate,
  }) {
    return toHome(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(OnPop value)? pop,
    TResult Function(ToHome value)? toHome,
    TResult Function(ToCreate value)? toCreate,
  }) {
    return toHome?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OnPop value)? pop,
    TResult Function(ToHome value)? toHome,
    TResult Function(ToCreate value)? toCreate,
    required TResult orElse(),
  }) {
    if (toHome != null) {
      return toHome(this);
    }
    return orElse();
  }
}

abstract class ToHome implements RouterEvent {
  const factory ToHome() = _$ToHome;
}

/// @nodoc
abstract class _$$ToCreateCopyWith<$Res> {
  factory _$$ToCreateCopyWith(
          _$ToCreate value, $Res Function(_$ToCreate) then) =
      __$$ToCreateCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ToCreateCopyWithImpl<$Res> extends _$RouterEventCopyWithImpl<$Res>
    implements _$$ToCreateCopyWith<$Res> {
  __$$ToCreateCopyWithImpl(_$ToCreate _value, $Res Function(_$ToCreate) _then)
      : super(_value, (v) => _then(v as _$ToCreate));

  @override
  _$ToCreate get _value => super._value as _$ToCreate;
}

/// @nodoc

class _$ToCreate with DiagnosticableTreeMixin implements ToCreate {
  const _$ToCreate();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'RouterEvent.toCreate()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'RouterEvent.toCreate'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ToCreate);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() pop,
    required TResult Function() toHome,
    required TResult Function() toCreate,
  }) {
    return toCreate();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? pop,
    TResult Function()? toHome,
    TResult Function()? toCreate,
  }) {
    return toCreate?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? pop,
    TResult Function()? toHome,
    TResult Function()? toCreate,
    required TResult orElse(),
  }) {
    if (toCreate != null) {
      return toCreate();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OnPop value) pop,
    required TResult Function(ToHome value) toHome,
    required TResult Function(ToCreate value) toCreate,
  }) {
    return toCreate(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(OnPop value)? pop,
    TResult Function(ToHome value)? toHome,
    TResult Function(ToCreate value)? toCreate,
  }) {
    return toCreate?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OnPop value)? pop,
    TResult Function(ToHome value)? toHome,
    TResult Function(ToCreate value)? toCreate,
    required TResult orElse(),
  }) {
    if (toCreate != null) {
      return toCreate(this);
    }
    return orElse();
  }
}

abstract class ToCreate implements RouterEvent {
  const factory ToCreate() = _$ToCreate;
}
