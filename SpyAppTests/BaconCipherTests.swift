import XCTest
@testable import SpyApp

class BaconCipherTests: XCTestCase {
    
    var cipher: Cipher!
    
    override func setUp() {
        super.setUp()
        cipher = BaconCipher()
    }
    
    func test_generalEncrypt() {
        let encrypted = cipher.encode("test", secret: "0")
        
        XCTAssertEqual(encrypted!, "BAABBAABAABAABABAABB")
    }
    
    func test_encryptNegativeSecret() {
        let encrypted = cipher.encode("test", secret: "-1")
        
        XCTAssertNil(encrypted)
    }
    
    func test_decryptGeneral() {
        let decrypted = cipher.decrypt("BAABBAABAABAABABAABB", secret: "0")
        
        XCTAssertEqual(decrypted!, "test")
    }
    
    func test_decryptNegativeSecret() {
        let decrypted = cipher.decrypt("test", secret: "-1")
        
        XCTAssertNil(decrypted)
    }
    
    func test_decryptWithWhitespace() {
        let decrypted = cipher.decrypt("BAABBAAAAABAAAAABAABAABABAABBBBB", secret: "3")
        
        XCTAssertEqual(decrypted!, "test")
    }
    
}
