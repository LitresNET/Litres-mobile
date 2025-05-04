import 'package:flutter/material.dart';

import '../widgets/header.dart';

class SearchPage extends StatefulWidget {
  final Map<String, dynamic> searchData;

  const SearchPage({super.key, required this.searchData});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  late final TextEditingController _searchController = TextEditingController(
    text: widget.searchData['search'],
  );

  // -- MOCKS START --
  final List<Map<String, String>> categories = [
    {'name': 'Category...', 'value': 'none'},
    {'name': 'Adventure', 'value': 'adventure'},
    {'name': 'Romance', 'value': 'romance'},
    {'name': 'Fantasy', 'value': 'fantasy'},
    {'name': 'Science Fiction', 'value': 'science_fiction'},
    {'name': 'Mystery', 'value': 'mystery'},
    {'name': 'History', 'value': 'history'},
  ];

  final List<Map<String, String>> filters = [
    {'name': 'Filter...', 'value': 'none'},
    {'name': 'By date', 'value': 'date'},
    {'name': 'By alphabet', 'value': 'alphabet'},
  ];

  // -- MOCKS END --

  String selectedCategory = 'Category...';
  String selectedFilter = 'Filter...';

  Future<void> _DoSearch() async {
    // todo
  }

  String _getDisplayCategory(String? value) {
    if (value == null) return 'Category...';
    final category = categories.firstWhere(
      (item) => item['value'] == value,
      orElse: () => {'name': 'Category...'},
    );
    return category['name']!;
  }

  String _getDisplayFilter(String? value) {
    if (value == null) return 'Filter...';
    final filter = filters.firstWhere(
      (item) => item['value'] == value,
      orElse: () => {'name': 'Filter...'},
    );
    return filter['name']!;
  }

  void _openCartDrawer() {
    _scaffoldKey.currentState?.openEndDrawer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(56),
        child: Header(onCartPressed: _openCartDrawer),
      ),
      body: Column(
        children: [
          _buildControlsRow(),
          Expanded(
            child: ListView.builder(
              itemCount: 20,
              itemBuilder: (context, index) => _buildResultItem(index),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildControlsRow() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              // Поле ввода
              Expanded(
                child: TextField(
                  controller: _searchController,
                  decoration: InputDecoration(
                    hintText: 'Find any book!',
                    filled: true,
                    fillColor: Colors.grey[100],
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 18,
                    ),
                    border: const OutlineInputBorder(
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
                  borderRadius: const BorderRadius.horizontal(
                    right: Radius.circular(30),
                  ),
                ),
                child: IconButton(
                  icon: const Icon(Icons.search),
                  color: Colors.black87,
                  onPressed: () => _DoSearch(),
                ),
              ),
            ],
          ),
          SizedBox(height: 16.0),
          Text('Results for: ${_searchController.text}'),
          SizedBox(height: 16.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 200.0,
                child: DropdownButtonFormField<String>(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  dropdownColor: Colors.white,
                  decoration: InputDecoration(
                    hintText: _getDisplayCategory(selectedCategory),
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      borderSide: BorderSide(color: Color(0x000000ff)),
                    ),
                  ),
                  items:
                      categories.map((data) {
                        return DropdownMenuItem<String>(
                          value: data['value'],
                          child: Text(data['name']!),
                        );
                      }).toList(),
                  onChanged:
                      (value) => setState(() => selectedCategory = value!),
                ),
              ),
              SizedBox(
                width: 200.0,
                child: DropdownButtonFormField<String>(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  dropdownColor: Colors.white,
                  decoration: InputDecoration(
                    hintText: _getDisplayFilter(selectedFilter),
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      borderSide: BorderSide(color: Color(0x000000ff)),
                    ),
                  ),
                  items:
                      filters.map((data) {
                        return DropdownMenuItem<String>(
                          value: data['value'],
                          child: Text(data['name']!),
                        );
                      }).toList(),
                  onChanged: (value) => setState(() => selectedFilter = value!),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildResultItem(int index) {
    return ListTile(
      title: Text('Result ${index + 1}'),
      subtitle: Text('Description for result ${index + 1}'),
      trailing: const Icon(Icons.arrow_forward_ios),
      onTap: () {},
    );
  }
}
