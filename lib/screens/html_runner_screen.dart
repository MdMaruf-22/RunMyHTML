import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:run_my_html/models/lesson.dart';
import 'package:run_my_html/screens/lessons_screen.dart';
import '../providers/theme_provider.dart';
import '../providers/file_provider.dart';
import '../widgets/code_editor_widget.dart';
import '../widgets/preview_widget.dart';
import '../widgets/template_selector.dart';
import '../constants/templates.dart';

class HtmlRunnerScreen extends StatefulWidget {
  final int lessonIndex;

  const HtmlRunnerScreen({super.key, required this.lessonIndex});

  @override
  State<HtmlRunnerScreen> createState() => _HtmlRunnerScreenState();
}

class _HtmlRunnerScreenState extends State<HtmlRunnerScreen> {
  String _currentHtmlContent = '';
  bool _isPreviewMode = false;
  late int _currentLessonIndex;

  List<Lesson> lessons = Lesson.getAllLessons();

  @override
  void initState() {
    super.initState();
    _currentLessonIndex = widget.lessonIndex;
    _currentHtmlContent = lessons[widget.lessonIndex].codeExample;

    final fileProvider = Provider.of<FileProvider>(context, listen: false);
    fileProvider.setContent(_currentHtmlContent, markUnsaved: false);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {});
    });
  }

  void _onContentChanged(String content) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        setState(() {
          _currentHtmlContent = content;
        });
      }
    });
  }

  void _runHtml() {
    setState(() {});
  }

  void _toggleView() {
    setState(() {
      _isPreviewMode = !_isPreviewMode;
    });
  }

  void _showTemplateSelector() {
    showDialog(
      context: context,
      builder: (context) => TemplateSelector(
        onTemplateSelected: (template) {
          final fileProvider = Provider.of<FileProvider>(
            context,
            listen: false,
          );
          fileProvider.setContent(template.content, markUnsaved: true);
          setState(() {
            _currentHtmlContent = template.content;
          });
        },
      ),
    );
  }

  Future<void> _showFileDialog() async {
    final fileProvider = Provider.of<FileProvider>(context, listen: false);

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text(
          'File Options',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.add, color: Colors.blue),
              title: const Text(
                'New File',
                style: TextStyle(color: Colors.blue),
              ),
              onTap: () {
                Navigator.pop(context);
                fileProvider.newFile();
                setState(() {
                  _currentHtmlContent = '';
                });
              },
            ),
            ListTile(
              leading: const Icon(Icons.save, color: Colors.green),
              title: const Text(
                'Save File',
                style: TextStyle(color: Colors.green),
              ),
              onTap: () async {
                Navigator.pop(context);
                await _showSaveDialog();
              },
            ),
            ListTile(
              leading: const Icon(Icons.folder_open, color: Colors.orange),
              title: const Text(
                'Open File',
                style: TextStyle(color: Colors.orange),
              ),
              onTap: () async {
                Navigator.pop(context);
                await _showOpenDialog();
              },
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _showSaveDialog() async {
    final fileProvider = Provider.of<FileProvider>(context, listen: false);
    final TextEditingController nameController = TextEditingController(
      text: fileProvider.currentFileName.replaceAll('.html', ''),
    );

    final result = await showDialog<String>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text(
          'Save File',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        content: TextField(
          controller: nameController,
          decoration: const InputDecoration(
            labelText: 'File Name',
            suffixText: '.html',
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.blue),
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel', style: TextStyle(color: Colors.red)),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context, nameController.text);
            },
            child: const Text('Save', style: TextStyle(color: Colors.green)),
          ),
        ],
      ),
    );

    if (result != null && result.isNotEmpty) {
      final fileName = result.endsWith('.html') ? result : '$result.html';
      final success = await fileProvider.saveFile(fileName);

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              success ? 'File saved successfully' : 'Failed to save file',
            ),
            backgroundColor: success ? Colors.green : Colors.red,
          ),
        );
      }
    }
  }

  Future<void> _showOpenDialog() async {
    final fileProvider = Provider.of<FileProvider>(context, listen: false);
    final files = await fileProvider.getSavedFiles();

    if (!mounted) return;

    if (files.isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('No saved files found')));
      return;
    }

    final result = await showDialog<String>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text(
          'Open File',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        content: SizedBox(
          width: double.maxFinite,
          height: 300,
          child: ListView.builder(
            itemCount: files.length,
            itemBuilder: (context, index) {
              final fileName = files[index];
              return ListTile(
                leading: const Icon(Icons.file_present, color: Colors.blue),
                title: Text(fileName),
                trailing: IconButton(
                  icon: const Icon(Icons.delete, color: Colors.red),
                  onPressed: () async {
                    final confirm = await showDialog<bool>(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text('Delete File'),
                        content: Text(
                          'Are you sure you want to delete $fileName?',
                        ),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context, false),
                            child: const Text('Cancel'),
                          ),
                          TextButton(
                            onPressed: () => Navigator.pop(context, true),
                            child: const Text('Delete'),
                          ),
                        ],
                      ),
                    );

                    if (confirm == true) {
                      await fileProvider.deleteFile(fileName);
                      Navigator.pop(context);
                      _showOpenDialog();
                    }
                  },
                ),
                onTap: () => Navigator.pop(context, fileName),
              );
            },
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );

    if (result != null) {
      final success = await fileProvider.loadFile(result);
      if (success) {
        setState(() {
          _currentHtmlContent = fileProvider.htmlContent;
        });
      }

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              success ? 'File loaded successfully' : 'Failed to load file',
            ),
            backgroundColor: success ? Colors.green : Colors.red,
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final fileProvider = Provider.of<FileProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'RunMyHTML - ${fileProvider.currentFileName}${fileProvider.hasUnsavedChanges ? '*' : ''}',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
        actions: [
          IconButton(
            icon: const Icon(Icons.folder, color: Colors.white),
            onPressed: _showFileDialog,
            tooltip: 'File Options',
          ),
          IconButton(
            icon: const Icon(Icons.book, color: Colors.white),
            onPressed: _navigateToLessonsScreen,
            tooltip: 'Lessons',
          ),
          IconButton(
            icon: const Icon(Icons.library_books, color: Colors.white),
            onPressed: _showTemplateSelector,
            tooltip: 'Templates',
          ),
          IconButton(
            icon: Icon(
              _isPreviewMode ? Icons.code : Icons.preview,
              color: Colors.white,
            ),
            onPressed: _toggleView,
            tooltip: _isPreviewMode ? 'Show Code' : 'Show Preview',
          ),
        ],
      ),
      body: _isPreviewMode
          ? PreviewWidget(htmlContent: _currentHtmlContent)
          : OrientationBuilder(
              builder: (context, orientation) {
                return orientation == Orientation.portrait
                    ? _buildVerticalLayout()
                    : _buildHorizontalLayout();
              },
            ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.folder), label: 'File'),
          BottomNavigationBarItem(icon: Icon(Icons.book), label: 'Lessons'),
          BottomNavigationBarItem(icon: Icon(Icons.preview), label: 'Preview'),
          BottomNavigationBarItem(
            icon: Icon(Icons.library_books),
            label: 'Templates',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.info), label: 'About'),
        ],
        currentIndex: 2,
        onTap: (index) {
          switch (index) {
            case 0:
              _showFileDialog();
              break;
            case 1:
              _navigateToLessonsScreen();
              break;
            case 2:
              _toggleView();
              break;
            case 3:
              _showTemplateSelector();
              break;
            case 4:
              _showDeveloperInfo();
              break;
          }
        },
      ),
    );
  }

  void _showDeveloperInfo() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Developer Information'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'Developed by Mohammed Maruf Islam',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text('Email: maruf2516@student.nstu.edu.bd'),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Close', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }

  Widget _buildVerticalLayout() {
    return Column(
      children: [
        Expanded(
          flex: 1,
          child: CodeEditorWidget(
            onContentChanged: _onContentChanged,
            onRunPressed: _runHtml,
          ),
        ),
        const Divider(height: 1),
        Expanded(
          flex: 1,
          child: PreviewWidget(htmlContent: _currentHtmlContent),
        ),
      ],
    );
  }

  Widget _buildHorizontalLayout() {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: CodeEditorWidget(
            onContentChanged: _onContentChanged,
            onRunPressed: _runHtml,
          ),
        ),
        const VerticalDivider(width: 1),
        Expanded(
          flex: 1,
          child: PreviewWidget(htmlContent: _currentHtmlContent),
        ),
      ],
    );
  }

  void _navigateToLessonsScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const LessonsScreen()),
    );
  }
}
