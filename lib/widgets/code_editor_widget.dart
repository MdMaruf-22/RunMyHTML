import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_code_editor/flutter_code_editor.dart';
import 'package:flutter_highlight/themes/github.dart';
import 'package:flutter_highlight/themes/vs2015.dart';
import 'package:highlight/languages/xml.dart';
import 'package:provider/provider.dart';
import '../providers/theme_provider.dart';
import '../providers/file_provider.dart';

class CodeEditorWidget extends StatefulWidget {
  final Function(String) onContentChanged;
  final VoidCallback onRunPressed;

  const CodeEditorWidget({
    super.key,
    required this.onContentChanged,
    required this.onRunPressed,
  });

  @override
  State<CodeEditorWidget> createState() => _CodeEditorWidgetState();
}

class _CodeEditorWidgetState extends State<CodeEditorWidget> {
  late CodeController _controller;
  Timer? _debounceTimer;
  bool _autoRun = true;

  @override
  void initState() {
    super.initState();
    final fileProvider = Provider.of<FileProvider>(context, listen: false);

    _controller = CodeController(text: fileProvider.htmlContent, language: xml);

    print("CodeEditor Initialized with content: ${fileProvider.htmlContent}");

    _controller.addListener(_onCodeChanged);
  }

  void _onCodeChanged() {
    final content = _controller.fullText;
    widget.onContentChanged(content);
    final fileProvider = Provider.of<FileProvider>(context, listen: false);
    fileProvider.updateContent(content);

    if (_autoRun) {
      _debounceTimer?.cancel();
      _debounceTimer = Timer(const Duration(milliseconds: 800), () {
        widget.onRunPressed();
      });
    }
  }

  @override
  void dispose() {
    _debounceTimer?.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final fileProvider = Provider.of<FileProvider>(context);

    return Container(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.code, size: 16),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  'HTML/CSS Editor - ${fileProvider.currentFileName}${fileProvider.hasUnsavedChanges ? '*' : ''}',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
              ),
              // Auto-run toggle
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Auto-run', style: TextStyle(fontSize: 12)),
                  Switch(
                    value: _autoRun,
                    onChanged: (value) {
                      setState(() {
                        _autoRun = value;
                      });
                    },
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                ],
              ),
              const SizedBox(width: 8),
              ElevatedButton.icon(
                onPressed: widget.onRunPressed,
                icon: const Icon(Icons.play_arrow, size: 16),
                label: const Text('Run'),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 8,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(4),
              ),
              child: CodeTheme(
                data: themeProvider.isDarkMode
                    ? CodeThemeData(styles: vs2015Theme)
                    : CodeThemeData(styles: githubTheme),
                child: SingleChildScrollView(
                  child: CodeField(
                    controller: _controller,
                    textStyle: const TextStyle(
                      fontFamily: 'monospace',
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
