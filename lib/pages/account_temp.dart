import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../blocs/account/account_bloc.dart';
import '../../blocs/account/account_event.dart';
import '../../blocs/account/account_state.dart';
import '../../components/rounded_image.dart';
import '../../components/book_card.dart';

class AccountPage extends StatefulWidget {
  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  void initState() {
    super.initState();
    context.read<AccountBloc>().add(LoadAccount());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AccountBloc(),
      child: Scaffold(
        appBar: AppBar(title: Text('Account')),
        body: BlocBuilder<AccountBloc, AccountState>(
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
    );
  }

  Widget _buildContent(dynamic account) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: RoundedImage(
              image: NetworkImage(account['subscription']['type'] == 'Premium'
                  ? 'https://example.com/premium.png'
                  : 'https://example.com/default.png'),
              width: 200,
              height: 200,
            ),
          ),
          const SizedBox(height: 24),
          Center(
            child: Text(
              'SELECTED SUBSCRIPTION',
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(letterSpacing: 2),
            ),
          ),
          const SizedBox(height: 12),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(account['subscription']['type']),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Text('BALANCE:', style: Theme.of(context).textTheme.headlineSmall),
              const SizedBox(width: 8),
              Text('\$${account['balance']}',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.deepOrange)),
            ],
          ),
          const SizedBox(height: 24),
          Text('MY BOOKS',
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(letterSpacing: 2)),
          const SizedBox(height: 12),
          SizedBox(
            height: 250,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: account['books'].length,
              itemBuilder: (context, index) {
                final book = account['books'][index];
                return BookCard(
                  image: book['coverUrl'],
                  author: book['author'],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}