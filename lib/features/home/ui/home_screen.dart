import 'package:flutter/material.dart';
import '../../../core/widgets/app_app_bar.dart';
import '../../../core/widgets/app_text.dart';
import '../widgets/custom_input_field.dart';
import '../widgets/display_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _controller = TextEditingController();
  String _displayText = '';

  void _submitText() {
    final text = _controller.text.trim();
    if (text.isEmpty) return;

    setState(() {
      _displayText = text;
      _controller.clear();
    });

    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text(
          '✅ Text submitted successfully!',
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
        ),
        backgroundColor: const Color(0xFF6C63FF),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        margin: const EdgeInsets.all(16),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF450693),
      appBar: const AppAppBar(title: "Data Entry"),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CustomInputField(
              controller: _controller,
              onSubmit: _submitText,
              hintText: 'Enter something...',
              multiline: true,
            ),
            const SizedBox(height: 24),
            Expanded(
              child: _displayText.isEmpty
                  ? Center(
                    child: const AppText(
                                    title: '💬 Start typing and submit to see your text!',
                                    color: Colors.white,
                                    fontSize: 16,
                                  ),
                  )
                  : DisplayCard(text: _displayText),
            ),
          ],
        ),
      ),
    );
  }
}
