import Foundation

struct BaconCipher : Cipher {
    
    let translations = [
        "a": "AAAAA",
        "b": "AAAAB",
        "c": "AAABA",
        "d": "AAABB",
        "e": "AABAA",
        "f": "AABAB",
        "g": "AABBA",
        "h": "AABBB",
        "i": "ABAAA",
        "j": "ABAAB",
        "k": "ABABA",
        "l": "ABABB",
        "m": "ABBAA",
        "n": "ABBAB",
        "o": "ABBBA",
        "p": "ABBBB",
        "q": "BAAAA",
        "r": "BAAAB",
        "s": "BAABA",
        "t": "BAABB",
        "u": "BABAA",
        "v": "BABAB",
        "w": "BABBA",
        "x": "BABBB",
        "y": "BBAAA",
        "z": "BBAAB"
    ]
    
    let revTranslations = [
        "AAAAA": "a",
        "AAAAB": "b",
        "AAABA": "c",
        "AAABB": "d",
        "AABAA": "e",
        "AABAB": "f",
        "AABBA": "g",
        "AABBB": "h",
        "ABAAA": "i",
        "ABAAB": "j",
        "ABABA": "k",
        "ABABB": "l",
        "ABBAA": "m",
        "ABBAB": "n",
        "ABBBA": "o",
        "ABBBB": "p",
        "BAAAA": "q",
        "BAAAB": "r",
        "BAABA": "s",
        "BAABB": "t",
        "BABAA": "u",
        "BABAB": "v",
        "BABBA": "w",
        "BABBB": "x",
        "BBAAA": "y",
        "BBAAB": "z"
    ]
    
    func encode(_ plaintext: String, secret: String) -> String? {
        guard let whitespace = Int(secret) else {
            return nil
        }
        if whitespace < 0 {
            return nil
        }
        
        var encrypted: String = ""
        
        for char in plaintext.lowercased() {
            encrypted += translations[String(char)]!
            var garbage: String = ""
            for _ in 0..<whitespace {
                if Int(arc4random_uniform(3)) == 0 {
                    garbage += "B"
                }
                else {
                    garbage += "A"
                }
            }
            encrypted += garbage
        }
        
        return encrypted
    }
    
    func decrypt(_ plaintext: String, secret: String) -> String? {
        guard let whitespace = Int(secret) else {
            return nil
        }
        if whitespace < 0 {
            return nil
        }
        
        var decrypted: String = ""
        let numWords: Int = plaintext.count / (5 + whitespace)
        
        for i in 0..<numWords {
            print(i)
            let start = plaintext.index(plaintext.startIndex, offsetBy: (i*(5+whitespace)))
            let end = plaintext.index(plaintext.startIndex, offsetBy: (i*(5+whitespace)+5))
            let range = start..<end
            
            let sub = plaintext[range]
            decrypted += revTranslations[String(sub)]!
        }
        
        return decrypted
    }
    
    
}
