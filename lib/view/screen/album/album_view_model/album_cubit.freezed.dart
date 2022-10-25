// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'album_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AlbumState {
  Status get collectionStatus => throw _privateConstructorUsedError;
  List<CollectionItemModel> get collections =>
      throw _privateConstructorUsedError; //photo state
  int get photosPage => throw _privateConstructorUsedError;
  bool get hasReachMax => throw _privateConstructorUsedError;
  Status get photosStatus => throw _privateConstructorUsedError;
  List<PhotoItemModel> get photos => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AlbumStateCopyWith<AlbumState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AlbumStateCopyWith<$Res> {
  factory $AlbumStateCopyWith(
          AlbumState value, $Res Function(AlbumState) then) =
      _$AlbumStateCopyWithImpl<$Res, AlbumState>;
  @useResult
  $Res call(
      {Status collectionStatus,
      List<CollectionItemModel> collections,
      int photosPage,
      bool hasReachMax,
      Status photosStatus,
      List<PhotoItemModel> photos});
}

/// @nodoc
class _$AlbumStateCopyWithImpl<$Res, $Val extends AlbumState>
    implements $AlbumStateCopyWith<$Res> {
  _$AlbumStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? collectionStatus = null,
    Object? collections = null,
    Object? photosPage = null,
    Object? hasReachMax = null,
    Object? photosStatus = null,
    Object? photos = null,
  }) {
    return _then(_value.copyWith(
      collectionStatus: null == collectionStatus
          ? _value.collectionStatus
          : collectionStatus // ignore: cast_nullable_to_non_nullable
              as Status,
      collections: null == collections
          ? _value.collections
          : collections // ignore: cast_nullable_to_non_nullable
              as List<CollectionItemModel>,
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
abstract class _$$_AlbumStateCopyWith<$Res>
    implements $AlbumStateCopyWith<$Res> {
  factory _$$_AlbumStateCopyWith(
          _$_AlbumState value, $Res Function(_$_AlbumState) then) =
      __$$_AlbumStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Status collectionStatus,
      List<CollectionItemModel> collections,
      int photosPage,
      bool hasReachMax,
      Status photosStatus,
      List<PhotoItemModel> photos});
}

/// @nodoc
class __$$_AlbumStateCopyWithImpl<$Res>
    extends _$AlbumStateCopyWithImpl<$Res, _$_AlbumState>
    implements _$$_AlbumStateCopyWith<$Res> {
  __$$_AlbumStateCopyWithImpl(
      _$_AlbumState _value, $Res Function(_$_AlbumState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? collectionStatus = null,
    Object? collections = null,
    Object? photosPage = null,
    Object? hasReachMax = null,
    Object? photosStatus = null,
    Object? photos = null,
  }) {
    return _then(_$_AlbumState(
      collectionStatus: null == collectionStatus
          ? _value.collectionStatus
          : collectionStatus // ignore: cast_nullable_to_non_nullable
              as Status,
      collections: null == collections
          ? _value._collections
          : collections // ignore: cast_nullable_to_non_nullable
              as List<CollectionItemModel>,
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

class _$_AlbumState implements _AlbumState {
  const _$_AlbumState(
      {this.collectionStatus = Status.initial,
      final List<CollectionItemModel> collections = const [],
      this.photosPage = 1,
      this.hasReachMax = false,
      this.photosStatus = Status.initial,
      final List<PhotoItemModel> photos = const []})
      : _collections = collections,
        _photos = photos;

  @override
  @JsonKey()
  final Status collectionStatus;
  final List<CollectionItemModel> _collections;
  @override
  @JsonKey()
  List<CollectionItemModel> get collections {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_collections);
  }

//photo state
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
    return 'AlbumState(collectionStatus: $collectionStatus, collections: $collections, photosPage: $photosPage, hasReachMax: $hasReachMax, photosStatus: $photosStatus, photos: $photos)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AlbumState &&
            (identical(other.collectionStatus, collectionStatus) ||
                other.collectionStatus == collectionStatus) &&
            const DeepCollectionEquality()
                .equals(other._collections, _collections) &&
            (identical(other.photosPage, photosPage) ||
                other.photosPage == photosPage) &&
            (identical(other.hasReachMax, hasReachMax) ||
                other.hasReachMax == hasReachMax) &&
            (identical(other.photosStatus, photosStatus) ||
                other.photosStatus == photosStatus) &&
            const DeepCollectionEquality().equals(other._photos, _photos));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      collectionStatus,
      const DeepCollectionEquality().hash(_collections),
      photosPage,
      hasReachMax,
      photosStatus,
      const DeepCollectionEquality().hash(_photos));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AlbumStateCopyWith<_$_AlbumState> get copyWith =>
      __$$_AlbumStateCopyWithImpl<_$_AlbumState>(this, _$identity);
}

abstract class _AlbumState implements AlbumState {
  const factory _AlbumState(
      {final Status collectionStatus,
      final List<CollectionItemModel> collections,
      final int photosPage,
      final bool hasReachMax,
      final Status photosStatus,
      final List<PhotoItemModel> photos}) = _$_AlbumState;

  @override
  Status get collectionStatus;
  @override
  List<CollectionItemModel> get collections;
  @override //photo state
  int get photosPage;
  @override
  bool get hasReachMax;
  @override
  Status get photosStatus;
  @override
  List<PhotoItemModel> get photos;
  @override
  @JsonKey(ignore: true)
  _$$_AlbumStateCopyWith<_$_AlbumState> get copyWith =>
      throw _privateConstructorUsedError;
}
