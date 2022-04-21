import Alamofire
import Foundation

public struct Inspector {
    typealias Completion<Model> = (Result<Model, NetworkError>) -> Void
    typealias Kind<Model> = Model.Type
    private(set) var response: AFDataResponse<Any>
    
    public init(response: AFDataResponse<Any>) {
        self.response = response
    }
    
    public static var didCatchUnauthorizedUser: (() -> Void)?
    public static var shouldUpdateApplication: (() -> Void)?
    
    func monitor<Model: Codable>(kind: Kind<Model>, completion: @escaping Completion<Model>) {
        if response.error?._code == 13 {
            completion(.failure(.timeout))
            return
        }
        
        guard let statusCode = response.response?.statusCode else {
            completion(.failure(.unableToGetStatusCode))
            return
        }
        
        if statusCode >= 400 {
            LogManager.log(statusCode: statusCode, response, kind)
            completion(.failure(.clientError))
            return
        }
        
        // Shows log
        LogManager.log(statusCode: statusCode, response, kind)
        
        do {
            switch response.result {
            case .success:
                let model: Model = try decode(from: response.data)
                completion(.success(model))
                
            case .failure(let error):
                completion(.failure(.alamofireError(description: error.localizedDescription)))
            }
        } catch {
            completion(.failure(.couldNotDecodeResponseData(description: error.localizedDescription)))
        }
    }
 
    private func decode<Model: Codable>(from data: Data?) throws -> Model {
        guard let data = data else {
            throw NetworkError.dataIsNil
        }
        
        do {
            return try JSONDecoder().decode(Model.self, from: data)
        } catch {
            throw error
        }
    }
}
