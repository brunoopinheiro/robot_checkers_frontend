//
//  Generated code. Do not modify.
//  source: messages.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'messages.pbenum.dart';

export 'messages.pbenum.dart';

class Coordinates extends $pb.GeneratedMessage {
  factory Coordinates({
    $core.String? col,
    $core.int? row,
  }) {
    final $result = create();
    if (col != null) {
      $result.col = col;
    }
    if (row != null) {
      $result.row = row;
    }
    return $result;
  }
  Coordinates._() : super();
  factory Coordinates.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Coordinates.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Coordinates', createEmptyInstance: create)
    ..aQS(1, _omitFieldNames ? '' : 'col')
    ..a<$core.int>(2, _omitFieldNames ? '' : 'row', $pb.PbFieldType.Q3)
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Coordinates clone() => Coordinates()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Coordinates copyWith(void Function(Coordinates) updates) => super.copyWith((message) => updates(message as Coordinates)) as Coordinates;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Coordinates create() => Coordinates._();
  Coordinates createEmptyInstance() => create();
  static $pb.PbList<Coordinates> createRepeated() => $pb.PbList<Coordinates>();
  @$core.pragma('dart2js:noInline')
  static Coordinates getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Coordinates>(create);
  static Coordinates? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get col => $_getSZ(0);
  @$pb.TagNumber(1)
  set col($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasCol() => $_has(0);
  @$pb.TagNumber(1)
  void clearCol() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get row => $_getIZ(1);
  @$pb.TagNumber(2)
  set row($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasRow() => $_has(1);
  @$pb.TagNumber(2)
  void clearRow() => clearField(2);
}

class Piece extends $pb.GeneratedMessage {
  factory Piece({
    Coordinates? coordinates,
    $core.String? color,
    Piece_Type? type,
  }) {
    final $result = create();
    if (coordinates != null) {
      $result.coordinates = coordinates;
    }
    if (color != null) {
      $result.color = color;
    }
    if (type != null) {
      $result.type = type;
    }
    return $result;
  }
  Piece._() : super();
  factory Piece.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Piece.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Piece', createEmptyInstance: create)
    ..aQM<Coordinates>(1, _omitFieldNames ? '' : 'coordinates', subBuilder: Coordinates.create)
    ..aQS(2, _omitFieldNames ? '' : 'color')
    ..e<Piece_Type>(3, _omitFieldNames ? '' : 'type', $pb.PbFieldType.QE, defaultOrMaker: Piece_Type.PAWN, valueOf: Piece_Type.valueOf, enumValues: Piece_Type.values)
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Piece clone() => Piece()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Piece copyWith(void Function(Piece) updates) => super.copyWith((message) => updates(message as Piece)) as Piece;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Piece create() => Piece._();
  Piece createEmptyInstance() => create();
  static $pb.PbList<Piece> createRepeated() => $pb.PbList<Piece>();
  @$core.pragma('dart2js:noInline')
  static Piece getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Piece>(create);
  static Piece? _defaultInstance;

  @$pb.TagNumber(1)
  Coordinates get coordinates => $_getN(0);
  @$pb.TagNumber(1)
  set coordinates(Coordinates v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasCoordinates() => $_has(0);
  @$pb.TagNumber(1)
  void clearCoordinates() => clearField(1);
  @$pb.TagNumber(1)
  Coordinates ensureCoordinates() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.String get color => $_getSZ(1);
  @$pb.TagNumber(2)
  set color($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasColor() => $_has(1);
  @$pb.TagNumber(2)
  void clearColor() => clearField(2);

  @$pb.TagNumber(3)
  Piece_Type get type => $_getN(2);
  @$pb.TagNumber(3)
  set type(Piece_Type v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasType() => $_has(2);
  @$pb.TagNumber(3)
  void clearType() => clearField(3);
}

class Square extends $pb.GeneratedMessage {
  factory Square({
    $core.String? col,
    $core.int? row,
    $core.bool? movable,
    Piece? content,
  }) {
    final $result = create();
    if (col != null) {
      $result.col = col;
    }
    if (row != null) {
      $result.row = row;
    }
    if (movable != null) {
      $result.movable = movable;
    }
    if (content != null) {
      $result.content = content;
    }
    return $result;
  }
  Square._() : super();
  factory Square.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Square.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Square', createEmptyInstance: create)
    ..aQS(1, _omitFieldNames ? '' : 'col')
    ..a<$core.int>(2, _omitFieldNames ? '' : 'row', $pb.PbFieldType.Q3)
    ..a<$core.bool>(3, _omitFieldNames ? '' : 'movable', $pb.PbFieldType.QB)
    ..aOM<Piece>(4, _omitFieldNames ? '' : 'content', subBuilder: Piece.create)
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Square clone() => Square()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Square copyWith(void Function(Square) updates) => super.copyWith((message) => updates(message as Square)) as Square;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Square create() => Square._();
  Square createEmptyInstance() => create();
  static $pb.PbList<Square> createRepeated() => $pb.PbList<Square>();
  @$core.pragma('dart2js:noInline')
  static Square getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Square>(create);
  static Square? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get col => $_getSZ(0);
  @$pb.TagNumber(1)
  set col($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasCol() => $_has(0);
  @$pb.TagNumber(1)
  void clearCol() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get row => $_getIZ(1);
  @$pb.TagNumber(2)
  set row($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasRow() => $_has(1);
  @$pb.TagNumber(2)
  void clearRow() => clearField(2);

  @$pb.TagNumber(3)
  $core.bool get movable => $_getBF(2);
  @$pb.TagNumber(3)
  set movable($core.bool v) { $_setBool(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasMovable() => $_has(2);
  @$pb.TagNumber(3)
  void clearMovable() => clearField(3);

  @$pb.TagNumber(4)
  Piece get content => $_getN(3);
  @$pb.TagNumber(4)
  set content(Piece v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasContent() => $_has(3);
  @$pb.TagNumber(4)
  void clearContent() => clearField(4);
  @$pb.TagNumber(4)
  Piece ensureContent() => $_ensure(3);
}

class Row extends $pb.GeneratedMessage {
  factory Row({
    $core.Iterable<Square>? squares,
  }) {
    final $result = create();
    if (squares != null) {
      $result.squares.addAll(squares);
    }
    return $result;
  }
  Row._() : super();
  factory Row.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Row.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Row', createEmptyInstance: create)
    ..pc<Square>(1, _omitFieldNames ? '' : 'squares', $pb.PbFieldType.PM, subBuilder: Square.create)
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Row clone() => Row()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Row copyWith(void Function(Row) updates) => super.copyWith((message) => updates(message as Row)) as Row;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Row create() => Row._();
  Row createEmptyInstance() => create();
  static $pb.PbList<Row> createRepeated() => $pb.PbList<Row>();
  @$core.pragma('dart2js:noInline')
  static Row getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Row>(create);
  static Row? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<Square> get squares => $_getList(0);
}

class Board extends $pb.GeneratedMessage {
  factory Board({
    $core.Iterable<Row>? rows,
  }) {
    final $result = create();
    if (rows != null) {
      $result.rows.addAll(rows);
    }
    return $result;
  }
  Board._() : super();
  factory Board.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Board.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Board', createEmptyInstance: create)
    ..pc<Row>(1, _omitFieldNames ? '' : 'rows', $pb.PbFieldType.PM, subBuilder: Row.create)
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Board clone() => Board()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Board copyWith(void Function(Board) updates) => super.copyWith((message) => updates(message as Board)) as Board;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Board create() => Board._();
  Board createEmptyInstance() => create();
  static $pb.PbList<Board> createRepeated() => $pb.PbList<Board>();
  @$core.pragma('dart2js:noInline')
  static Board getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Board>(create);
  static Board? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<Row> get rows => $_getList(0);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
