import XCTest
@testable import SpyApp

class CeasarCipherTests: XCTestCase {
    
    var cipher: Cipher!
    
    override func setUp() {
        super.setUp()
        cipher = CeaserCipher()
    }
    
    func test_oneStringGetsMappedToSelfWith_0_secret() {
        let plaintext = "test"
        
        let result = cipher.encode(plaintext, secret: "0")
        XCTAssertEqual(plaintext, result)
    }
    
    func test_nonNumericInputForSecret() {
        let result = cipher.encode("anyString", secret: "a")
        XCTAssertNil(result)
    }
    
    func test_negativeSecret() {
        let result = cipher.encode("anyString", secret: "-1")
        XCTAssertNil(result)
    }
    
    func test_regularShift() {
        let result = cipher.encode("anyString", secret: "1")
        XCTAssertEqual(result, "bozTusjoh")
    }

}
