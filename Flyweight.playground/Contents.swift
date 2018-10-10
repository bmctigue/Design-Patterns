import Foundation

class Sentence : CustomStringConvertible
{
    var wordTokens = [WordToken]()
    
    init(_ plainText: String)
    {
        let words = plainText.components(separatedBy: " ")
        wordTokens = words.map { WordToken($0) }
    }
    
    subscript(index: Int) -> WordToken
    {
        get {
            return wordTokens[index]
        }
        set {
            wordTokens[index] = newValue
        }
    }
    
    var description: String
    {
        let stringArray = wordTokens.map {
            return $0.capitalize ? $0.word.uppercased() : $0.word
        }
        return stringArray.joined(separator: " ")
    }
    
    class WordToken
    {
        var capitalize: Bool = false
        var word: String
        
        init(_ word: String) {
            self.word = word
        }
    }
}

var sentence = Sentence("hello world")
sentence[0].capitalize = true
sentence[1].capitalize = true
print(sentence)
