import 'package:flutter/material.dart';

class ReviewCard extends StatefulWidget {
  final String avatarUrl;
  final String username;
  final String date;
  final String comment;
  final List<String> replies;

  const ReviewCard({
    super.key,
    required this.avatarUrl,
    required this.username,
    required this.date,
    required this.comment,
    this.replies = const [],
  });

  @override
  State<ReviewCard> createState() => _ReviewCardState();
}

class _ReviewCardState extends State<ReviewCard> {
  bool _showReplies = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.symmetric(vertical: 6),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(12),
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 24,
            backgroundImage: AssetImage(widget.avatarUrl),
          ),
          const SizedBox(width: 12),

          // Text card
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Nickname and date
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.username,
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      widget.date,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.grey),
                    ),
                  ],
                ),
                const SizedBox(height: 4),

                // Comment
                Text(
                  widget.comment,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(height: 8),

                // Show replies
                if (widget.replies.isNotEmpty)
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _showReplies = !_showReplies;
                      });
                    },
                    child: Text(
                      _showReplies ? 'Hide replies' : 'Show replies',
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),

                // Replies
                if (_showReplies)
                  ...widget.replies.map((reply) => Padding(
                    padding: const EdgeInsets.only(top: 6, left: 8),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Icon(Icons.reply, size: 16, color: Colors.grey),
                        const SizedBox(width: 6),
                        Expanded(
                          child: Text(
                            reply,
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ),
                      ],
                    ),
                  )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
