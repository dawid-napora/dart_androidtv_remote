import 'dart:math';
import 'package:basic_utils/basic_utils.dart';

class CertificateGenerator {
  static Map<String, String> generateFull(
    String name,
    String country,
    String state,
    String locality,
    String organization,
    String ou,
  ) {
    Map<String, String> issuer = {
      'CN': name,
      'C': country,
      'ST': state,
      'L': locality,
      'O': organization,
      'OU': ou,
    };

    AsymmetricKeyPair keyPair = CryptoUtils.generateRSAKeyPair();

    String csr = X509Utils.generateRsaCsrPem(
      issuer,
      keyPair.privateKey as RSAPrivateKey,
      keyPair.publicKey as RSAPublicKey,
    );

    String serialNumber = '01${Random.secure().nextInt(1).toRadixString(16)}';

    String cert = X509Utils.generateSelfSignedCertificate(
      keyPair.privateKey,
      csr,
      9999,
      serialNumber: serialNumber,
      issuer: issuer,
    );

    String key = CryptoUtils.encodeRSAPrivateKeyToPem(
      keyPair.privateKey as RSAPrivateKey,
    );

    return {
      'cert': cert,
      'key': key,
    };
  }
}
