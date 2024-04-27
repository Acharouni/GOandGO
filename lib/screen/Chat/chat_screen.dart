import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../controllers/chat_provider.dart';



class ChatScreen extends StatefulWidget {
  final int conversationId;

  ChatScreen({required this.conversationId});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    Provider.of<ChatProvider>(context, listen: false).fetchMessages(widget.conversationId);
  }

  @override
  Widget build(BuildContext context) {
    final chatProvider = Provider.of<ChatProvider>(context);
    final messages = chatProvider.messages;

    return Scaffold(
      appBar: AppBar(title: Text('Chat')),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: messages.length,
              itemBuilder: (context, index) {
                final message = messages[index];
                return ListTile(
                  title: Text(message.sender.firstName),
                  subtitle: Text(message.body),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(hintText: 'Type a message'),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () {
                    chatProvider.sendMessage(
                      1, // senderId,
                      widget.conversationId,
                      _controller.text,
                    );
                    _controller.clear();
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
