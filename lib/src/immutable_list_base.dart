extension ImmutableListExtension<T> on List<T> {
  /// 복사된 새로운 [List]를 반환합니다
  ///
  /// Example:
  /// ```dart
  /// final List<String> list = ['H', 'A', 'N'];
  /// final List<String> copied = list.copy();
  ///
  /// print(list); // ['H', 'A', 'N']
  /// print(copied); // ['H', 'A', 'N']
  /// print(list == copied); // false
  /// ```
  List<T> copy() => <T>[...this];

  /// [item]이 배열 맨 끝에 추가된 새로운 [List]를 반환합니다.
  ///
  /// Example:
  /// ```dart
  /// final list1 = <String>['H', 'A'];
  /// final list2 = list1.copyAdd('N');
  ///
  /// print(list1); // ['H', 'A']
  /// print(list2); // ['H', 'A', 'N']
  ///```
  List<T> copyAdd(T item) => copy()..add(item);

  /// [iterable]이 배열 맨 끝에 추가된 새로운 [List]를 반환합니다.
  ///
  /// Example:
  /// ```dart
  /// final List<String> list1 = ['H'];
  /// final list2 = list1.copyAddAll(['A', 'N']);
  ///
  /// print(list1); // ['H']
  /// print(list2); // ['H', 'A', 'N']
  /// ```
  List<T> copyAddAll(Iterable<T> iterable) => copy()..addAll(iterable);

  ///　[index]위치에 [item]이 추가된 새로운 [List]를 반환합니다.
  ///
  /// Example:
  /// ```dart
  /// final list1 = <String>['A', 'N'];
  /// final list2 = list1.copyInsert(0, 'H');
  ///
  /// print(list1); // ['A', 'N']
  /// print(list2); // ['H', 'A', 'N']
  /// ```
  List<T> copyInsert(int index, T item) => copy()..insert(index, item);

  ///　[index]위치로부터 [iterable]이 추가된 새로운 [List]를 반환합니다.
  ///
  /// Example:
  /// ```dart
  /// final list1 = <String>['N'];
  /// final list2 = list1.copyInsert(0, ['H', 'A']);
  ///
  /// print(list1); // ['N']
  /// print(list2); // ['H', 'A', 'N']
  /// ```
  List<T> copyInsertAll(int index, Iterable<T> iterable) => copy()..insertAll(index, iterable);

  /// [value]를 제외한 새로운 [List]를 반환합니다.
  ///
  /// Example:
  /// ```dart
  /// final list1 = <String>['H', 'A', 'N', 'G'];
  /// final list2 = list1.copyRemove('G');
  ///
  /// print(list1); // ['H', 'A', 'N', 'G']
  /// print(list2); // ['H', 'A', 'N']
  /// ```
  List<T> copyRemove(T value) => copy()..remove(value);

  /// [index]에 해당하는 항목이 제거된 새로운 [List]를 반환합니다.
  ///
  /// Example:
  /// ```dart
  /// final list1 = <String>['H', 'A', 'N', 'G'];
  /// final list2 = list1.copyRemoveAt(3);
  ///
  /// print(list1); // ['H', 'A', 'N', 'G']
  /// print(list2); // ['H', 'A', 'N']
  ///```
  List<T> copyRemoveAt(int index) => copy()..removeAt(index);

  /// [condition]에 해당하는 모든 항목이 제거된 새로운 [List]를 반환합니다.
  ///
  /// Example:
  /// ```dart
  /// final list1 = <String>['H', 'Z', 'A', 'Z', 'N', 'Z'];
  /// final list2 = list1.copyRemoveWhere((int index, String item) => item == 'Z');
  ///
  /// print(list1); // ['H', 'Z', 'A', 'Z', 'N', 'Z']
  /// print(list2); // ['H', 'A', 'N']
  /// ```
  List<T> copyRemoveWhere(bool Function(int index, T item) condition) {
    final List<T> list = [];

    asMap().forEach((k, v) {
      if (!condition(k, v)) {
        list.add(v);
      }
    });

    return list;
  }

  /// [index]에 해당하는 항목이 [item]으로 교체된 새로운 [List]를 반환합니다.
  ///
  /// Example:
  /// ```dart
  /// final list1 = <String>['F', 'A', 'N'];
  /// final list2 = list1.copyReplaceAt(0, 'H');
  ///
  /// print(list1); // ['F', 'A', 'N']
  /// print(list2); // ['H', 'A', 'N']
  /// ```
  List<T> copyReplaceAt(int index, T item) => copy()..replaceRange(index, index + 1, [item]);

  /// [condition]에 해당하는 모든 항목이 [item]으로 교체된 새로운 [List]를 반환합니다.
  ///
  /// Example:
  /// ```dart
  ///	final list1 = <String>['B', 'A', 'K', 'A', 'K', 'A'];
  /// final list2 = list1.copyReplaceWhere((int index, String item) => item == 'K', 'N');
  ///
  /// print(list1); // ['B', 'A', 'K', 'A', 'K', 'A']
  /// print(list2); // ['B', 'A', 'N', 'A', 'N', 'A']
  /// ```
  List<T> copyReplaceWhere(bool Function(int index, T item) condition, T item) {
    final List<T> copied = copy();

    asMap().forEach((k, v) {
      if (condition(k, v)) {
        copied.replaceRange(k, k + 1, [item]);
      }
    });

    return copied;
  }

  // List<T> copyReplaceWhere(bool Function(T item) condition, T item) {
  //   final List<T> copied = copy();
  // }

  /// [start]부터 [end]에 해당하는 범위가 [replacements]로 교체된 새로운 [List]를 반환합니다.
  ///
  /// Example:
  /// ```dart
  /// final list1 = <String> ['O', 'V', 'E', 'N'];
  /// final list2 = list1.copyReplaceRange(0, 3, ['H', 'A']);
  ///
  /// print(list1); // ['O', 'V', 'E', 'N']
  /// print(list2); // ['H', 'A', 'N']
  /// ```
  List<T> copyReplaceRange(int start, int end, Iterable<T> replacements) => copy()..replaceRange(start, end, replacements);
}
