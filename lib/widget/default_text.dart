import 'package:flutter/material.dart';

class DefaultText extends StatefulWidget {
  const DefaultText({super.key});

  @override
  State<DefaultText> createState() => _DefaultTextState();
}

class _DefaultTextState extends State<DefaultText> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: const Text(
        "Hare Krishna\nHare Krishna\nKrishna Krishna\nHare Hare\n Hare Rama\nHare Rama\nRama Rama\nHare Hare",
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w600,
          color: Colors.grey,
          height: 1.4,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
