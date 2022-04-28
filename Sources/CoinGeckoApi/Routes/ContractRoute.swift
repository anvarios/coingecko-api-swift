public enum ContractRoute: Route {
    case contract(
        id: String,
        contractAddress: String
    )
    
    case contractMarketChart(
        id: String,
        contractAddress: String,
        vsCurrency: String,
        days: String
    )
    case contractMarketChartRange(
        id: String,
        contractAddress: String,
        vsCurrency: String,
        from: String,
        to: String
    )
    
    public var path: String {
        switch self {
        case .contract(
            let id,
            let contractAddress
        ): return "/coins/\(id)/contract/\(contractAddress)"
        case .contractMarketChart(
            let id,
            let contractAddress,
            let vsCurrency,
            let days
        ): return "/coins/\(id)/contract/\(contractAddress)/market_chart?vs_currency=\(vsCurrency)&days=\(days)"
        case .contractMarketChartRange(
            let id,
            let contractAddress,
            let vsCurrency,
            let from,
            let to
        ): return "/coins/\(id)/contract/\(contractAddress)/market_chart/range?vs_currency=\(vsCurrency)&from=\(from)&to=\(to)"
        }
    }
}
