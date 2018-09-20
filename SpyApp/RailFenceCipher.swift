import Foundation

/*
    The Rail Fence Cipher takes a phrase and breaks it up into multiple rails
    before gluing it all back together
 "HelloThereBuddy" with 4 rails would give:
        1: H - - - - - h - - - - - d - -  hhd
        2: - e - - - T - e - - - u - d -  eteud
        3: - - l - o - - - r - B - - - y  lorby
        4: - - - l - - - - - e - - - - -  le
 result: hhdeteudlorbyle
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
        var direction = 1
        for char in plaintext.lowercased() {
            rails[currRail].append(String(char))
            if currRail == (numRails - 1) {
                direction = -1
            }
            else if currRail == 0 {
                direction = 1
            }
            currRail += direction
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
        // Check that the number of rails isn't 0 or negative
        if numRails <= 0 {
            return nil
        }
        
        var rails = [String]()
        
        // Build the rails
        for _ in 0..<numRails {
            rails.append(String())
        }

        
        
        return nil
    }
    
}
