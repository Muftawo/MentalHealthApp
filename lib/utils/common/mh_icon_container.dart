import 'package:flutter/material.dart';
import 'package:mentalhealthapp/utils/constants/colors.dart';
import 'package:mentalhealthapp/utils/constants/sizes.dart';

class MhIconContainer extends StatelessWidget {
  const MhIconContainer({
    super.key,
    this.containerColor,
    this.icon,
    this.iconColor,
  });

  final Color? containerColor;
  final IconData? icon;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: containerColor,
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.all(8),
      child: Icon(
        icon,
        color: iconColor,
      ),
    );
  }
}

class FeelingEmojiTile extends StatelessWidget {
  const FeelingEmojiTile({
    super.key,
    this.containerColor,
    this.emoji,
    this.feelingText,
  });

  final Color? containerColor;
  final String? emoji;
  final String? feelingText;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: containerColor,
            borderRadius: BorderRadius.circular(10),
          ),
          padding: const EdgeInsets.all(8),
          child: Text(
            emoji!,
            style: const TextStyle(fontSize: 30),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          feelingText!,
          style: const TextStyle(
              color: MhColors.textPrimary, fontSize: MhSizes.fontSizeSmall),
        )
      ],
    );
  }
}
