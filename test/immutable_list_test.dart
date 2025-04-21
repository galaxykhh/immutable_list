import 'package:immutable_list/immutable_list.dart';
import 'package:test/test.dart';

void main() {
  group('Immutable List Extension', () {
    test('List.copy 메소드는 다른 참조를 가진 새로운 List를 반환한다', () {
      final List<String> origin = ['H', 'A', 'N'];
      final List<String> copied = origin.copy();

      expect(copied, equals(origin));
      expect(identical(copied, origin), isFalse);
    });

    test('List.copyAdd 메소드는 새로운 항목이 추가된 새로운 List를 반환한다', () {
      final List<String> origin = ['H', 'A'];
      final List<String> added = origin.copyAdd('N');

      expect(origin, equals(['H', 'A']));
      expect(added, equals(['H', 'A', 'N']));
      expect(identical(origin, added), isFalse);
    });

    group('List.copyAddAll 메소드는 새로운 여러 항목들이 추가된 새로운 List를 반환한다.', () {
      test('List.copyAddAll 여러가지 값', () {
        final List<String> origin = ['H'];
        final List<String> updated = origin.copyAddAll(['A', 'N']);

        expect(origin, equals(['H']));
        expect(updated, equals(['H', 'A', 'N']));
        expect(identical(origin, updated), isFalse);
      });

      test('List.copyAddAll 단일값', () {
        final List<String> origin = ['H', 'A'];
        final List<String> updated = origin.copyAddAll(['N']);

        expect(origin, equals(['H', 'A']));
        expect(updated, equals(['H', 'A', 'N']));
        expect(identical(origin, updated), isFalse);
      });
    });

    test('List.copyInsert는 항목이 추가된 새로운 List를 반환한다', () {
      final List<String> origin = ['A', 'N'];
      final List<String> inserted = origin.copyInsert(0, 'H');

      expect(origin, equals(['A', 'N']));
      expect(inserted, equals(['H', 'A', 'N']));
      expect(identical(origin, inserted), isFalse);
    });

    test('List.copyInsertAll은 항목들이 추가된 새로운 List를 반환한다', () {
      final List<String> origin = ['N'];
      final List<String> inserted = origin.copyInsertAll(0, ['H', 'A']);

      expect(origin, equals(['N']));
      expect(inserted, equals(['H', 'A', 'N']));
      expect(identical(origin, inserted), isFalse);
    });

    test('List.copyRemove는 항목이 삭제된 새로운 List를 반환한다.', () {
      final List<String> origin = ['H', 'A', 'N', 'G'];
      final List<String> removed = origin.copyRemove('G');

      expect(origin, ['H', 'A', 'N', 'G']);
      expect(removed, ['H', 'A', 'N']);
      expect(identical(origin, removed), isFalse);
    });

    test('List.copyRemoveAt은 index번째 항목이 삭제된 새로운 List를 반환한다', () {
      final List<String> origin = ['H', 'A', 'N', 'G'];
      final List<String> removed = origin.copyRemoveAt(3);

      expect(origin, ['H', 'A', 'N', 'G']);
      expect(removed, ['H', 'A', 'N']);
      expect(identical(origin, removed), isFalse);
    });

    test('List.copyRemoveWhere는 condition에 해당하는 모든 항목이 삭제된 새로운 List를 반환한다', () {
      final List<String> origin = ['H', 'Z', 'A', 'Z', 'N', 'Z'];
      final List<String> removed = origin.copyRemoveWhere((int index, String item) => item == 'Z');

      expect(origin, ['H', 'Z', 'A', 'Z', 'N', 'Z']);
      expect(removed, ['H', 'A', 'N']);
      expect(identical(origin, removed), isFalse);
    });

    test('List.copyReplaceAt은 index번째 항목이 변경된 새로운 List를 반환한다', () {
      final List<String> origin = ['F', 'A', 'N'];
      final List<String> replaced = origin.copyReplaceAt(0, 'H');

      expect(origin, ['F', 'A', 'N']);
      expect(replaced, ['H', 'A', 'N']);
      expect(identical(origin, replaced), isFalse);
    });

    test('List.copyReplaceWhere은 condition에 해당하는 모든 항목이 변경된 새로운 List를 반환한다', () {
      final List<String> origin = ['B', 'A', 'K', 'A', 'K', 'A'];
      final List<String> replaced = origin.copyReplaceWhere((int index, String item) => item == 'K', 'N');

      expect(origin, ['B', 'A', 'K', 'A', 'K', 'A']);
      expect(replaced, ['B', 'A', 'N', 'A', 'N', 'A']);
      expect(identical(origin, replaced), isFalse);
    });

    test('List.copyReplaceRange는 start부터 end에 해당하는 항목이 replacements로 교체된 새로운 List를 반환한다', () {
      final List<String> origin = ['O', 'V', 'E', 'N'];
      final List<String> replaced = origin.copyReplaceRange(0, 3, ['H', 'A']);

      expect(origin, ['O', 'V', 'E', 'N']);
      expect(replaced, ['H', 'A', 'N']);
      expect(identical(origin, replaced), isFalse);
    });
  });
}
