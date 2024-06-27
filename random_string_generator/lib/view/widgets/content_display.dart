import 'package:flutter/material.dart';

class ContentDisplay extends StatelessWidget {
  final IconData icon;
  final String message;
  final String? content;
  final Color color;

  const ContentDisplay({
    super.key,
    required this.icon,
    required this.message,
    this.content,
    this.color = Colors.blue,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * .6,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 50, color: color),
          const SizedBox(height: 20),
          Text(
            message,
            style: TextStyle(fontSize: 18, color: color),
            textAlign: TextAlign.center,
          ),
          if (content != null) ...[
            const SizedBox(height: 10),
            Text(
              content!,
              style: TextStyle(
                  fontSize: 22, fontWeight: FontWeight.bold, color: color),
              textAlign: TextAlign.center,
            ),
          ],
        ],
      ),
    );
  }
}
