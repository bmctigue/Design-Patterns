import Foundation

class Point
{
    var x = 0
    var y = 0
    
    init() {}
    
    init(x: Int, y: Int)
    {
        self.x = x
        self.y = y
    }
    
    func deepCopy() -> Point {
        return Point(x: x, y: y)
    }
}

class Line
{
    var start = Point()
    var end = Point()
    
    init(start: Point, end: Point)
    {
        self.start = start
        self.end = end
    }
    
    func deepCopy() -> Line
    {
        return Line(start: start.deepCopy(), end: end.deepCopy())
    }
}
