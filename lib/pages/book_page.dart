import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:litres_mobile/widgets/drawer.dart';
import 'package:litres_mobile/widgets/header.dart';
import '../styles/app_styles.dart';
import '../widgets/footer.dart';
import '../components/rounded_image.dart';
import '../components/book_card.dart';
import '../components/review_card.dart';

class BookPage extends StatefulWidget {
  const BookPage({super.key});

  @override
  _BookPageState createState() => _BookPageState();
}

class _BookPageState extends State<BookPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void _openCartDrawer() {
    _scaffoldKey.currentState?.openEndDrawer();
  }

  // -- MOCKS START --
  final Map<String, dynamic> book = {
    'coverImage': 'assets/images/COVER_BOOK.gif',
    'name': 'Book name',
    'author': 'Author name',
    'price': '1337',
    'description': 'You Better Not Lie, I��m Telling You Why�� I��m Sorry! Blame-Game or Accountability? I��m Riding a What?... An Intellectual Property Attorney��s Guide To Patents and Surfing It��s My Blankey and I��m Keeping It! I��m Not Depressed; I��ve Just Been Having A Lousy Conversation With Myself I��m Gettin�� Really Torqued! Im Not Responsible - You Are! Brin in the Coach, Im Ready to Play Im Sorry But......... I Beg Your Pardon - Is Chivalry Dead?',
    'reviews': [
      {
        'avatar': 'assets/images/avatar1.png',
        'username': 'Reader123',
        'date': '03.05.2025',
        'comment': 'Очень понравилась книга! Захватывающе.',
        'replies': ['Согласен с вами!', 'А мне не очень зашло.'],
      },
      {
        'avatar': 'assets/images/avatar2.png',
        'username': 'BookLover',
        'date': '01.05.2025',
        'comment': 'Местами затянуто, но в целом неплохо.',
        'replies': [],
      },
    ]
  };
  final List<Map<String, String>> myBooks = [
    {'image': 'assets/images/COVER_BOOK.gif', 'author': 'Name Author'},
    {'image': 'assets/images/COVER_BOOK.gif', 'author': 'Another Author'},
    {'image': 'assets/images/COVER_BOOK.gif', 'author': 'Third Author'},
  ];
  // -- MOCKS END --

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(56),
        child: Header(onCartPressed: _openCartDrawer),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Book image card
                    Center(
                      child: RoundedImage(
                        image: AssetImage(book['coverImage']!),
                        width: 200,
                        height: 200,
                      ),
                    ),
                    const SizedBox(height: 24),

                    // Book name label
                    Center(
                      child: Text(
                        book['name']!,
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium
                            ?.copyWith(letterSpacing: 2),
                      ),
                    ),
                    const SizedBox(height: 12),

                    // Author name with dotted border
                    DottedBorder(
                      borderType: BorderType.RRect,
                      radius: Radius.circular(AppStyles.borderRadius),
                      dashPattern: [6, 3],
                      color: Colors.grey,
                      padding: EdgeInsets.all(4),
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(
                            vertical: 12, horizontal: 16),
                        child: Text(
                          'Author: ${book['author']!}',
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Description with dotted border
                    DottedBorder(
                      borderType: BorderType.RRect,
                      radius: Radius.circular(AppStyles.borderRadius),
                      dashPattern: [6, 3],
                      color: Colors.grey,
                      padding: EdgeInsets.all(4),
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(
                            vertical: 12, horizontal: 16),
                        child: Text(
                          book['description']!,
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Balance and add coins button
                    Row(
                      children: [
                        Text(
                          'PRICE:',
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          '${book['price']!}\$',
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall
                              ?.copyWith(color: Colors.deepOrange),
                        ),
                        Spacer(),
                        ElevatedButton.icon(
                          onPressed: () {},
                          icon: Icon(Icons.add),
                          label: Icon(Icons.monetization_on_outlined),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.amber,
                            foregroundColor: Colors.black,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  AppStyles.borderRadius),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),

                    // My Books slider section
                    Text(
                      'LIKE THIS',
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium
                          ?.copyWith(letterSpacing: 2),
                    ),
                    const SizedBox(height: 12),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.35,
                      child: Expanded(
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: myBooks.map((book) {
                              return BookCard(
                                image: book['image']!,
                                author: book['author']!,
                                onRead: () {},
                              );
                            }).toList(),
                          )
                      ),
                    ),
                    const SizedBox(height: 12),
                    Column(
                      children: (book['reviews'] as List).map((review) {
                        return ReviewCard(
                          avatarUrl: review['avatar'],
                          username: review['username'],
                          date: review['date'],
                          comment: review['comment'],
                          replies: List<String>.from(review['replies']),
                        );
                      }).toList(),
                    ),
                    Footer()
                  ],
                )
            ),
          )
      ),
      endDrawer: CartDrawer(),
    );
  }
}
