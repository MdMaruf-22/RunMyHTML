import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PreviewWidget extends StatefulWidget {
  final String htmlContent;

  const PreviewWidget({super.key, required this.htmlContent});

  @override
  State<PreviewWidget> createState() => _PreviewWidgetState();
}

class _PreviewWidgetState extends State<PreviewWidget> {
  late WebViewController controller;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageStarted: (String url) {
            setState(() {
              _isLoading = true;
            });
          },
          onPageFinished: (String url) {
            setState(() {
              _isLoading = false;
            });
          },
        ),
      );

    _loadHtml();
  }

  @override
  void didUpdateWidget(PreviewWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.htmlContent != widget.htmlContent) {
      _loadHtml();
    }
  }

  void _loadHtml() {
    if (widget.htmlContent != null && widget.htmlContent.isNotEmpty) {
      controller.loadHtmlString(widget.htmlContent);
    } else {}
  }

  void _refreshPreview() {
    _loadHtml();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.preview, size: 16),
              const SizedBox(width: 8),
              const Text(
                'Preview',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              ),
              const Spacer(),
              if (_isLoading)
                const SizedBox(
                  width: 16,
                  height: 16,
                  child: CircularProgressIndicator(strokeWidth: 2),
                ),
              const SizedBox(width: 8),
              IconButton(
                icon: const Icon(Icons.refresh, size: 16),
                onPressed: _refreshPreview,
                tooltip: 'Refresh Preview',
                constraints: const BoxConstraints(minWidth: 32, minHeight: 32),
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
              child: ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: Stack(
                  children: [
                    WebViewWidget(controller: controller),
                    if (_isLoading)
                      Container(
                        color: Colors.white.withOpacity(0.8),
                        child: const Center(child: CircularProgressIndicator()),
                      ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
