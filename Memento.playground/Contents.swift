import Foundation
import XCTest

class Token
{
    var value = 0
    init(_ value: Int)
    {
        self.value = value
    }
    // todo: any extra members you need
    
    static func ==(_ lhs: Token, _ rhs: Token) -> Bool
    {
        return lhs.value == rhs.value
    }
}

class Memento
{
    var tokens = [Token]()
    
    init(_ tokens: [Token]) {
        self.tokens = tokens
    }
}

class TokenMachine
{
    var tokens = [Token]()
    
    func addToken(_ value: Int) -> Memento
    {
        let token = Token(value)
        tokens.append(token)
        let memento = Memento(tokens)
        return memento
    }
    
    func addToken(_ token: Token) -> Memento
    {
        tokens.append(token)
        let memento = Memento(tokens)
        return memento
    }
    
    func revert(to m: Memento)
    {
        tokens = m.tokens
    }
}

class MementoTests: XCTestCase {
    
    func testSingleToken()
    {
        let tm = TokenMachine()
        let m = tm.addToken(123)
        let _ = tm.addToken(456)
        tm.revert(to: m)
        XCTAssertEqual(1, tm.tokens.count)
        XCTAssert(Token(123) == tm.tokens[0])
    }
    
    func testTwoToken()
    {
        let tm = TokenMachine()
        let _ = tm.addToken(1)
        let m = tm.addToken(2)
        let _ = tm.addToken(3)
        tm.revert(to: m)
        XCTAssertEqual(2, tm.tokens.count)
        XCTAssert(Token(1) == tm.tokens[0])
        XCTAssert(Token(2) == tm.tokens[1])
    }
}

MementoTests.defaultTestSuite.run()
