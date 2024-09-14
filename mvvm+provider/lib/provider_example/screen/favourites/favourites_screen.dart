import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_with_mvvm/provider_example/provider/favourites_provder.dart';
import 'package:provider_with_mvvm/provider_example/screen/favourites/my_fav_items_screen.dart';
import 'package:provider_with_mvvm/provider_example/utils/utils.dart';

class FavouritesScreen extends StatefulWidget {
  const FavouritesScreen({super.key});

  @override
  State<FavouritesScreen> createState() => _FavouritesScreenState();
}

class _FavouritesScreenState extends State<FavouritesScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        // When user reaches the bottom of the list, load more items
        Provider.of<FavouritesProvder>(context, listen: false).loadMoreItems();
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print("build");
    return Scaffold(
      appBar: AppBar(
        title: const Text("Favourites Provider"),
        actions: [
          IconButton(
              padding: const EdgeInsets.only(right: 20),
              onPressed: () {
                Navigator.push(
                    context, createRoute(child: const MyFavItemsScreen())
                    // MaterialPageRoute(builder: (context) => navigator),
                    );
              },
              icon: const Icon(Icons.favorite_sharp))
        ],
      ),
      body: SafeArea(child: Consumer<FavouritesProvder>(
        builder: (context, value, child) {
          print("consumer builds only");
          return ListView.builder(
            controller: _scrollController,
            itemCount: value.items.length + (value.isLoadingMore ? 1 : 0),
            itemBuilder: (context, index) {
              if (index == value.items.length) {
                // Show loading indicator at the end
                return const Center(child: CircularProgressIndicator());
              }
              return ListTile(
                onTap: () {
                  if (value.selectedItem.contains(index)) {
                    value.removeItems(index: index);
                  } else {
                    value.addItems(index: index);
                  }
                },
                title: Text("Item ${index + 1}"),
                trailing: value.selectedItem.contains(index)
                    ? const Icon(Icons.favorite)
                    : const Icon(Icons.favorite_border_outlined),
              );
            },
          );
        },
      )),
    );
  }
}
