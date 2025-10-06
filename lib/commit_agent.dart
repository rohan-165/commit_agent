/// 📦 commit_agent
/// ------------------------------------------------------------
/// 🔹 Description:
///   An AI-powered Git Commit Assistant that automatically analyzes
///   your staged changes, generates clean commit messages using OpenAI,
///   and pushes them to your repository.
///
/// 💡 Features:
///   • Interactive CLI for selecting commit types
///   • Supports FEAT, FIX, BUG, REFACTOR, DOCS, CHORE, TEST, STYLE
///   • Auto stages, commits, and pushes changes
///   • Cross-platform: Windows, macOS, and Linux
///
/// 🧑‍💻 Author & Maintainer:
///   Rohan Kumar Chaudhary (@rohan-165)
///   ✉️  rohanchy165@gmail.com
///   🌐  https://github.com/rohan-165
///
/// 🧩 License:
///   MIT License
///   Copyright (c) 2025 Rohan
///
/// ------------------------------------------------------------
/// ⚙️  File: commit_agent.dart
/// ------------------------------------------------------------

library;

/// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:convert';
import 'dart:io';
import 'package:commit_agent/src/git_helper.dart';

import 'package:http/http.dart' as http;

/// Support for doing something awesome.
/// More dartdocs go here.

String? _openAIKey;

void initCommitAgent({required String openAIKey}) {
  _openAIKey = openAIKey;
}

/// Runs the commit agent interactively
Future<void> runCommitAgent() async {
  if (_openAIKey == null) {
    stderr.writeln('❌ Missing OpenAI API key. Call initCommitAgent() first.');
    exit(1);
  }

  // 1. Stage all changes
  await GitHelper.stageAll();
  stdout.writeln('✅ All changes staged.');

  // 2. Get diff
  final diff = await GitHelper.getStagedDiff();
  if (diff.trim().isEmpty) {
    stderr.writeln('❌ No staged changes found.');
    exit(1);
  }

  // 3. Choose commit type
  final commitType = _chooseCommitType();

  // 4. Optional note
  stdout.write('📝 Optional note (press Enter to skip): ');
  final userComment = stdin.readLineSync() ?? '';

  // 5. Create prompt
  final prompt =
      '''
You are a professional Git commit assistant.
Analyze the following git diff and generate a concise commit message.
Commit type: $commitType
User note: $userComment

Diff:
$diff
''';

  // 6. Call OpenAI API
  final uri = Uri.parse('https://api.openai.com/v1/chat/completions');
  final response = await http.post(
    uri,
    headers: {
      'Authorization': 'Bearer $_openAIKey',
      'Content-Type': 'application/json',
    },
    body: jsonEncode({
      'model': 'gpt-4o-mini',
      'messages': [
        {'role': 'system', 'content': 'You write clean git commit messages.'},
        {'role': 'user', 'content': prompt},
      ],
    }),
  );

  final body = jsonDecode(response.body);
  if (body['error'] != null) {
    stderr.writeln('❌ API Error: ${body['error']['message']}');
    exit(1);
  }

  final aiMessage = body['choices'][0]['message']['content'].toString().trim();
  final finalCommit = '[$commitType] $aiMessage';

  // 7. Confirm
  stdout.writeln('\n🧠 Suggested commit message:\n$finalCommit');
  stdout.write('\nProceed? (y/n): ');
  final confirm = stdin.readLineSync()?.toLowerCase() ?? '';
  if (confirm != 'y') {
    stdout.writeln('🚫 Commit cancelled.');
    exit(0);
  }

  // 8. Commit + Push
  await GitHelper.commit(finalCommit);
  await GitHelper.push();

  stdout.writeln('🚀 Commit created & pushed successfully!');
}

String _chooseCommitType() {
  final types = [
    'FEAT',
    'CHORE',
    'FIX',
    'BUG',
    'REFACTOR',
    'DOCS',
    'TEST',
    'STYLE',
  ];

  stdout.writeln('\nSelect commit type:');
  for (var i = 0; i < types.length; i++) {
    stdout.writeln('${i + 1}. ${types[i]}');
  }

  stdout.write('\nEnter choice: ');
  final input = stdin.readLineSync();
  final index = int.tryParse(input ?? '') ?? -1;
  if (index < 1 || index > types.length) {
    stderr.writeln('❌ Invalid selection.');
    exit(1);
  }
  return types[index - 1];
}
