import Alamofire
import Foundation

internal final class LogManager {    
    private static var logCounter = 0
    
    static func log(statusCode: Int, _ response: AFDataResponse<Any>) {
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
        
        if let headers = request.allHTTPHeaderFields {
            do {
                let data = try JSONSerialization.data(withJSONObject: headers, options: [])
                let json = try JSONSerialization.jsonObject(with: data, options: [])
                print("» HEADERS:\n\(json)")
            } catch {
                print("» HEADERS debug error:\n\(error)")
            }
        }
        
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
