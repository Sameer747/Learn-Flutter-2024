import 'package:flutter/foundation.dart';

class FavouritesProvder extends ChangeNotifier {
  final List<int> _selectedItems = [];
  List<int> get selectedItem => _selectedItems;

  void addItems({required int index}) {
    _selectedItems.add(index);
    notifyListeners();
  }

  void removeItems({required int index}) {
    _selectedItems.remove(index);
    notifyListeners();
  }

  // load initial data
  final List<int> _items = List.generate(20, (index) => index);
  List<int> get items => _items;

  bool _isLoadingMore = false;
  bool get isLoadingMore => _isLoadingMore;

  Future<void> loadMoreItems() async {
    /**
     * to check if the loading is true
     * so that multiple loads is blocked
    */
    if (_isLoadingMore) return;

    if (_items.length < 100) {
      _isLoadingMore = true;
      notifyListeners();

      // to simulate network delay
      await Future.delayed(const Duration(seconds: 2));

      List<int> newItems = List.generate(10, (index) => _items.length + index);
      _items.addAll(newItems);
    }

    _isLoadingMore = false;
    notifyListeners();
  }
}
