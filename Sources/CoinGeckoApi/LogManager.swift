import Alamofire
import Foundation

internal final class LogManager {    
    fileprivate static var logCounter = 0
    
    static func log<Model: Codable>(statusCode: Int, _ response: AFDataResponse<Any>, _ decode: Model.Type) {
        #if DEBUG
        DispatchQueue.main.async {
            logCounter += 1
            debugPrintRequest(response.request, with: logCounter)
            debugPrintResponseData(response.data, with: logCounter, statusCode: statusCode)
            print("\n« ------------- « ----------------- « o » ------------- » ----------------- »\n")
        }
        #endif
    }
    
    static func debugPrintRequest(_ request: URLRequest?, with id: Int) {
        guard let request = request else { return }
        let method = request.httpMethod ?? String.init()
        print("\nRequest #\(id):")
        print("» \(method) \(request)")
        
        // Display headers
        if let headers = request.allHTTPHeaderFields {
            do {
                let data = try JSONSerialization.data(withJSONObject: headers, options: [])
                let json = try JSONSerialization.jsonObject(with: data, options: [])
                print("» HEADERS:\n\(json)")
            } catch {
                print("» HEADERS debug error:\n\(error)")
            }
        }
        
        // Display body
        if let body = request.httpBody {
            do {
                let json = try JSONSerialization.jsonObject(with: body, options: [.allowFragments])
                print("» HTTP BODY:\n\(json)")
            } catch {
                print("» HTTP BODY debug error:\n\(error)")
            }
        }
    }
    
    static func debugPrintResponseData(_ data: Data?, with id: Int, statusCode: Int) {
        guard let data = data else { return }
        do {
            let json = try JSONSerialization.jsonObject(with: data, options: [.allowFragments])
            print("\nResponse #\(id):")
            print("» Status code: \(statusCode)")
            print("» Object:\n\(json)\n")
            
//            guard let plainText = String.init(data: data, encoding: .utf8) else {
//                return
//            }
//            print("» Plain text #\(id):\n\(plainText)")
        } catch {
            print("» Response debug error:\n \(error)")
            print("» Localized description:\n \(error.localizedDescription)")
            
            if let alamofireError = error.asAFError {
                print("» Alamofire debug error:\n \(alamofireError)")
                print("» Alamofire Localized description:\n \(alamofireError.localizedDescription)")
            }
        }
    }
}
