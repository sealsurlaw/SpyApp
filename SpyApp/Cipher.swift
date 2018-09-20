import Foundation

protocol Cipher {
    func encode(_ plaintext: String, secret: String) -> String?
    func decrypt(_ plaintext: String, secret: String) -> String?
}
