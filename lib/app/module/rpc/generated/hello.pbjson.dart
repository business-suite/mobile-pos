///
//  Generated code. Do not modify.
//  source: hello.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,deprecated_member_use_from_same_package,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use albumDescriptor instead')
const Album$json = const {
  '1': 'Album',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 5, '10': 'id'},
    const {'1': 'title', '3': 2, '4': 1, '5': 9, '10': 'title'},
    const {'1': 'photos', '3': 3, '4': 3, '5': 11, '6': '.Photo', '10': 'photos'},
  ],
};

/// Descriptor for `Album`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List albumDescriptor = $convert.base64Decode('CgVBbGJ1bRIOCgJpZBgBIAEoBVICaWQSFAoFdGl0bGUYAiABKAlSBXRpdGxlEh4KBnBob3RvcxgDIAMoCzIGLlBob3RvUgZwaG90b3M=');
@$core.Deprecated('Use photoDescriptor instead')
const Photo$json = const {
  '1': 'Photo',
  '2': const [
    const {'1': 'albumId', '3': 1, '4': 1, '5': 5, '10': 'albumId'},
    const {'1': 'id', '3': 2, '4': 1, '5': 5, '10': 'id'},
    const {'1': 'title', '3': 3, '4': 1, '5': 9, '10': 'title'},
    const {'1': 'url', '3': 4, '4': 1, '5': 9, '10': 'url'},
  ],
};

/// Descriptor for `Photo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List photoDescriptor = $convert.base64Decode('CgVQaG90bxIYCgdhbGJ1bUlkGAEgASgFUgdhbGJ1bUlkEg4KAmlkGAIgASgFUgJpZBIUCgV0aXRsZRgDIAEoCVIFdGl0bGUSEAoDdXJsGAQgASgJUgN1cmw=');
@$core.Deprecated('Use albumRequestDescriptor instead')
const AlbumRequest$json = const {
  '1': 'AlbumRequest',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 5, '10': 'id'},
  ],
};

/// Descriptor for `AlbumRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List albumRequestDescriptor = $convert.base64Decode('CgxBbGJ1bVJlcXVlc3QSDgoCaWQYASABKAVSAmlk');
@$core.Deprecated('Use albumResponseDescriptor instead')
const AlbumResponse$json = const {
  '1': 'AlbumResponse',
  '2': const [
    const {'1': 'albums', '3': 1, '4': 3, '5': 11, '6': '.Album', '10': 'albums'},
  ],
};

/// Descriptor for `AlbumResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List albumResponseDescriptor = $convert.base64Decode('Cg1BbGJ1bVJlc3BvbnNlEh4KBmFsYnVtcxgBIAMoCzIGLkFsYnVtUgZhbGJ1bXM=');
