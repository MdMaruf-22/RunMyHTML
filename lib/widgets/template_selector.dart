import 'package:flutter/material.dart';
import '../constants/templates.dart';
import '../models/html_template.dart';

class TemplateSelector extends StatelessWidget {
  final Function(HtmlTemplate) onTemplateSelected;

  const TemplateSelector({super.key, required this.onTemplateSelected});

  @override
  Widget build(BuildContext context) {
    final Map<String, List<HtmlTemplate>> groupedTemplates = {};
    for (final template in Templates.templates) {
      if (!groupedTemplates.containsKey(template.category)) {
        groupedTemplates[template.category] = [];
      }
      groupedTemplates[template.category]!.add(template);
    }

    return Dialog(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.8,
        height: MediaQuery.of(context).size.height * 0.7,
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Choose a Template',
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: groupedTemplates.keys.length,
                itemBuilder: (context, categoryIndex) {
                  final category = groupedTemplates.keys.elementAt(
                    categoryIndex,
                  );
                  final templates = groupedTemplates[category]!;

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Text(
                          category,
                          style: Theme.of(context).textTheme.titleMedium
                              ?.copyWith(
                                fontWeight: FontWeight.w600,
                                color: Theme.of(context).primaryColor,
                              ),
                        ),
                      ),
                      ...templates.map(
                        (template) => _TemplateCard(
                          template: template,
                          onTap: () {
                            onTemplateSelected(template);
                            Navigator.of(context).pop();
                          },
                        ),
                      ),
                      const SizedBox(height: 20),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _TemplateCard extends StatelessWidget {
  final HtmlTemplate template;
  final VoidCallback onTap;

  const _TemplateCard({required this.template, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(8),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Icon(
                _getIconForCategory(template.category),
                size: 32,
                color: Theme.of(context).primaryColor,
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      template.name,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      template.description,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Theme.of(
                          context,
                        ).textTheme.bodyMedium?.color?.withOpacity(0.7),
                      ),
                    ),
                  ],
                ),
              ),
              const Icon(Icons.arrow_forward_ios, size: 16),
            ],
          ),
        ),
      ),
    );
  }

  IconData _getIconForCategory(String category) {
    switch (category.toLowerCase()) {
      case 'basic':
        return Icons.article_outlined;
      case 'layout':
        return Icons.dashboard_outlined;
      case 'form':
        return Icons.assignment_outlined;
      case 'animation':
        return Icons.animation_outlined;
      case 'component':
        return Icons.widgets_outlined;
      default:
        return Icons.code;
    }
  }
}
