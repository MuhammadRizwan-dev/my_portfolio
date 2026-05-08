import 'package:flutter/material.dart';
import 'package:my_portfolio/utils/app_colors.dart';

class TypingText extends StatefulWidget {
  final List<String> texts;
  final TextStyle style;
  const TypingText({super.key, required this.texts, required this.style});

  @override
  State<TypingText> createState() => _TypingTextState();
}

class _TypingTextState extends State<TypingText> {
  int _textIndex = 0;
  int _charIndex = 0;
  bool _isDeleting = false;
  String _displayText = '';

  @override
  void initState() {
    super.initState();
    _startTyping();
  }

  void _startTyping() async {
    await Future.delayed(const Duration(milliseconds: 100));
    if (!mounted) return;

    final currentText = widget.texts[_textIndex];

    if (!_isDeleting && _charIndex < currentText.length) {
      _charIndex++;
    } else if (_isDeleting && _charIndex > 0) {
      _charIndex--;
    } else if (!_isDeleting && _charIndex == currentText.length) {
      await Future.delayed(const Duration(milliseconds: 1500));
      _isDeleting = true;
    } else if (_isDeleting && _charIndex == 0) {
      _isDeleting = false;
      _textIndex = (_textIndex + 1) % widget.texts.length;
    }

    if (mounted) {
      setState(() {
        _displayText = currentText.substring(0, _charIndex);
      });
      _startTyping();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(_displayText, style: widget.style),
        Text(
          '|',
          style: widget.style.copyWith(color: AppColors.primaryBlue),
        ),
      ],
    );
  }
}