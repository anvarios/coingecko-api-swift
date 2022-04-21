import Alamofire
import Foundation

public struct Inspector {
    typealias Completion = (Result<Data, NetworkError>) -> Void
    typealias Kind<Model> = Model.Type
    private(set) var response: AFDataResponse<Any>
    
    public init(response: AFDataResponse<Any>) {
        self.response = response
    }
    
    public static var didCatchUnauthorizedUser: (() -> Void)?
    public static var shouldUpdateApplication: (() -> Void)?
    
    func monitor(completion: @escaping Completion) {
        if response.error?._code == 13 {
            completion(.failure(.timeout))
            return
        }
        
        guard let statusCode = response.response?.statusCode else {
            completion(.failure(.unableToGetStatusCode))
            return
        }
        
        if statusCode >= 400 {
            LogManager.log(statusCode: statusCode, response)
            completion(.failure(.clientError))
            return
        }
        
        // Shows log
        LogManager.log(statusCode: statusCode, response)
        
        guard let data = response.data else {
            completion(.failure(.dataIsNil))
            return
        }
        
        switch response.result {
        case .success: completion(.success(data))
        case .failure(let error):
            completion(.failure(.alamofireError(description: error.localizedDescription)))
        }
    }

}
