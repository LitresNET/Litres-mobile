import 'package:flutter/material.dart';
import 'package:litres_mobile/widgets/drawer.dart';
import '../components/book_card.dart';
import '../widgets/header.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void _openCardDrawer() {
    _scaffoldKey.currentState?.openEndDrawer();
  }

  // -- MOCKS START --
  final List<Map<String, String>> trendingBooks = [
    {'image': 'assets/images/COVER_BOOK.gif', 'author': 'Name Author'},
    {'image': 'assets/images/COVER_BOOK.gif', 'author': 'Another Author'},
    {'image': 'assets/images/COVER_BOOK.gif', 'author': 'Third Author'},
    {
      'image': 'assets/images/COVER_BOOK.gif',
      'author': 'And another one Author',
    },
    {
      'image': 'assets/images/COVER_BOOK.gif',
      'author': 'And another two Author',
    },
    {
      'image': 'assets/images/COVER_BOOK.gif',
      'author': 'And another three Author',
    },
  ];
  final List<Map<String, String>> categories = [
    {'name': 'Adventure', 'amount': '1'},
    {'name': 'Romance', 'amount': '10'},
    {'name': 'Fantasy', 'amount': '100'},
    {'name': 'Science Fiction', 'amount': '1000'},
    {'name': 'Mystery', 'amount': '10000'},
    {'name': 'History', 'amount': '100000'},
  ];

  // -- MOCKS END --

  @override
  Widget build(BuildContext context) {
    final TextEditingController searchController = TextEditingController();

    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(56),
        child: Header(onCartPressed: _openCardDrawer),
      ),
      endDrawer: CartDrawer(),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              padding: const EdgeInsets.symmetric(
                horizontal: 24.0,
                vertical: 32.0,
              ),
              // Весь контент
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'What book are you\nlooking for?',
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Explore our catalog and find your next read.',
                    style: TextStyle(fontSize: 16, color: Colors.black54),
                  ),
                  const SizedBox(height: 24),
                  // Поиск
                  Row(
                    children: [
                      // Поле ввода
                      Expanded(
                        child: TextField(
                          controller: searchController,
                          decoration: InputDecoration(
                            hintText: 'Find any book!',
                            filled: true,
                            fillColor: Colors.grey[100],
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 18,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.horizontal(
                                left: Radius.circular(30),
                              ),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                      ),

                      // Кнопка-иконка
                      Container(
                        height: 60,
                        width: 64,
                        decoration: BoxDecoration(
                          color: Colors.amber[600],
                          borderRadius: BorderRadius.horizontal(
                            right: Radius.circular(30),
                          ),
                        ),
                        child: IconButton(
                          icon: const Icon(Icons.search),
                          color: Colors.black87,
                          onPressed:
                              () => Navigator.pushNamed(
                                context,
                                "/search",
                                arguments: {"search": searchController.text},
                              ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 64),

                  // Trending Books
                  Center(
                    child: Column(
                      children: [
                        Text(
                          'Trending Books',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          '✧ Drag to explore',
                          style: TextStyle(color: Colors.black54),
                        ),
                        SizedBox(height: 32),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.35,
                          child: SizedBox(
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              children:
                                  trendingBooks.map((book) {
                                    return BookCard(
                                      image: book['image']!,
                                      author: book['author']!,
                                    );
                                  }).toList(),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Books by categories
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 16),
                      const Text(
                        'Books by categories',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        '✧ Click to explore',
                        style: TextStyle(color: Colors.black54),
                      ),
                      const SizedBox(height: 16),

                      // Список категорий
                      ...categories.map((category) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 16),
                          child: Column(
                            children: [
                              Container(
                                width: double.infinity,
                                padding: const EdgeInsets.symmetric(
                                  vertical: 20,
                                  horizontal: 24,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(color: Colors.black54),
                                ),
                                alignment: Alignment.centerLeft,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      category['name']!,
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.black54,
                                      ),
                                    ),
                                    SizedBox(),
                                    Text(
                                      '${category['amount']!} books',
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.black54,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      }),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
