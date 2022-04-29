public enum NetworkError: Error {
    case noInternetConnection
    case unableToGetStatusCode
    case customError(description: String)
    case clientError
    case dataIsNil
    
    var localizedDescription: String {
        switch self {
        case .dataIsNil: return "Response data is nil"
        default: return ""
        }
    }
}
