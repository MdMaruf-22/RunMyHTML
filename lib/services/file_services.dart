import 'dart:io';
import 'package:path_provider/path_provider.dart';

class FileServices {
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    final htmlRunnerDir = Directory('${directory.path}/html_runner');
    if (!await htmlRunnerDir.exists()) {
      await htmlRunnerDir.create(recursive: true);
    }
    return htmlRunnerDir.path;
  }

  Future<File> _localFile(String fileName) async {
    final path = await _localPath;
    return File('$path/$fileName');
  }

  Future<void> saveFile(String fileName, String content) async {
    final file = await _localFile(fileName);
    await file.writeAsString(content);
  }

  Future<String> loadFile(String fileName) async {
    try {
      final file = await _localFile(fileName);
      return await file.readAsString();
    } catch (e) {
      throw Exception('Failed to load file: $e');
    }
  }

  Future<List<String>> getSavedFiles() async {
    try {
      final path = await _localPath;
      final directory = Directory(path);
      final files = await directory.list().toList();

      return files
          .where((file) => file is File && file.path.endsWith('.html'))
          .map((file) => file.path.split('/').last)
          .toList();
    } catch (e) {
      return [];
    }
  }

  Future<void> deleteFile(String fileName) async {
    final file = await _localFile(fileName);
    if (await file.exists()) {
      await file.delete();
    } else {
      throw Exception('File not found');
    }
  }
}
