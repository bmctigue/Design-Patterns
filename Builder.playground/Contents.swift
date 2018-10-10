import Foundation

struct BuilderProperty: CustomStringConvertible {
    var name: String = ""
    var type: String = ""
    
    var description: String {
        return "var \(name): \(type)"
    }
}

class CodeBuilder : CustomStringConvertible
{
    static private let defaultIndation = 2
    
    private var rootName: String = ""
    private var properties: [BuilderProperty] = []
    private var indentationSize: Int!
    
    init(_ rootName: String, _ indentation: Int = CodeBuilder.defaultIndation)
    {
        self.rootName = rootName
        self.indentationSize = indentation
    }
    
    func addField(called name: String, ofType type: String) -> CodeBuilder
    {
        let property = BuilderProperty(name: name, type: type)
        properties.append(property)
        return self
    }
    
    var description: String
    {
        var result = "class \(rootName)\n"
        result += "{\n"
        for property in properties {
            result += "\(indentation())\(property.description)\n"
        }
        result += "}"
        return result
    }
    
    private func indentation() -> String
    {
        return String(repeating: " ", count: indentationSize)
    }
}

var cb = CodeBuilder("Person").addField(called: "name", ofType: "String").addField(called: "age", ofType: "Int")
print(cb.description)
