import Foundation
import XCTest

class Bird
{
    var age = 0
    
    func fly() -> String
    {
        return (age < 10) ? "flying" : "too old"
    }
}

class Lizard
{
    var age = 0
    
    func crawl() -> String
    {
        return (age > 1) ? "crawling" : "too young"
    }
}

class Dragon
{
    private var _age = 0
    lazy var bird = Bird()
    lazy var lizard = Lizard()
    
    var age: Int
    {
        get {
            return _age
        }
        set(value) {
            self._age = value
            bird.age = value
            lizard.age = value
        }
    }
    
    func fly() -> String
    {
        return bird.fly()
    }
    
    func crawl() -> String
    {
        return lizard.crawl()
    }
}

class DragonTests: XCTestCase
{
    func testAge()
    {
        let dragon = Dragon()
        
        XCTAssertEqual("flying", dragon.fly())
        XCTAssertEqual("too young", dragon.crawl())
        
        dragon.age = 20

        XCTAssertEqual("too old", dragon.fly())
        XCTAssertEqual("crawling", dragon.crawl())
    }
}

class TestObserver: NSObject, XCTestObservation {
    func testCase(_ testCase: XCTestCase,
                  didFailWithDescription description: String,
                  inFile filePath: String?,
                  atLine lineNumber: Int) {
        assertionFailure(description, line: UInt(lineNumber))
    }
}

let testObserver = TestObserver()
XCTestObservationCenter.shared.addTestObserver(testObserver)
DragonTests.defaultTestSuite.run()
