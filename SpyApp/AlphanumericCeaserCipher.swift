import Foundation

struct AlphanumericCeaserCipher : Cipher {
    func encode(_ plaintext: String, secret: String) -> String? {
        var encoded = ""
        let shiftBy = UInt32(secret)!
        
        for character in plaintext.uppercased() {
            let unicode = character.unicodeScalars.first!.value
            if unicode < 48 || (unicode > 57 && unicode < 65) || unicode > 90 {
                return "Invalid input. Alphanumeric inputs only"
            }
            var shiftedUnicode = unicode + shiftBy
            while shiftedUnicode > 90 {
                shiftedUnicode -= 43
            }
            if (shiftedUnicode > 57 && shiftedUnicode < 65) {
                shiftedUnicode += 7
            }
            let shiftedCharacter = String(UnicodeScalar(UInt8(shiftedUnicode)))
            encoded = encoded + shiftedCharacter
        }
        return encoded
    }
    
    func decrypt(_ encrypted: String, secret: String) -> String? {
        var decoded = ""
        let shiftBy = UInt32(secret)!
        
        for character in encrypted.uppercased() {
            let unicode = character.unicodeScalars.first!.value
            if unicode < 48 || (unicode > 57 && unicode < 65) || unicode > 90 {
                return "Invalid input. Alphanumeric inputs only"
            }
            var shiftedUnicode = unicode - shiftBy
            while shiftedUnicode < 48 {
                shiftedUnicode += 43
            }
            if (shiftedUnicode > 57 && shiftedUnicode < 65) {
                shiftedUnicode -= 7
            }
            let shiftedCharacter = String(UnicodeScalar(UInt8(shiftedUnicode)))
            decoded = decoded + shiftedCharacter
        }
        return decoded
    }
    
    
}
