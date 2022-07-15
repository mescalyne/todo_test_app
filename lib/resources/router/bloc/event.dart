import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'event.freezed.dart';

@freezed
class RouterEvent with _$RouterEvent {
  const factory RouterEvent.pop() = OnPop;
  const factory RouterEvent.toHome() = ToHome;
  const factory RouterEvent.toCreate() = ToCreate;
}
