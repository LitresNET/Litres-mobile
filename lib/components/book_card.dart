import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import '../styles/app_styles.dart';
import '../components/rounded_image.dart';

class BookCard extends StatelessWidget {
  final String image;
  final String author;
  final String name;

  const BookCard({super.key, required this.name, required this.image, required this.author});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      margin: const EdgeInsets.only(right: 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RoundedImage(image: AssetImage(image), width: 160, height: 200),
          const SizedBox(height: 8),
          SizedBox(
            child: DottedBorder(
              borderType: BorderType.RRect,
              radius: Radius.circular(AppStyles.borderRadius),
              dashPattern: [6, 3],
              color: Colors.grey,
              padding: EdgeInsets.all(4),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Name: $name',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    Text(
                      'Author: $author',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                )
              ),
            ),
          ),
          const SizedBox(height: 8),
          SizedBox(
            width: double.infinity,
            height: 42,
            child: ElevatedButton(
              onPressed:
                  () => Navigator.pushNamed(
                    context,
                    "/book",
                    arguments: {'image': image, 'author': author},
                  ),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.zero,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppStyles.borderRadius),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Read'),
                  const SizedBox(width: 8),
                  Icon(Icons.edit, size: 16),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
