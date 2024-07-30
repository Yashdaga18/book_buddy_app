import 'package:flutter/material.dart';

class LanguageDropdown extends StatelessWidget {
  final String value;
  final ValueChanged<String?> onChanged;

  const LanguageDropdown({
    Key? key,
    required this.value,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: value,
      items: const [
        DropdownMenuItem(value: 'en', child: Text('English')),
        DropdownMenuItem(value: 'es', child: Text('Español')),
      ],
      onChanged: onChanged,
    );
  }
}
