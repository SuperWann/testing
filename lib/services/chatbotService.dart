import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:sqflite/sqflite.dart';
import 'package:testing/config.dart';
import 'package:testing/helpers/dbHelper.dart';
import 'package:testing/models/percakapan.dart';

class ChatbotService {
  final DbHelper dbHelper = DbHelper();
  final String apiKeyGemini = GeminiApiKey.apiKey.trim();

  Future<List<ModelPercakapan>>? getAllPercakapan() async {
    final db = await dbHelper.database;
    final List<dynamic> data = await db.query(
      'percakapan',
      orderBy: 'timestamp ASC',
    );
    print(data.map((data) => ModelPercakapan.fromMap(data)).toList());
    return data.map((data) => ModelPercakapan.fromMap(data)).toList();
  }

  Future<void> insertPercakapan(ModelPercakapan percakapan) async {
    final db = await dbHelper.database;
    await db.insert(
      'percakapan',
      percakapan.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> deleteAllPercakapan() async {
    final db = await dbHelper.database;
    await db.delete('percakapan');
  }

  Future<http.Response> requestGemini(String pesan) async {
    final result = await http.post(
      Uri.parse(
        'https://generativelanguage.googleapis.com/v1beta/models/gemini-2.5-flash:generateContent?key=$apiKeyGemini',
      ),
      headers: <String, String>{'Content-Type': 'application/json'},
      body: jsonEncode(<String, dynamic>{
        "contents": [
          {
            "parts": [
              {"text": pesan},
            ],
          },
        ],
      }),
    );
    print(result.body);
    return result;
  }
}
