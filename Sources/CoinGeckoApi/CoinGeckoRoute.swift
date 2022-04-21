import Alamofire

public enum CoinGeckoRoute: Route {
    case ping
    
    case simplePrice(
        ids: [String],
        vsCurrencies: [String],
        includeMarketCap: Bool,
        include24hrVol: Bool,
        include24hrChange: Bool,
        includeLastUpdatedAt: Bool
    )
    case coinsList(includePlatform: Bool)

    public var path: String {
        switch self {
        case .ping: return "/ping"
        case .simplePrice(
            let ids,
            let vsCurrencies,
            let includeMarketCap,
            let include24hrVol,
            let include24hrChange,
            let includeLastUpdatedAt
        ): return "/simple/price?ids=\(ids.joined(separator: ","))&vs_currencies=\(vsCurrencies.joined(separator: ","))&include_market_cap=\(includeMarketCap)&include_24hr_vol=\(include24hrVol)&include_24hr_change=\(include24hrChange)&include_last_updated_at=\(includeLastUpdatedAt)"
        case .coinsList(let includePlatform):
            return "/coins/list?include_platform=\(includePlatform)"
        }
    }

    public var method: HTTPMethod {
        return .get
    }
}
