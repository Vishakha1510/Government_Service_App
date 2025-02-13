import 'package:flutter/material.dart';
import 'package:government_service_app/providers/bookmark_provider.dart';
import 'package:provider/provider.dart';
import 'detail_page.dart';

class BookmarkListScreen extends StatelessWidget {
  const BookmarkListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bookmarkProvider = Provider.of<BookmarkProvider>(context);
    final bookmarks = bookmarkProvider.bookmarks;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal.shade400,
        title: const Text(
          'Bookmarks',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 30),
        ),
        centerTitle: true,
      ),
      body: bookmarks.isEmpty
          ? const Center(
              child: Text(
                'No bookmarks yet!',
                style: TextStyle(fontSize: 18),
              ),
            )
          : ListView.builder(
              itemCount: bookmarks.length,
              itemBuilder: (context, index) {
                final service = bookmarks[index];
                return ListTile(
                  leading: Image.network(service['logo']),
                  title: Text(service['title']),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailPage(),
                        settings: RouteSettings(arguments: service),
                      ),
                    );
                  },
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () {
                      bookmarkProvider.toggleBookmark(service);
                    },
                  ),
                );
              },
            ),
    );
  }
}
