// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'detail_photo_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$DetailPhotoState {
  DownloadStatus get downloadStatus => throw _privateConstructorUsedError;
  DownloadStatus get shareStatus => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DetailPhotoStateCopyWith<DetailPhotoState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DetailPhotoStateCopyWith<$Res> {
  factory $DetailPhotoStateCopyWith(
          DetailPhotoState value, $Res Function(DetailPhotoState) then) =
      _$DetailPhotoStateCopyWithImpl<$Res, DetailPhotoState>;
  @useResult
  $Res call({DownloadStatus downloadStatus, DownloadStatus shareStatus});
}

/// @nodoc
class _$DetailPhotoStateCopyWithImpl<$Res, $Val extends DetailPhotoState>
    implements $DetailPhotoStateCopyWith<$Res> {
  _$DetailPhotoStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? downloadStatus = null,
    Object? shareStatus = null,
  }) {
    return _then(_value.copyWith(
      downloadStatus: null == downloadStatus
          ? _value.downloadStatus
          : downloadStatus // ignore: cast_nullable_to_non_nullable
              as DownloadStatus,
      shareStatus: null == shareStatus
          ? _value.shareStatus
          : shareStatus // ignore: cast_nullable_to_non_nullable
              as DownloadStatus,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DetailPhotoStateCopyWith<$Res>
    implements $DetailPhotoStateCopyWith<$Res> {
  factory _$$_DetailPhotoStateCopyWith(
          _$_DetailPhotoState value, $Res Function(_$_DetailPhotoState) then) =
      __$$_DetailPhotoStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({DownloadStatus downloadStatus, DownloadStatus shareStatus});
}

/// @nodoc
class __$$_DetailPhotoStateCopyWithImpl<$Res>
    extends _$DetailPhotoStateCopyWithImpl<$Res, _$_DetailPhotoState>
    implements _$$_DetailPhotoStateCopyWith<$Res> {
  __$$_DetailPhotoStateCopyWithImpl(
      _$_DetailPhotoState _value, $Res Function(_$_DetailPhotoState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? downloadStatus = null,
    Object? shareStatus = null,
  }) {
    return _then(_$_DetailPhotoState(
      downloadStatus: null == downloadStatus
          ? _value.downloadStatus
          : downloadStatus // ignore: cast_nullable_to_non_nullable
              as DownloadStatus,
      shareStatus: null == shareStatus
          ? _value.shareStatus
          : shareStatus // ignore: cast_nullable_to_non_nullable
              as DownloadStatus,
    ));
  }
}

/// @nodoc

class _$_DetailPhotoState implements _DetailPhotoState {
  const _$_DetailPhotoState(
      {this.downloadStatus = DownloadStatus.initial,
      this.shareStatus = DownloadStatus.initial});

  @override
  @JsonKey()
  final DownloadStatus downloadStatus;
  @override
  @JsonKey()
  final DownloadStatus shareStatus;

  @override
  String toString() {
    return 'DetailPhotoState(downloadStatus: $downloadStatus, shareStatus: $shareStatus)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DetailPhotoState &&
            (identical(other.downloadStatus, downloadStatus) ||
                other.downloadStatus == downloadStatus) &&
            (identical(other.shareStatus, shareStatus) ||
                other.shareStatus == shareStatus));
  }

  @override
  int get hashCode => Object.hash(runtimeType, downloadStatus, shareStatus);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DetailPhotoStateCopyWith<_$_DetailPhotoState> get copyWith =>
      __$$_DetailPhotoStateCopyWithImpl<_$_DetailPhotoState>(this, _$identity);
}

abstract class _DetailPhotoState implements DetailPhotoState {
  const factory _DetailPhotoState(
      {final DownloadStatus downloadStatus,
      final DownloadStatus shareStatus}) = _$_DetailPhotoState;

  @override
  DownloadStatus get downloadStatus;
  @override
  DownloadStatus get shareStatus;
  @override
  @JsonKey(ignore: true)
  _$$_DetailPhotoStateCopyWith<_$_DetailPhotoState> get copyWith =>
      throw _privateConstructorUsedError;
}
