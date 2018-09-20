import XCTest
@testable import SpyApp

class BaconCipherTests: XCTestCase {
    
    var cipher: Cipher!
    
    override func setUp() {
        super.setUp()
        cipher = BaconCipher()
    }
    
    func test_decryptGeneral() {
        let decrypted = cipher.decrypt("BAABBAABAABAABABAABB", secret: "0")!
        
        XCTAssertEqual(decrypted, "test")
    }
    
    func test_decryptWithWhitespace() {
        let decrypted = cipher.decrypt("BAABBAAAAABAAAAABAABAABABAABBBBB", secret: "3")!
        
        XCTAssertEqual(decrypted, "test")
    }
    
}
