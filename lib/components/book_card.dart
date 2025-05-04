import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import '../styles/app_styles.dart';
import '../components/rounded_image.dart';

class BookCard extends StatelessWidget {
  final String image;
  final String author;
  final VoidCallback onRead;

  const BookCard({
    super.key,
    required this.image,
    required this.author,
    required this.onRead,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      margin: const EdgeInsets.only(right: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RoundedImage(
            image: AssetImage(image),
            width: 160,
            height: 200,
          ),
          const SizedBox(height: 8),
          DottedBorder(
            borderType: BorderType.RRect,
            radius: Radius.circular(AppStyles.borderRadius),
            dashPattern: [6, 3],
            color: Colors.grey,
            padding: EdgeInsets.all(4),
            child: Container(
              width: double.infinity,
              height: 48,
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
              child: Text(
                'Author: $author',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ),
          ),
          const SizedBox(height: 8),
          ElevatedButton(
            onPressed: onRead,
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppStyles.borderRadius),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Read'),
                const SizedBox(width: 4),
                Icon(Icons.edit, size: 16),
              ],
            ),
          ),
        ],
      ),
    );
  }
}