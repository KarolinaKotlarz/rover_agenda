/// Dart import
import 'dart:ui';

/// Package import
import 'package:flutter/cupertino.dart';

class OnboardingCardData {
  final String title;
  final String subtitle;
  final ImageProvider image;
  final Color backgroundColor;
  final Color titleColor;
  final Color subtitleColor;

  const OnboardingCardData({
    required this.title,
    required this.subtitle,
    required this.image,
    required this.backgroundColor,
    required this.titleColor,
    required this.subtitleColor,
  });
}

class OnboardingCard extends StatelessWidget {
  const OnboardingCard({required this.data, Key? key}) : super(key: key);

  final OnboardingCardData data;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 40
      ),
      child: Column(
        children: [
          const Spacer(flex: 3),
          Flexible(
            flex: 20,
              child: Image(image: data.image)
          ),
          const Spacer(flex: 1),
          Text(
            data.title.toUpperCase(),
            style: TextStyle(
              color: data.titleColor,
              fontSize: 18,
              fontWeight: FontWeight.bold,
              letterSpacing: 1,
            ),
            maxLines: 1,
          ),
          const Spacer(flex: 1),
          Text(
              data.subtitle,
            style: TextStyle(
              color: data.subtitleColor,
              fontSize: 16,
            ),
            textAlign: TextAlign.center,
            maxLines: 4,
          ),
          const Spacer(flex: 10)
        ],
      )
    );
  }
}