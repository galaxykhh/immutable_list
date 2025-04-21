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
  /// final list2 = list1.immutableAdd('N');
  ///
  /// print(list1); // ['H', 'A']
  /// print(list2); // ['H', 'A', 'N']
  ///```
  List<T> immutableAdd(T item) => copy()..add(item);

  /// [iterable]이 배열 맨 끝에 추가된 새로운 [List]를 반환합니다.
  ///
  /// Example:
  /// ```dart
  /// final List<String> list1 = ['H'];
  /// final list2 = list1.immutableAddAll(['A', 'N']);
  ///
  /// print(list1); // ['H']
  /// print(list2); // ['H', 'A', 'N']
  /// ```
  List<T> immutableAddAll(Iterable<T> iterable) => copy()..addAll(iterable);

  ///　[index]위치에 [item]이 추가된 새로운 [List]를 반환합니다.
  ///
  /// Example:
  /// ```dart
  /// final list1 = <String>['A', 'N'];
  /// final list2 = list1.immutableInsert(0, 'H');
  ///
  /// print(list1); // ['A', 'N']
  /// print(list2); // ['H', 'A', 'N']
  /// ```
  List<T> immutableInsert(int index, T item) => copy()..insert(index, item);

  ///　[index]위치로부터 [iterable]이 추가된 새로운 [List]를 반환합니다.
  ///
  /// Example:
  /// ```dart
  /// final list1 = <String>['N'];
  /// final list2 = list1.immutableInsert(0, ['H', 'A']);
  ///
  /// print(list1); // ['N']
  /// print(list2); // ['H', 'A', 'N']
  /// ```
  List<T> immutableInsertAll(int index, Iterable<T> iterable) => copy()..insertAll(index, iterable);

  /// [value]를 제외한 새로운 [List]를 반환합니다.
  ///
  /// Example:
  /// ```dart
  /// final list1 = <String>['H', 'A', 'N', 'G'];
  /// final list2 = list1.immutableRemove('G');
  ///
  /// print(list1); // ['H', 'A', 'N', 'G']
  /// print(list2); // ['H', 'A', 'N']
  /// ```
  List<T> immutableRemove(T value) => copy()..remove(value);

  /// [index]에 해당하는 항목이 제거된 새로운 [List]를 반환합니다.
  ///
  /// Example:
  /// ```dart
  /// final list1 = <String>['H', 'A', 'N', 'G'];
  /// final list2 = list1.immutableRemoveAt(3);
  ///
  /// print(list1); // ['H', 'A', 'N', 'G']
  /// print(list2); // ['H', 'A', 'N']
  ///```
  List<T> immutableRemoveAt(int index) => copy()..removeAt(index);

  /// [condition]에 해당하는 모든 항목이 제거된 새로운 [List]를 반환합니다.
  ///
  /// Example:
  /// ```dart
  /// final List<String> list1 = ['H', 'Z', 'A', 'Z', 'N', 'Z'];
  /// final List<String> list2 = list1.immutableRemoveWhere((item) => item == 'Z');
  ///
  /// print(list1); // ['H', 'Z', 'A', 'Z', 'N', 'Z']
  /// print(list2); // ['H', 'A', 'N']
  /// ```
  List<T> immutableRemoveWhere(bool Function(T item) condition) => copy()..removeWhere(condition);
}
