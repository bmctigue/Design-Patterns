import Foundation
import XCTest

protocol Log
{
    var recordLimit: Int { get }
    var recordCount: Int { get set }
    func logInfo(_ message: String)
}

enum LogError : Error
{
    case recordNotUpdated
    case logSpaceExceeded
}

class Account
{
    private var log: Log
    
    init(_ log: Log)
    {
        self.log = log
    }
    
    func someOperation() throws
    {
        let c = log.recordCount
        log.logInfo("Performing an operation")
        if (c+1) != log.recordCount
        {
            throw LogError.recordNotUpdated
        }
        if log.recordCount >= log.recordLimit
        {
            throw LogError.logSpaceExceeded
        }
    }
}

class NullLog : Log
{
    var recordLimit: Int = 0
    var recordCount: Int = 0
    
    func logInfo(_ message: String) {
        recordCount += 1
        recordLimit = recordCount + 1
    }
}

class NullLogTests: XCTestCase {
    
}

NullLogTests.defaultTestSuite.run()
