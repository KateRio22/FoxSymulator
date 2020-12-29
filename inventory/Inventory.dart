import '../items/Item.dart';

class Inventory {
  int owned;
  final int maxSize;
  // map<type, <id, item>>
  Map<int, Map<int, Item>> items;

  Inventory(this.maxSize) {
    this.owned = 0;
    this.items = new Map();
  }

  addItem(Item item) {
    items.putIfAbsent(item.type, () => {item.id: item});
    items[item.type].putIfAbsent(item.id, () => item);
  }

  String toJson() {
    Map<String, String> json = new Map();
    items.forEach((type, itemslist) {
      itemslist.forEach((id, item) {
        json.putIfAbsent('"${type}_${item.id}"', () => item.toString());
      });
    });
    return json.toString();
  }
}
