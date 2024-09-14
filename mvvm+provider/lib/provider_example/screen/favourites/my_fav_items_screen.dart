import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/favourites_provder.dart';

class MyFavItemsScreen extends StatefulWidget {
  const MyFavItemsScreen({super.key});

  @override
  State<MyFavItemsScreen> createState() => _MyFavItemsScreenState();
}

class _MyFavItemsScreenState extends State<MyFavItemsScreen> {
  @override
  Widget build(BuildContext context) {
    print("build");
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Favourites Provider"),
      ),
      body: SafeArea(child: Consumer<FavouritesProvder>(
        builder: (context, value, child) {
          return ListView.builder(
            itemCount: value.selectedItem.length,
            itemBuilder: (context, index) {
              return ListTile(
                onTap: () {
                  value.removeItems(index: value.selectedItem[index]);
                },
                title: Text("Item ${value.selectedItem[index] + 1}"),
                trailing: const Icon(Icons.favorite),
              );
              // return ListTile(
              //   onTap: () {
              //     favouritesProvder.addItems(index);
              //   },
              //   title: Text("Item ${index + 1}"),
              //   trailing: favouritesProvder.selectedItem.contains(index)
              //       ? const Icon(Icons.favorite)
              //       : const Icon(Icons.favorite_border_outlined),
              // );
            },
          );
        },
      )),
    );
  }
}
