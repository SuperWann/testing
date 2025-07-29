import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:testing/models/geminiResponse.dart';
import 'package:testing/models/percakapan.dart';
import 'package:testing/services/chatbotService.dart';

class ChatbotProvider with ChangeNotifier {
  final ChatbotService chatbotService = ChatbotService();

  List<ModelPercakapan>? _percakapan;
  List<ModelPercakapan>? get getPercakapan => _percakapan;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> getAllPercakapan() async {
    _percakapan = await chatbotService.getAllPercakapan();
    notifyListeners();
    // print(_percakapan);
  }

  Future<void> sendPertanyaan(String pertanyaan, BuildContext context) async {
    _isLoading = true;
    notifyListeners();

    try {
      // Insert user message dan update UI
      await chatbotService.insertPercakapan(
        ModelPercakapan(senderType: 'user', pesan: pertanyaan),
      );

      // Refresh data setelah insert user message
      await getAllPercakapan();

      // Request ke Gemini
      final response = await chatbotService.requestGemini(pertanyaan);

      if (response.statusCode == 200) {
        final geminiResponse = GeminiResponse.fromJson(
          json.decode(response.body),
        );

        // Insert bot response dan update UI
        await chatbotService.insertPercakapan(
          ModelPercakapan(
            senderType: 'bot',
            pesan: geminiResponse.getFirstText(),
          ),
        );

        // Refresh data setelah insert bot response
        await getAllPercakapan();
      } else {
        // Handle error response
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Gagal mendapatkan response dari bot'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } catch (e) {
      Navigator.pop(context);
      print('Error: $e');

      // Show error message to user
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Terjadi kesalahan: $e'),
          backgroundColor: Colors.red,
        ),
      );
    } finally {
      _isLoading = false;
      notifyListeners(); // Update UI untuk stop loading
    }
  }

  // Method untuk add message secara real-time
  void addMessageLocally(ModelPercakapan message) {
    if (_percakapan != null) {
      _percakapan!.add(message);
      notifyListeners();
    }
  }

  // Method untuk clear chat
  Future<void> clearChat() async {
    _percakapan?.clear();
    chatbotService.deleteAllPercakapan();
    notifyListeners();
  }
}
