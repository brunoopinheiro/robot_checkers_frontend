//
//  Generated code. Do not modify.
//  source: messages.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use coordinatesDescriptor instead')
const Coordinates$json = {
  '1': 'Coordinates',
  '2': [
    {'1': 'col', '3': 1, '4': 2, '5': 9, '10': 'col'},
    {'1': 'row', '3': 2, '4': 2, '5': 5, '10': 'row'},
  ],
};

/// Descriptor for `Coordinates`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List coordinatesDescriptor = $convert.base64Decode(
    'CgtDb29yZGluYXRlcxIQCgNjb2wYASACKAlSA2NvbBIQCgNyb3cYAiACKAVSA3Jvdw==');

@$core.Deprecated('Use pieceDescriptor instead')
const Piece$json = {
  '1': 'Piece',
  '2': [
    {'1': 'coordinates', '3': 1, '4': 2, '5': 11, '6': '.Coordinates', '10': 'coordinates'},
    {'1': 'color', '3': 2, '4': 2, '5': 9, '10': 'color'},
    {'1': 'type', '3': 3, '4': 2, '5': 14, '6': '.Piece.Type', '10': 'type'},
  ],
  '4': [Piece_Type$json],
};

@$core.Deprecated('Use pieceDescriptor instead')
const Piece_Type$json = {
  '1': 'Type',
  '2': [
    {'1': 'PAWN', '2': 0},
    {'1': 'QUEEN', '2': 1},
  ],
};

/// Descriptor for `Piece`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List pieceDescriptor = $convert.base64Decode(
    'CgVQaWVjZRIuCgtjb29yZGluYXRlcxgBIAIoCzIMLkNvb3JkaW5hdGVzUgtjb29yZGluYXRlcx'
    'IUCgVjb2xvchgCIAIoCVIFY29sb3ISHwoEdHlwZRgDIAIoDjILLlBpZWNlLlR5cGVSBHR5cGUi'
    'GwoEVHlwZRIICgRQQVdOEAASCQoFUVVFRU4QAQ==');

@$core.Deprecated('Use squareDescriptor instead')
const Square$json = {
  '1': 'Square',
  '2': [
    {'1': 'col', '3': 1, '4': 2, '5': 9, '10': 'col'},
    {'1': 'row', '3': 2, '4': 2, '5': 5, '10': 'row'},
    {'1': 'movable', '3': 3, '4': 2, '5': 8, '10': 'movable'},
    {'1': 'content', '3': 4, '4': 1, '5': 11, '6': '.Piece', '10': 'content'},
  ],
};

/// Descriptor for `Square`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List squareDescriptor = $convert.base64Decode(
    'CgZTcXVhcmUSEAoDY29sGAEgAigJUgNjb2wSEAoDcm93GAIgAigFUgNyb3cSGAoHbW92YWJsZR'
    'gDIAIoCFIHbW92YWJsZRIgCgdjb250ZW50GAQgASgLMgYuUGllY2VSB2NvbnRlbnQ=');

@$core.Deprecated('Use rowDescriptor instead')
const Row$json = {
  '1': 'Row',
  '2': [
    {'1': 'squares', '3': 1, '4': 3, '5': 11, '6': '.Square', '10': 'squares'},
  ],
};

/// Descriptor for `Row`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List rowDescriptor = $convert.base64Decode(
    'CgNSb3cSIQoHc3F1YXJlcxgBIAMoCzIHLlNxdWFyZVIHc3F1YXJlcw==');

@$core.Deprecated('Use boardDescriptor instead')
const Board$json = {
  '1': 'Board',
  '2': [
    {'1': 'rows', '3': 1, '4': 3, '5': 11, '6': '.Row', '10': 'rows'},
  ],
};

/// Descriptor for `Board`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List boardDescriptor = $convert.base64Decode(
    'CgVCb2FyZBIYCgRyb3dzGAEgAygLMgQuUm93UgRyb3dz');

