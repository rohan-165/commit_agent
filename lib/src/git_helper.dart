import 'dart:io';

/// Helper class for Git operations.
/// This class provides methods to stage changes, get diffs, commit changes, and push to a remote repository.

class GitHelper {
  static Future<void> stageAll() async {
    await Process.run('git', ['add', '.']);
  }

  static Future<String> getStagedDiff() async {
    final result = await Process.run('git', ['diff', '--cached']);
    return result.stdout.toString();
  }

  static Future<void> commit(String message) async {
    await Process.run('git', ['commit', '-m', message]);
  }

  static Future<void> push() async {
    await Process.run('git', ['push', 'origin', 'HEAD']);
  }
}
