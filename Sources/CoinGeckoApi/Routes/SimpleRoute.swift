public enum SimpleRoute: Route {
    case simplePrice(
        ids: [String],
        vsCurrencies: [String],
        includeMarketCap: Bool,
        include24hrVol: Bool,
        include24hrChange: Bool,
        includeLastUpdatedAt: Bool
    )
    case simpleTokenPrice(
        id: String,
        contractAddresses: [String],
        vsCurrencies: [String],
        includeMarketCap: Bool,
        include24hrVol: Bool,
        include24hrChange: Bool,
        includeLastUpdatedAt: Bool
    )
    case simpleSupportedVsCurrencies
    
    public var path: String {
        switch self {
        case .simplePrice(
            let ids,
            let vsCurrencies,
            let includeMarketCap,
            let include24hrVol,
            let include24hrChange,
            let includeLastUpdatedAt
        ): return "/simple/price?ids=\(ids.joined(separator: ","))&vs_currencies=\(vsCurrencies.joined(separator: ","))&include_market_cap=\(includeMarketCap)&include_24hr_vol=\(include24hrVol)&include_24hr_change=\(include24hrChange)&include_last_updated_at=\(includeLastUpdatedAt)"
        case .simpleTokenPrice(
            let id,
            let contractAddresses,
            let vsCurrencies,
            let includeMarketCap,
            let include24hrVol,
            let include24hrChange,
            let includeLastUpdatedAt
        ): return "/simple/token_price/\(id)?contract_addresses=\(contractAddresses.joined(separator: ","))&vs_currencies=\(vsCurrencies.joined(separator: ","))&include_market_cap=\(includeMarketCap)&include_24hr_vol=\(include24hrVol)&include_24hr_change=\(include24hrChange)&include_last_updated_at=\(includeLastUpdatedAt)"
        case .simpleSupportedVsCurrencies: return "/simple/supported_vs_currencies"
        }
    }
}
