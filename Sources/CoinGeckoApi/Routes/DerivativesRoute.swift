public enum DerivativesRoute: Route {
    case derivativesExchangesList
    case derivatives(includeTickers: String)
    case derivativesExchanges(
        order: String,
        perPage: Int,
        page: Int
    )
    case derivativesExchangesId(
        id: String,
        includeTickers: String
    )
    
    public var path: String {
        switch self {
        case .derivativesExchangesList: return "/derivatives/exchanges/list"
        case .derivatives(let includeTickers): return "/derivatives?include_tickers=\(includeTickers)"
        case .derivativesExchanges(
            let order,
            let perPage,
            let page
        ): return "/derivatives/exchanges?order=\(order)&per_page=\(perPage)&page=\(page)"
        case .derivativesExchangesId(
            let id,
            let includeTickers
        ): return "/derivatives/exchanges/\(id)?include_tickers=\(includeTickers)"
        }
    }
}
