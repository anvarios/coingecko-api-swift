import Alamofire

public final class CoinGeckoApi {
    public static let baseURL = "https://api.coingecko.com/api/v3"

    private static func request<T: Codable>(
        with route: CoinGeckoRoute,
        _ completion: @escaping (Result<T, NetworkError>) -> Void
    ) {
        var path = "\(baseURL)\(route.path)"
        path = path.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? path

        AF.request(
            path,
            method: route.method,
            headers: []
        ).responseJSON { response in
            Inspector(response: response).monitor(kind: T.self, completion: completion)
        }
    }
    
    public static func ping(_ completion: @escaping (Result<RPing, NetworkError>) -> Void){
        request(with: .ping, completion)
    }
    
    public static func getCoinsList(includePlatform: Bool, _ completion: @escaping (Result<[RCoin], NetworkError>) -> Void) {
        request(with: .coinsList(includePlatform: includePlatform), completion)
    }
}
