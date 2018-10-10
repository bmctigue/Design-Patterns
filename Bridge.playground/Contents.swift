import Foundation

protocol Renderer
{
    var whatToRenderAs: String { get }
}

class RasterRenderer: Renderer {
    lazy var whatToRenderAs: String = "pixels"
}

class VectorRenderer: Renderer {
    lazy var whatToRenderAs: String = "lines"
}

class Shape: CustomStringConvertible
{
    var name: String = ""
    var renderer: Renderer
    
    init(_ renderer: Renderer) {
        self.renderer = renderer
    }
    
    var description: String
    {
        return "Drawing \(name) as \(self.renderer.whatToRenderAs)"
    }
}

class Triangle : Shape
{
    override init(_ renderer: Renderer)
    {
        super.init(renderer)
        name = "Triangle"
    }
}

class Square: Shape
{
    override init(_ renderer: Renderer)
    {
        super.init(renderer)
        name = "Square"
    }
}

class VectorSquare : Square
{
    
}

class RasterSquare : Square
{
    
}

class VectorTriangle : Triangle
{
    
}

class RasterTriangle : Triangle
{
    
}
