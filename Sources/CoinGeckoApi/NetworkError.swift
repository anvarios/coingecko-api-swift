public enum NetworkError: Error {
    case noInternetConnection
    case unableToGetStatusCode
    case couldNotDecodeResponseData(description: String)
    case alamofireError(description: String)
    case clientError
    case timeout
    case dataIsNil
    
    var localizedDescription: String {
        switch self {
        case .dataIsNil:
            return "Response data is nil"
            
        default:
            return ""
        }
    }
}
