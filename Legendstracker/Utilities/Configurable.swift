import Foundation

protocol Configurable {

    associatedtype T = Self
    func configure(_ work: (T) -> Void) -> T
}

extension Configurable {

    @discardableResult
    func configure(_ work: (Self) -> Void) -> Self {
        work(self)
        return self
    }
}

extension NSObject: Configurable {}
extension JSONDecoder: Configurable {}
extension JSONEncoder: Configurable {}
