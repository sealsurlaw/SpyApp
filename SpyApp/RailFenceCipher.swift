import Foundation

/*
    The Rail Fence Cipher takes a phrase and breaks it up into multiple rails
    before gluing it all back together
 "HelloThereBuddy" with 4 rails would give:
     1: H - - - o - - - r - - - d - -  hord
     2: - e - - - T - - - e - - - d -  eted
     3: - - l - - - h - - - B - - - y  lhby
     4: - - - l - - - e - - - u - - -  leu
 result: hordetedlhbyleu
*/
struct RailFenceCipher : Cipher {
    
    func encode(_ plaintext: String, secret: String) -> String? {
        // Check that secret is an integer
        guard let numRails = Int(secret) else {
            return nil
        }
        // Check that the number of rails isn't 1, 0 or negative
        if numRails <= 1 {
            return nil
        }
        var rails = [String]()
        
        // Build the rails
        for _ in 0..<numRails {
            rails.append(String())
        }
        
        // Add the characters to each rail
        var currRail = 0
        for char in plaintext.lowercased() {
            rails[currRail].append(String(char))
            currRail += 1
            if currRail == (numRails) {
                currRail = 0
            }
        }
        
        // Glue rails together
        var encrypted: String = ""
        for part in rails {
            encrypted += part
        }
        
        return encrypted
    }
    
    func decrypt(_ plaintext: String, secret: String) -> String? {
        // Check that secret is an integer
        guard let numRails = Int(secret) else {
            return nil
        }
        // Check that the number of rails isn't 1, 0 or negative
        if numRails <= 1 {
            return nil
        }
        var rails = [String]()
        
        // Build the rails
        for _ in 0..<numRails {
            rails.append(String())
        }
        
        // Add the characters to each rail
        var currRail = 0
        for char in plaintext.lowercased() {
            rails[currRail].append(String(char))
            currRail += 1
            if currRail == (numRails) {
                currRail = 0
            }
        }
        
        // Glue rails together
        var decrypted: String = ""
        for part in rails {
            decrypted += part
        }
        
        return decrypted
    }
    
}
