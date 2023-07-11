import 'package:androidtv_remote/androidtv_remote.dart';
import 'package:test/test.dart';

void main() {
  group('AndroidTV Remote', () {
    final remote = AndroidRemote();

    setUp(() {
      // Additional setup goes here.
    });

    test('is not null', () {
      expect(remote, isNotNull);
    });
  });
}
