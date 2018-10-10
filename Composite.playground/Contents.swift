import Foundation

class SingleValue : Sequence
{
    var value = 0
    
    init() {}
    init(_ value: Int)
    {
        self.value = value
    }
    
    func makeIterator() -> IndexingIterator<Array<Int>>
    {
        return IndexingIterator(_elements: [value])
    }
}

class ManyValues : Sequence
{
    var values = [Int]()
    
    func makeIterator() -> IndexingIterator<Array<Int>>
    {
        return IndexingIterator(_elements: values)
    }
    
    func add(_ value: Int)
    {
        values.append(value)
    }
}

extension Sequence where Self.Iterator.Element: Sequence, Self.Iterator.Element.Iterator.Element == Int
{
    func sum() -> Int
    {
        var total = 0
        for seq in self {
            total += seq.reduce(0, +)
        }
        return total
    }
}

let singleValue = SingleValue(1)
let manyValues = ManyValues()
manyValues.add(2)
manyValues.add(3)

let s = [AnySequence(singleValue),AnySequence(manyValues)].sum()
