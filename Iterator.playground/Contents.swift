import Foundation
import XCTest

class Node<T>
{
    let value: T
    var left: Node<T>? = nil
    var right: Node<T>? = nil
    var parent: Node<T>? = nil
    
    init(_ value: T)
    {
        self.value = value
    }
    
    init(_ value: T, _ left: Node<T>, _ right: Node<T>)
    {
        self.value = value
        self.left = left
        self.right = right
        
        left.parent = self
        right.parent = self
    }
    
    
    public var preOrder: [T]
    {
        var result = [T]()
        result.append(value)
        if let left = left {
            result = result + left.preOrder
            if let right = right {
                result = result + right.preOrder
            }
        }
        return result
    }
}

class IteratorTests: XCTestCase {
    func testIterator() {
        let node = Node("a",
                        Node("b",
                             Node("c"),
                             Node("d")
            ),
                        Node("e")
        )
        XCTAssertEqual("abcde", node.preOrder.joined(),
                       "Preorder traversal of this structure should yield 'abcde'")
    }
    
}

IteratorTests.defaultTestSuite.run()
