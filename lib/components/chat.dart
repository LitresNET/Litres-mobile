import 'dart:async';
import 'dart:convert';
import 'package:fixnum/fixnum.dart' as $fixnum;
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:grpc/grpc.dart';
import 'package:litres_mobile/services/auth/auth_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:litres_mobile/generated/chat.pbgrpc.dart';
import '../generated/google/protobuf/empty.pb.dart';

class SupportChatWidget extends StatefulWidget {
  const SupportChatWidget({super.key});

  @override
  State<SupportChatWidget> createState() => _SupportChatWidgetState();
}

class _SupportChatWidgetState extends State<SupportChatWidget> {
  final List<ChatMessage> _messages = [];
  final TextEditingController _controller = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  late ChatServiceClient _client;
  late ClientChannel _channel;

  // Stream controller for outgoing messages
  final StreamController<ChatMessage> _outgoingController = StreamController<ChatMessage>();

  $fixnum.Int64? _chatId;
  String _username = "User";

  @override
  void initState() {
    super.initState();
    _initChat();
  }

  Future<void> _initChat() async {
    final prefs = await SharedPreferences.getInstance();
    final token = AuthStorage().getUserToken;
    _username = prefs.getString("username") ?? "User";

    final creds = ChannelCredentials.secure();
    // final creds = ChannelCredentials.secure(
    //   certificates: null,
    //   onBadCertificate: (cert, host) => true,
    // );
    _channel = ClientChannel(
      '127.0.0.1',
      port: 5225,
      options: ChannelOptions(credentials: creds),
    );
    final options = CallOptions(
      metadata: {
        'Authorization': 'Bearer $token',
      },
    );
    _client = ChatServiceClient(_channel, options: options);

    // Start bidirectional chat stream
    final response = _client.chat(_outgoingController.stream, options: options);
    await for (final resp in response) {
      setState(() {
        _messages.add(ChatMessage()
          ..from = resp.from
          ..text = resp.text
          ..sentUnix = resp.sentUnix
        );
      });
      // Scroll to bottom
      _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
    }
  }

  Future<void> _sendMessage() async {
    final text = _controller.text.trim();
    if (text.isEmpty) return;
    final message = ChatMessage()
      ..from = _username
      ..text = text
      ..sentUnix = $fixnum.Int64(DateTime.now().millisecondsSinceEpoch);

    // Add to outgoing stream
    _outgoingController.add(message);

    setState(() {
      _messages.add(message);
      _controller.clear();
    });
    // Scroll to bottom
    _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
  }

  @override
  void dispose() {
    _outgoingController.close();
    _channel.shutdown();
    super.dispose();
  }

  Widget _buildMessage(ChatMessage msg) {
    final isMe = msg.from == _username;
    return Align(
      alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Card(
        color: isMe ? Colors.blue[300] : Colors.orange[300],
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment:
            isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
            children: [
              Text(msg.from, style: const TextStyle(fontWeight: FontWeight.bold)),
              Text(msg.text),
              Text(
                DateTime.fromMillisecondsSinceEpoch(msg.sentUnix.toInt())
                    .toLocal()
                    .toIso8601String(),
                style: const TextStyle(fontSize: 10, color: Colors.black45),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Material(
        elevation: 10,
        child: Container(
          color: Colors.white,
          padding: const EdgeInsets.all(8),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 200,
                child: ListView(
                  controller: _scrollController,
                  children: _messages.map(_buildMessage).toList(),
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _controller,
                      decoration: const InputDecoration(hintText: 'Write a message'),
                      onSubmitted: (_) => _sendMessage(),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.send),
                    onPressed: _sendMessage,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}