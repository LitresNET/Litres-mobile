//
//  Generated code. Do not modify.
//  source: chat.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use chatMessageDescriptor instead')
const ChatMessage$json = {
  '1': 'ChatMessage',
  '2': [
    {'1': 'chat_id', '3': 1, '4': 1, '5': 3, '10': 'chatId'},
    {'1': 'from', '3': 2, '4': 1, '5': 9, '10': 'from'},
    {'1': 'text', '3': 3, '4': 1, '5': 9, '10': 'text'},
    {'1': 'sent_unix', '3': 4, '4': 1, '5': 3, '10': 'sentUnix'},
    {'1': 'file', '3': 5, '4': 1, '5': 11, '6': '.chat.File', '10': 'file'},
  ],
};

/// Descriptor for `ChatMessage`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List chatMessageDescriptor = $convert.base64Decode(
    'CgtDaGF0TWVzc2FnZRIXCgdjaGF0X2lkGAEgASgDUgZjaGF0SWQSEgoEZnJvbRgCIAEoCVIEZn'
    'JvbRISCgR0ZXh0GAMgASgJUgR0ZXh0EhsKCXNlbnRfdW5peBgEIAEoA1IIc2VudFVuaXgSHgoE'
    'ZmlsZRgFIAEoCzIKLmNoYXQuRmlsZVIEZmlsZQ==');

@$core.Deprecated('Use fileDescriptor instead')
const File$json = {
  '1': 'File',
  '2': [
    {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
    {'1': 'content', '3': 2, '4': 1, '5': 12, '10': 'content'},
    {'1': 'contentType', '3': 3, '4': 1, '5': 9, '10': 'contentType'},
  ],
};

/// Descriptor for `File`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List fileDescriptor = $convert.base64Decode(
    'CgRGaWxlEhIKBG5hbWUYASABKAlSBG5hbWUSGAoHY29udGVudBgCIAEoDFIHY29udGVudBIgCg'
    'tjb250ZW50VHlwZRgDIAEoCVILY29udGVudFR5cGU=');

