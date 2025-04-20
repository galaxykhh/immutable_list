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

    test('List.immutable 메소드는 새로운 항목이 추가된 새로운 List를 반환한다', () {
      final List<String> origin = ['H', 'A'];
      final List<String> added = origin.immutableAdd('N');

      expect(origin, equals(['H', 'A']));
      expect(added, equals(['H', 'A', 'N']));
      expect(identical(origin, added), isFalse);
    });

    group('List.immutableAddAll 메소드는 새로운 여러 항목들이 추가된 새로운 List를 반환한다.', () {
      test('List.immutableAddAll 여러가지 값', () {
        final List<String> origin = ['H'];
        final List<String> updated = origin.immutableAddAll(['A', 'N']);

        expect(origin, equals(['H']));
        expect(updated, equals(['H', 'A', 'N']));
        expect(identical(origin, updated), isFalse);
      });

      test('List.immutableAddAll 단일값', () {
        final List<String> origin = ['H', 'A'];
        final List<String> updated = origin.immutableAddAll(['N']);

        expect(origin, equals(['H', 'A']));
        expect(updated, equals(['H', 'A', 'N']));
        expect(identical(origin, updated), isFalse);
      });
    });
  });
}
