import 'package:flutter/material.dart';
import 'package:movies_booking_app/common/extensions/num.dart';
import 'package:movies_booking_app/common/widgets/app_text.dart';
import 'package:movies_booking_app/util/resources/r.dart';

class GenresSectionWidget extends StatelessWidget {
  final List<String> genres;

  // List of colors to use for the chips
  final List<Color> chipColors = [
    R.colors.red_FF3B30,
    R.colors.yellow_F4BF37,
    R.colors.grey_97A2B0,
    R.colors.purple_2E2739,
  ];

  GenresSectionWidget({
    super.key,
    required this.genres,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        20.hb,
        AppText(
          text: 'Genres',
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: R.colors.purple_202C43,
        ),
        8.hb,
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: List.generate(
            genres.length,
            (index) => Chip(
              label: AppText(
                text: genres[index],
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: R.colors.white_FFFFFF,
              ),
              backgroundColor: chipColors[index % chipColors.length],
            ),
          ),
        ),
      ],
    );
  }
}
