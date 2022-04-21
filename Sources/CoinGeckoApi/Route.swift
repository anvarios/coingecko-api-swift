import Alamofire

public protocol Route {
    var path: String { get }
    var method: HTTPMethod { get }
}
