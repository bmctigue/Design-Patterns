import Foundation

class SingletonTester
{
    static func isSingleton(factory: () -> AnyObject) -> Bool
    {
        let instance1 = factory()
        let instance2 = factory()
        return instance1 === instance2
    }
}
