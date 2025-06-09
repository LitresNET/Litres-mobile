//
//  Generated code. Do not modify.
//  source: chat.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'package:protobuf/protobuf.dart' as $pb;

import 'chat.pb.dart' as $0;
import 'google/protobuf/empty.pb.dart' as $1;

export 'chat.pb.dart';

@$pb.GrpcServiceName('chat.ChatService')
class ChatServiceClient extends $grpc.Client {
  static final _$chat = $grpc.ClientMethod<$0.ChatMessage, $0.ChatMessage>(
      '/chat.ChatService/Chat',
      ($0.ChatMessage value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.ChatMessage.fromBuffer(value));
  static final _$subscribe = $grpc.ClientMethod<$1.Empty, $0.ChatMessage>(
      '/chat.ChatService/Subscribe',
      ($1.Empty value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.ChatMessage.fromBuffer(value));
  static final _$sendMessage = $grpc.ClientMethod<$0.ChatMessage, $1.Empty>(
      '/chat.ChatService/SendMessage',
      ($0.ChatMessage value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.Empty.fromBuffer(value));

  ChatServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options,
        interceptors: interceptors);

  $grpc.ResponseStream<$0.ChatMessage> chat($async.Stream<$0.ChatMessage> request, {$grpc.CallOptions? options}) {
    return $createStreamingCall(_$chat, request, options: options);
  }

  $grpc.ResponseStream<$0.ChatMessage> subscribe($1.Empty request, {$grpc.CallOptions? options}) {
    return $createStreamingCall(_$subscribe, $async.Stream.fromIterable([request]), options: options);
  }

  $grpc.ResponseFuture<$1.Empty> sendMessage($0.ChatMessage request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$sendMessage, request, options: options);
  }
}

@$pb.GrpcServiceName('chat.ChatService')
abstract class ChatServiceBase extends $grpc.Service {
  $core.String get $name => 'chat.ChatService';

  ChatServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.ChatMessage, $0.ChatMessage>(
        'Chat',
        chat,
        true,
        true,
        ($core.List<$core.int> value) => $0.ChatMessage.fromBuffer(value),
        ($0.ChatMessage value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.Empty, $0.ChatMessage>(
        'Subscribe',
        subscribe_Pre,
        false,
        true,
        ($core.List<$core.int> value) => $1.Empty.fromBuffer(value),
        ($0.ChatMessage value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.ChatMessage, $1.Empty>(
        'SendMessage',
        sendMessage_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.ChatMessage.fromBuffer(value),
        ($1.Empty value) => value.writeToBuffer()));
  }

  $async.Stream<$0.ChatMessage> subscribe_Pre($grpc.ServiceCall call, $async.Future<$1.Empty> request) async* {
    yield* subscribe(call, await request);
  }

  $async.Future<$1.Empty> sendMessage_Pre($grpc.ServiceCall call, $async.Future<$0.ChatMessage> request) async {
    return sendMessage(call, await request);
  }

  $async.Stream<$0.ChatMessage> chat($grpc.ServiceCall call, $async.Stream<$0.ChatMessage> request);
  $async.Stream<$0.ChatMessage> subscribe($grpc.ServiceCall call, $1.Empty request);
  $async.Future<$1.Empty> sendMessage($grpc.ServiceCall call, $0.ChatMessage request);
}
