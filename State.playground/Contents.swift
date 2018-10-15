import Foundation
import XCTest

class CombinationLock
{
    var status = "LOCKED"
    var combination: [Int]!
    var currentDigits = [Int]()
    
    init(_ combination: [Int])
    {
        self.combination = combination
    }
    
    func enterDigit(_ digit: Int)
    {
        if status != "OPEN" {
            currentDigits.append(digit)
            if !digitsValid(currentDigits: currentDigits, combination: combination) {
                status = "ERROR"
            } else {
                if currentDigits == combination {
                    status = "OPEN"
                } else {
                    if status == "LOCKED" {
                        status = "\(digit)"
                    } else {
                        status += "\(digit)"
                    }
                }
            }
        }
    }
    
    func digitsValid(currentDigits: [Int], combination: [Int]) -> Bool {
        for i in 0..<currentDigits.count {
            if currentDigits[i] != combination[i] {
                return false
            }
        }
        return true
    }
}


class StateTests: XCTestCase {
    
    func testSuccess()
    {
        let cl = CombinationLock([1,2,3,4,5])
        XCTAssertEqual("LOCKED", cl.status)
        cl.enterDigit(1)
        XCTAssertEqual("1", cl.status)
        cl.enterDigit(2)
        XCTAssertEqual("12", cl.status)
        cl.enterDigit(3)
        XCTAssertEqual("123", cl.status)
        cl.enterDigit(4)
        XCTAssertEqual("1234", cl.status)
        cl.enterDigit(5)
        XCTAssertEqual("OPEN", cl.status)
    }
    
    func testFailure()
    {
        let cl = CombinationLock([1,2,3])
        XCTAssertEqual("LOCKED", cl.status)
        cl.enterDigit(1)
        XCTAssertEqual("1", cl.status)
        cl.enterDigit(2)
        XCTAssertEqual("12", cl.status)
        cl.enterDigit(5)
        XCTAssertEqual("ERROR", cl.status)
    }
}

StateTests.defaultTestSuite.run()
