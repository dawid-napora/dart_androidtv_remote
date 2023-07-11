import 'package:androidtv_remote/src/certificate/certificate_generator.dart';
import 'package:test/test.dart';

void main() {
  group('Certificate generator', () {
    var data = CertificateGenerator.generateFull(
      'test',
      'test',
      'test',
      'test',
      'test',
      'test',
    );

    setUp(() {
      // Additional setup goes here.
    });

    test('is map', () {
      expect(data, isMap);
    });

    test('cert is not null', () {
      expect(data['cert'], isNotNull);
    });

    test('cert starts with -----BEGIN CERTIFICATE-----', () {
      expect(data['cert'], startsWith('-----BEGIN CERTIFICATE-----'));
    });

    test('cert ends with -----END CERTIFICATE-----', () {
      expect(data['cert'], endsWith('-----END CERTIFICATE-----'));
    });

    test('key is not null', () {
      expect(data['key'], isNotNull);
    });

    test('key starts with -----BEGIN PRIVATE KEY-----', () {
      expect(data['key'], startsWith('-----BEGIN PRIVATE KEY-----'));
    });

    test('key ends with -----END PRIVATE KEY-----', () {
      expect(data['key'], endsWith('-----END PRIVATE KEY-----'));
    });
  });
}
