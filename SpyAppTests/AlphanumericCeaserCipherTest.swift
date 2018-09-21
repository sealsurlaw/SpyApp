import XCTest
@testable import SpyApp

class AlphanumericCeasarCipherTests: XCTestCase {
    
    var cipher: Cipher!
    
    override func setUp() {
        super.setUp()
        cipher = AlphanumericCeaserCipher()
    }
    
    func test_oneStringGetsMappedToSelfWith_0_secret() {
        let plaintext = "test"
        
        let result = cipher.encode(plaintext, secret: "0")
        XCTAssertEqual(result, "TEST")
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
        XCTAssertEqual(result, "BOZTUSJOH")
    }
    
    func test_loopFromEndToBeginning() {
        let result = cipher.encode("abz", secret: "1")
        XCTAssertEqual(result, "BC0")
    }
    
    func test_jumpFromNumbersToLetters() {
        let result = cipher.encode("09ab", secret: "1")
        XCTAssertEqual(result, "1ABC")
    }
    
    func test_decryptOneStringGetsMappedToSelfWith_0_secret() {
        let plaintext = "test"
        
        let result = cipher.decrypt(plaintext, secret: "0")
        XCTAssertEqual(result, "TEST")
    }
    
    func test_decryptNonNumericInputForSecret() {
        let result = cipher.decrypt("anyString", secret: "a")
        XCTAssertNil(result)
    }
    
    func test_decryptnegativeSecret() {
        let result = cipher.decrypt("anyString", secret: "-1")
        XCTAssertNil(result)
    }
    
    func test_decryptRegularShift() {
        let result = cipher.decrypt("string", secret: "1")
        XCTAssertEqual(result, "RSQHMF")
    }
    
    func test_decryptLoopFromBeginningToEnd() {
        let result = cipher.decrypt("01c", secret: "1")
        XCTAssertEqual(result, "Z0B")
    }
    
    func test_decryptJumpFromNumbersToLetters() {
        let result = cipher.decrypt("19ab", secret: "1")
        XCTAssertEqual(result, "089A")
    }
    
}
