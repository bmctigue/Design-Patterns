import Foundation
import XCTest

class Participant
{
    private let mediator: Mediator
    var value = 0
    
    init(_ mediator: Mediator)
    {
        self.mediator = mediator
        mediator.participants.append(self)
    }
    
    func say(_ n: Int)
    {
        mediator.broadcast(n, sender: self)
    }
}

class Mediator
{
    var participants = [Participant]()
    
    func broadcast(_ n: Int, sender: Participant) {
        for participant in participants {
            if !(participant === sender) {
                participant.value += n
            }
        }
    }
}

class MediatorTests: XCTestCase {
    
    func testMediator() {
        let mediator = Mediator()
        let p1 = Participant(mediator)
        let p2 = Participant(mediator)
        
        XCTAssertEqual(0, p1.value)
        XCTAssertEqual(0, p2.value)
        
        p1.say(2)

        XCTAssertEqual(0, p1.value)
        XCTAssertEqual(2, p2.value)

        p2.say(4)

        XCTAssertEqual(4, p1.value)
        XCTAssertEqual(2, p2.value)
    }
}

MediatorTests.defaultTestSuite.run()
