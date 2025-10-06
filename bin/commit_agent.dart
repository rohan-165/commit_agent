// 📦 commit_agent CLI
// ------------------------------------------------------------
// This script allows users to run the Commit Agent directly
// from the command line using:
//
//   dart run commit_agent
//
// ------------------------------------------------------------

import 'dart:io';
import 'package:commit_agent/commit_agent.dart';

Future<void> main(List<String> args) async {
  // 1. Get API key (prefer environment variable)
  final apiKey = Platform.environment['OPENAI_API_KEY'];

  if (apiKey == null || apiKey.isEmpty) {
    stderr.writeln('❌ Missing OpenAI API key.');
    stderr.writeln(
      'Please set OPENAI_API_KEY environment variable or pass it as an argument.',
    );
    stderr.writeln('\nUsage:');
    stderr.writeln('  dart run commit_agent <your-api-key>');
    exit(1);
  }

  // 2. Initialize Commit Agent
  initCommitAgent(openAIKey: apiKey);

  // 3. Run the interactive commit process
  await runCommitAgent();
}
