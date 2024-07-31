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

class Piece_Type extends $pb.ProtobufEnum {
  static const Piece_Type PAWN = Piece_Type._(0, _omitEnumNames ? '' : 'PAWN');
  static const Piece_Type QUEEN = Piece_Type._(1, _omitEnumNames ? '' : 'QUEEN');

  static const $core.List<Piece_Type> values = <Piece_Type> [
    PAWN,
    QUEEN,
  ];

  static final $core.Map<$core.int, Piece_Type> _byValue = $pb.ProtobufEnum.initByValue(values);
  static Piece_Type? valueOf($core.int value) => _byValue[value];

  const Piece_Type._($core.int v, $core.String n) : super(v, n);
}


const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');
