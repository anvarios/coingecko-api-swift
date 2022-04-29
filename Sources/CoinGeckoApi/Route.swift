public protocol Route {
    var path: String { get }
    var method: HTTPMethod { get }
}

extension Route {
    public var method: HTTPMethod { .get }
}
