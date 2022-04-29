import Foundation

public struct Inspector {
    static func monitor(request: URLRequest, data: Data?, response: URLResponse?, error: Error?, completion: @escaping (Result<Data, NetworkError>) -> Void) {
        if let error = error {
            completion(.failure(.customError(description: error.localizedDescription)))
            return
        }
        
        guard let response = response else {
            completion(.failure(.noInternetConnection))
            return
        }
        
        guard let statusCode = (response as? HTTPURLResponse)?.statusCode else {
            completion(.failure(.unableToGetStatusCode))
            return
        }
        
        LogManager.log(request: request, data: data, statusCode: statusCode, response)
        
        if statusCode >= 400 {
            completion(.failure(.clientError))
            return
        }
        
        guard let data = data else {
            completion(.failure(.dataIsNil))
            return
        }
        
        completion(.success(data))
    }
}
