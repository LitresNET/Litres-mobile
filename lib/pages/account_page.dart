import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:litres_mobile/widgets/drawer.dart';
import 'package:litres_mobile/widgets/header.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../blocs/account/account_bloc.dart';
import '../../blocs/account/account_event.dart';
import '../../blocs/account/account_state.dart';
import '../styles/app_styles.dart';
import '../widgets/footer.dart';
import '../components/rounded_image.dart';
import '../components/book_card.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void _openCartDrawer() {
    _scaffoldKey.currentState?.openEndDrawer();
  }

  @override
  void initState() {
    super.initState();
    context.read<AccountBloc>().add(LoadAccount());
  }

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
        child: BlocBuilder<AccountBloc, AccountState>(
          builder: (context, state) {
            if (state is AccountLoading) {
              return Center(child: CircularProgressIndicator());
            } else if (state is AccountLoaded) {
              final account = state.account;
              return _buildContent(account);
            } else if (state is AccountError) {
              return Center(child: Text('Error: ${state.message}'));
            }
            return Container();
          },
        ),
      ),
      endDrawer: CartDrawer(),
    );
  }

  Widget _buildContent(dynamic account) {
    return SingleChildScrollView(
      child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Subscription image card
              Center(
                child: RoundedImage(
                  image: AssetImage('assets/images/COVER_BOOK.gif'),
                  width: 200,
                  height: 200,
                ),
              ),
              const SizedBox(height: 24),

              // Selected subscription label
              Center(
                child: Text(
                  'SELECTED SUBSCRIPTION',
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium
                      ?.copyWith(letterSpacing: 2),
                ),
              ),
              const SizedBox(height: 12),

              // Subscription type with dotted border
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
                    'Premium',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Deactivated button
              Center(
                child: ElevatedButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.power_settings_new_outlined),
                  label: Text('Deactivated'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                    elevation: 4,
                    shadowColor: Colors.orangeAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius:
                      BorderRadius.circular(AppStyles.borderRadius),
                      side: BorderSide(color: Colors.grey),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16), // moved closer to balance

              // Balance and add coins button
              Row(
                children: [
                  Text(
                    'BALANCE:',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    '\$30.00',
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
                'MY BOOKS',
                style: Theme.of(context)
                    .textTheme
                    .headlineMedium
                    ?.copyWith(letterSpacing: 2),
              ),
              const SizedBox(height: 12),
              SizedBox(
                  height: MediaQuery.of(context).size.height * 0.35,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      BookCard(
                          image: 'assets/images/COVER_BOOK.gif',
                          author: 'Name Author'
                      ),
                      BookCard(
                        image: 'assets/images/COVER_BOOK.gif',
                        author: 'Another Author',
                      ),
                      BookCard(
                        image: 'assets/images/COVER_BOOK.gif',
                        author: 'Third Author',
                      ),
                    ],
                  )
              ),
              Footer()
            ],
          )
      ),
    );
  }
}