import Alamofire
import Foundation

public final class CoinGeckoApi {
    public static let baseURL = "https://api.coingecko.com/api/v3"

    public static func request(
        with route: Route,
        _ completion: @escaping (Result<Data, NetworkError>) -> Void
    ) {
        var path = "\(baseURL)\(route.path)"
        path = path.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? path

        AF.request(
            path,
            method: route.method,
            headers: []
        ).responseJSON { response in
            Inspector(response: response).monitor(completion: completion)
        }
    }
}
