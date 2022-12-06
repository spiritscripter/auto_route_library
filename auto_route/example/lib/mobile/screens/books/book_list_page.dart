import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../data/db.dart';

@RoutePage(path: 'path')
class BookListScreen extends StatefulWidget {
  @override
  _BookListScreenState createState() => _BookListScreenState();
}

class _BookListScreenState extends State<BookListScreen>
    with AutoRouteAwareStateMixin<BookListScreen> {
  @override
  void didPushNext() {
    print('didPushNext');
  }

  @override
  Widget build(BuildContext context) {
    var booksDb = BooksDBProvider.of(context);
    return Scaffold(
      body: ListView(
        children: booksDb?.books
                .map((book) => Column(
                      children: [
                        Card(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 8),
                          child: ListTile(
                            title: Text(book.name),
                            subtitle: Text(book.genre),
                            onTap: () {
                              // context.pushRoute(BookDetailsRoute(id: book.id));
                            },
                          ),
                        ),
                      ],
                    ))
                .toList() ??
            const [],
      ),
    );
  }
}
