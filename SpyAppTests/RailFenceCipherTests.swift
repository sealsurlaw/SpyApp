import XCTest
@testable import SpyApp

class RailFenceCipherTests: XCTestCase {
    
    var cipher: Cipher!
    
    override func setUp() {
        super.setUp()
        cipher = RailFenceCipher()
    }
    
    func test_generalTest() {
        let encrypted = cipher.encode("HelloThereBuddy", secret: "4")!
        
        XCTAssertEqual(encrypted, "hordetedlhbyleu")
        
    }
    
    func test_noRails() {
        let encrypted = cipher.encode("HelloThereBuddy", secret: "0")

        XCTAssertEqual(encrypted, nil)
    }
    
    func test_negativeRails() {
        let encrypted = cipher.encode("HelloThereBuddy", secret: "-5")
        
        XCTAssertEqual(encrypted, nil)
    }
    
    func test_alphaSecret() {
        let encrypted = cipher.encode("HelloThereBuddy", secret: "a")

        XCTAssertEqual(encrypted, nil)
    }
    
    func test_cipherShorterThanNumberOfRails() {
        let encrypted = cipher.encode("Hello", secret: "25")
        
        XCTAssertEqual(encrypted, "hello")
    }
    
}
