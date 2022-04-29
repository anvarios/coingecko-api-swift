import Foundation

public final class CoinGeckoApi {
    public static let baseURL = "https://api.coingecko.com/api/v3"
    
    public static func request(
        with route: Route,
        _ completion: @escaping (Result<Data, NetworkError>) -> Void
    ) -> Void {
        var path = "\(baseURL)\(route.path)"
        path = path.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? path
        
        let requestURL = URL(string: path)
        var request = URLRequest(url: requestURL!)

        request.httpMethod = route.method.rawValue
        
        let requestTask = URLSession.shared.dataTask(with: request) {
            (data: Data?, response: URLResponse?, error: Error?) in
            Inspector.monitor(
                request: request,
                data: data,
                response: response,
                error: error,
                completion: completion
            )
        }
        requestTask.resume()
    }
}
