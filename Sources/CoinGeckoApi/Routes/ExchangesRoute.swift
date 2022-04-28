public enum ExchangesRoute: Route {
    case exchangesList
    case exchangesId(id: String)
    case exchanges(
        perPage: Int,
        page: String
    )
    case exchangesIdTickers(
        id: String,
        coinIds: String,
        includeExchangeLogo: String,
        page: Int,
        depth: String,
        order: String
    )
    case exchangesIdVolumeChart(
        id: String,
        days: Int
    )
    
    public var path: String {
        switch self {
        case .exchangesList: return "/exchanges/list"
        case .exchangesId(let id): return "/exchanges/\(id)"
        case .exchanges(
            let perPage,
            let page
        ): return "/exchanges?per_page=\(perPage)&page=\(page)"
        case .exchangesIdTickers(
            let id,
            let coinIds,
            let includeExchangeLogo,
            let page,
            let depth,
            let order
        ): return "/exchanges/\(id)/tickers?coin_ids=\(coinIds)&include_exchange_logo=\(includeExchangeLogo)&page=\(page)&depth=\(depth)&order=\(order)"
        case .exchangesIdVolumeChart(
            let id,
            let days
        ): return "/exchanges/\(id)/volume_chart?days=\(days)"
        }
    }
}
