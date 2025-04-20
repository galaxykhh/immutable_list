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
}
