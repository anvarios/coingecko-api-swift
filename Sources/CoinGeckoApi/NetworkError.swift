public enum NetworkError: Error {
    /// If user turned off wife/cellur internet connection
    case noInternetConnection
    /// Could get status code from response
    case unableToGetStatusCode
    /// Could not decode data to model
    case couldNotDecodeResponseData(description: String)
    /// The error seems to have been caused by the alamofire framework
    case alamofireError(description: String)
    /// The error seems to have been caused by the client
    case clientError
    /// If during a connection attempt the request remains idle for longer than the timeout interval,
    /// the request is considered to have timed out.
    case timeout
    /// Response data is nil
    case dataIsNil
    
    /// Retrieve the localized description for this error
    var localizedDescription: String {
        switch self {
        case .dataIsNil:
            return "Response data is nil"
            
        default:
            return ""
        }
    }
}
