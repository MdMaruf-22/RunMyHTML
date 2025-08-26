import 'package:flutter/material.dart';
import '../services/file_services.dart';

class FileProvider extends ChangeNotifier {
  final FileServices _fileService = FileServices();
  String _currentFileName = 'Untitled.html';
  String _htmlContent = '';
  bool _hasUnsavedChanges = false;

  String get currentFileName => _currentFileName;
  String get htmlContent => _htmlContent;
  bool get hasUnsavedChanges => _hasUnsavedChanges;

  void updateContent(String content) {
    _htmlContent = content;
    _hasUnsavedChanges = true;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      notifyListeners();
    });
  }

  Future<bool> saveFile(String? fileName) async {
    try {
      final name = fileName ?? _currentFileName;
      await _fileService.saveFile(name, _htmlContent);
      _currentFileName = name;
      _hasUnsavedChanges = false;
      notifyListeners();
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> loadFile(String fileName) async {
    try {
      final content = await _fileService.loadFile(fileName);
      _htmlContent = content;
      _currentFileName = fileName;
      _hasUnsavedChanges = false;
      notifyListeners();
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> deleteFile(String fileName) async {
    try {
      await _fileService.deleteFile(fileName);
      if (fileName == _currentFileName) {
        _currentFileName = 'Untitled.html';
        _htmlContent = '';
        _hasUnsavedChanges = false;
      }
      notifyListeners();
      return true;
    } catch (e) {
      return false;
    }
  }

  void newFile() {
    _currentFileName = 'Untitled.html';
    _htmlContent = '';
    _hasUnsavedChanges = false;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      notifyListeners();
    });
  }

  void setContent(String content, {bool markUnsaved = false}) {
    _htmlContent = content;
    _hasUnsavedChanges = markUnsaved;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      notifyListeners();
    });
  }

  //Get saved files
  Future<List<String>> getSavedFiles() async {
    return await _fileService.getSavedFiles();
  }
}
