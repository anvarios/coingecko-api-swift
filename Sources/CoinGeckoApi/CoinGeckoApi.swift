import Alamofire
import Foundation

public final class CoinGeckoApi {
    public static let baseURL = "https://api.coingecko.com/api/v3"

    public static func request(
        with route: CoinGeckoRoute,
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
    
//    public static func ping(_ completion: @escaping (Result<Data, NetworkError>) -> Void){
//        request(with: .ping, completion)
//    }
//    
//    public static func getCoinsList(includePlatform: Bool, _ completion: @escaping (Result<Data, NetworkError>) -> Void) {
//        request(with: .coinsList(includePlatform: includePlatform), completion)
//    }
//    
//    
//    
//    public static func getSimplePrice(
//        ids: [String],
//        vsCurrencies: [String],
//        includeMarketCap: Bool = true,
//        include24hrVol: Bool = true,
//        include24hrChange: Bool = true,
//        includeLastUpdatedAt: Bool = true,
//        _ completion: @escaping (Result<Data, NetworkError>) -> Void
//    ) {
//        request(with: .simplePrice(ids: ids, vsCurrencies: vsCurrencies, includeMarketCap: includeMarketCap, include24hrVol: include24hrVol, include24hrChange: include24hrChange, includeLastUpdatedAt: includeLastUpdatedAt), completion)
//    }
//    
//    public static
}
