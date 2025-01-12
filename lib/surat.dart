import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class SuratScreen extends StatefulWidget {
  @override
  _SuratScreenState createState() => _SuratScreenState();
}

class _SuratScreenState extends State<SuratScreen> {
  final TextEditingController _controller = TextEditingController();
  List<Map<String, String>> _messages = [];
  bool _isLoading = false; // Untuk indikator loading

  Future<void> sendMessage(String message) async {
    setState(() {
      _messages.add({"role": "user", "content": message});
      _isLoading = true;
    });

    try {
      final response = await http.post(
        Uri.parse('https://api.openai.com/v1/chat/completions'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer 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',
        },
        body: jsonEncode({
          "model": "gpt-3.5-turbo",
          "messages": [
            {"role": "user", "content": message},
          ],
        }),
      );

      if (response.statusCode == 200) {
        final result = jsonDecode(response.body);
        final botMessage = result['choices'][0]['message']['content'];
        setState(() {
          _messages.add({"role": "assistant", "content": botMessage});
        });
      } else {
        setState(() {
          _messages.add({
            "role": "assistant",
            "content": "Server error: ${response.reasonPhrase}. Please try again later."
          });
        });
      }
    } catch (e) {
      setState(() {
        _messages.add({
          "role": "assistant",
          "content": "An error occurred. Please check your internet connection and try again."
        });
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat with daffa'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Kembali ke halaman sebelumnya
          },
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final message = _messages[index];
                return ListTile(
                  title: Align(
                    alignment: message['role'] == 'user'
                        ? Alignment.centerRight
                        : Alignment.centerLeft,
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: message['role'] == 'user'
                            ? Colors.blue[200]
                            : Colors.grey[200],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        message['content'] ?? '',
                        style: const TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          if (_isLoading) // Tampilkan loading indicator
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: CircularProgressIndicator(),
            ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: const InputDecoration(
                      hintText: 'Type a message...',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: () {
                    if (_controller.text.trim().isNotEmpty) {
                      sendMessage(_controller.text.trim());
                      _controller.clear();
                    }
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
