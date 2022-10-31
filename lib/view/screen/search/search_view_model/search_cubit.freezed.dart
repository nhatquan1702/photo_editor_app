// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'search_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SearchState {
  String get keyword => throw _privateConstructorUsedError;
  int get photosPage => throw _privateConstructorUsedError;
  bool get hasReachMax => throw _privateConstructorUsedError;
  Status get photosStatus => throw _privateConstructorUsedError;
  List<PhotoItemModel> get photos => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SearchStateCopyWith<SearchState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchStateCopyWith<$Res> {
  factory $SearchStateCopyWith(
          SearchState value, $Res Function(SearchState) then) =
      _$SearchStateCopyWithImpl<$Res, SearchState>;
  @useResult
  $Res call(
      {String keyword,
      int photosPage,
      bool hasReachMax,
      Status photosStatus,
      List<PhotoItemModel> photos});
}

/// @nodoc
class _$SearchStateCopyWithImpl<$Res, $Val extends SearchState>
    implements $SearchStateCopyWith<$Res> {
  _$SearchStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? keyword = null,
    Object? photosPage = null,
    Object? hasReachMax = null,
    Object? photosStatus = null,
    Object? photos = null,
  }) {
    return _then(_value.copyWith(
      keyword: null == keyword
          ? _value.keyword
          : keyword // ignore: cast_nullable_to_non_nullable
              as String,
      photosPage: null == photosPage
          ? _value.photosPage
          : photosPage // ignore: cast_nullable_to_non_nullable
              as int,
      hasReachMax: null == hasReachMax
          ? _value.hasReachMax
          : hasReachMax // ignore: cast_nullable_to_non_nullable
              as bool,
      photosStatus: null == photosStatus
          ? _value.photosStatus
          : photosStatus // ignore: cast_nullable_to_non_nullable
              as Status,
      photos: null == photos
          ? _value.photos
          : photos // ignore: cast_nullable_to_non_nullable
              as List<PhotoItemModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SearchStateCopyWith<$Res>
    implements $SearchStateCopyWith<$Res> {
  factory _$$_SearchStateCopyWith(
          _$_SearchState value, $Res Function(_$_SearchState) then) =
      __$$_SearchStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String keyword,
      int photosPage,
      bool hasReachMax,
      Status photosStatus,
      List<PhotoItemModel> photos});
}

/// @nodoc
class __$$_SearchStateCopyWithImpl<$Res>
    extends _$SearchStateCopyWithImpl<$Res, _$_SearchState>
    implements _$$_SearchStateCopyWith<$Res> {
  __$$_SearchStateCopyWithImpl(
      _$_SearchState _value, $Res Function(_$_SearchState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? keyword = null,
    Object? photosPage = null,
    Object? hasReachMax = null,
    Object? photosStatus = null,
    Object? photos = null,
  }) {
    return _then(_$_SearchState(
      keyword: null == keyword
          ? _value.keyword
          : keyword // ignore: cast_nullable_to_non_nullable
              as String,
      photosPage: null == photosPage
          ? _value.photosPage
          : photosPage // ignore: cast_nullable_to_non_nullable
              as int,
      hasReachMax: null == hasReachMax
          ? _value.hasReachMax
          : hasReachMax // ignore: cast_nullable_to_non_nullable
              as bool,
      photosStatus: null == photosStatus
          ? _value.photosStatus
          : photosStatus // ignore: cast_nullable_to_non_nullable
              as Status,
      photos: null == photos
          ? _value._photos
          : photos // ignore: cast_nullable_to_non_nullable
              as List<PhotoItemModel>,
    ));
  }
}

/// @nodoc

class _$_SearchState implements _SearchState {
  const _$_SearchState(
      {this.keyword = "",
      this.photosPage = 1,
      this.hasReachMax = false,
      this.photosStatus = Status.initial,
      final List<PhotoItemModel> photos = const []})
      : _photos = photos;

  @override
  @JsonKey()
  final String keyword;
  @override
  @JsonKey()
  final int photosPage;
  @override
  @JsonKey()
  final bool hasReachMax;
  @override
  @JsonKey()
  final Status photosStatus;
  final List<PhotoItemModel> _photos;
  @override
  @JsonKey()
  List<PhotoItemModel> get photos {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_photos);
  }

  @override
  String toString() {
    return 'SearchState(keyword: $keyword, photosPage: $photosPage, hasReachMax: $hasReachMax, photosStatus: $photosStatus, photos: $photos)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SearchState &&
            (identical(other.keyword, keyword) || other.keyword == keyword) &&
            (identical(other.photosPage, photosPage) ||
                other.photosPage == photosPage) &&
            (identical(other.hasReachMax, hasReachMax) ||
                other.hasReachMax == hasReachMax) &&
            (identical(other.photosStatus, photosStatus) ||
                other.photosStatus == photosStatus) &&
            const DeepCollectionEquality().equals(other._photos, _photos));
  }

  @override
  int get hashCode => Object.hash(runtimeType, keyword, photosPage, hasReachMax,
      photosStatus, const DeepCollectionEquality().hash(_photos));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SearchStateCopyWith<_$_SearchState> get copyWith =>
      __$$_SearchStateCopyWithImpl<_$_SearchState>(this, _$identity);
}

abstract class _SearchState implements SearchState {
  const factory _SearchState(
      {final String keyword,
      final int photosPage,
      final bool hasReachMax,
      final Status photosStatus,
      final List<PhotoItemModel> photos}) = _$_SearchState;

  @override
  String get keyword;
  @override
  int get photosPage;
  @override
  bool get hasReachMax;
  @override
  Status get photosStatus;
  @override
  List<PhotoItemModel> get photos;
  @override
  @JsonKey(ignore: true)
  _$$_SearchStateCopyWith<_$_SearchState> get copyWith =>
      throw _privateConstructorUsedError;
}
