class ModelLink<T> {
  T? value;
}

class ModelLinks<T> {
  final List<T> _items = [];

  void add(T item) => _items.add(item);
  void addAll(Iterable<T> items) => _items.addAll(items);
  void remove(T item) => _items.remove(item);
  void clear() => _items.clear();

  List<T> toList() => List.unmodifiable(_items);
  int get length => _items.length;
  bool get isEmpty => _items.isEmpty;
  bool get isNotEmpty => _items.isNotEmpty;
}
