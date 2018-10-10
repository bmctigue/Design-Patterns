import Foundation
import XCTest

class Person
{
    var age: Int = 0
    
    func drink() -> String
    {
        return "drinking"
    }
    
    func drive() -> String
    {
        return "driving"
    }
    
    func drinkAndDrive() -> String
    {
        return "driving while drunk"
    }
}

class ResponsiblePerson
{
    private let person: Person
    
    init(person: Person)
    {
        self.person = person
    }
    
    var age: Int
    {
        get { return person.age }
        set(value) { person.age = value }
    }
    
    func drink() -> String
    {
        return age < 18 ? "too young" : person.drink()
    }
    
    func drive() -> String
    {
        return age < 16 ? "too young" : person.drive()
    }
    
    func drinkAndDrive() -> String
    {
        return "dead"
    }
}

class PersonTests: XCTestCase {
    
    func combinedTest() {
        
        let person = Person()
        person.age = 15
        let responsiblePerson = ResponsiblePerson(person: person)
        XCTAssert(responsiblePerson.drive() == "too young")
        XCTAssert(responsiblePerson.drink() == "too young")
        XCTAssert(responsiblePerson.drinkAndDrive() == "dead")
        
        responsiblePerson.age = 20
        XCTAssert(responsiblePerson.drive() == "driving")
        XCTAssert(responsiblePerson.drink() == "drinking")
        XCTAssert(responsiblePerson.drinkAndDrive() == "dead")
    }
    
    func testUnderAge() {
        let person = Person()
        person.age = 15
        let responsiblePerson = ResponsiblePerson(person: person)
        XCTAssert(responsiblePerson.drive() == "too young")
        XCTAssert(responsiblePerson.drink() == "too young")
        XCTAssert(responsiblePerson.drinkAndDrive() == "dead")
        
    }
    
    func testOfAge() {
        let person = Person()
        person.age = 20
        let responsiblePerson = ResponsiblePerson(person: person)
        XCTAssert(responsiblePerson.drive() == "driving")
        XCTAssert(responsiblePerson.drink() == "drinking")
        XCTAssert(responsiblePerson.drinkAndDrive() == "dead")
    }
}

PersonTests.defaultTestSuite.run()

