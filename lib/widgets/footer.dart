import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:dotted_border/dotted_border.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
      child: Column(
        children: [
          DottedBorder(
            dashPattern: [4, 4],
            color: Colors.grey,
            child: SizedBox(width: double.infinity, height: 1),
          ),
          const SizedBox(height: 12),
          Text(
            'BookStore Project',
            style: Theme
                .of(context)
                .textTheme
                .headlineMedium,
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: FaIcon(FontAwesomeIcons.linkedinIn),
                onPressed: () {},
              ),
              const SizedBox(width: 16),
              IconButton(
                icon: FaIcon(FontAwesomeIcons.github),
                onPressed: () {},
              ),
              const SizedBox(width: 16),
              IconButton(
                icon: FaIcon(FontAwesomeIcons.figma),
                onPressed: () {},
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            'by durashkas',
            style: Theme
                .of(context)
                .textTheme
                .bodyMedium,
          ),
        ],
      ),
    );
  }
}