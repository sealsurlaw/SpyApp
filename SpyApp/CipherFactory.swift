import Foundation

struct CipherFactory {

    private var ciphers: [String: Cipher] = [
        "Ceasar": CeaserCipher(),
        "Alpha": AlphanumericCeaserCipher(),
        "RailFence": RailFenceCipher(),
        "Bacon": BaconCipher()
    ]

    func cipher(for key: String) -> Cipher {
        return ciphers[key]!
    }
}
