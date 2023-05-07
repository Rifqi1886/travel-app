import 'package:flutter/material.dart';
import '../../shared/theme.dart';

class BookingDetailsItem extends StatelessWidget {
  final String title;
  final String valueText;
  final Color valueColor;

  const BookingDetailsItem({
    Key? key,
    required this.title,
    required this.valueColor,
    required this.valueText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 16),
      child: Row(
        children: [
          Container(
            width: 16,
            height: 16,
            margin: const EdgeInsets.only(right: 6),
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  'assets/images/icon_check.png',
                ),
              ),
            ),
          ),
          Text(title, style: blackTextStyle),
          const Spacer(),
          Text(
            valueText,
            style: blackTextStyle.copyWith(
              fontSize: 16,
              fontWeight: semiBold,
              color: valueColor,
            ),
          )
        ],
      ),
    );
  }
}