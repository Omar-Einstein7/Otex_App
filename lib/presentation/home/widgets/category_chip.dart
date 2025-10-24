import 'package:flutter/material.dart';

class CategoryChip extends StatelessWidget {
  final String label;
  final bool selected;
  final VoidCallback? onSelected;

  const CategoryChip({super.key, required this.label, this.selected = false, this.onSelected});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ChoiceChip(
      showCheckmark: false,
      label: Text(label),
      selected: selected,
      onSelected: (value) {
        onSelected?.call();
      },
      selectedColor: Color.fromRGBO(249, 91, 28, 0.05),
      backgroundColor: theme.colorScheme.surface,
      labelStyle: TextStyle(
        color: selected
            ? Color(0xffF95B1C)
            : theme.colorScheme.onSurface,
      ),
    );
  }
}