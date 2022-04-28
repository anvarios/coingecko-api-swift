public enum CoinsRoute: Route {
    case coinsList(includePlatform: Bool)
    case coinsMarket(
        vsCurrency: String,
        ids: [String],
        category: String,
        order: String,
        perPage: Int,
        page: Int,
        sparkline: Bool,
        priceChangePercentage: [String]
    )
    case coinsId(
        id: String,
        localization: Bool,
        tickers: Bool,
        marketData: Bool,
        communityData: Bool,
        developerData: Bool,
        sparkline: Bool
    )
    case coinsIdTickers(
        id: String,
        exchangeIds: String,
        includeExchangeLogo: Bool,
        page: Int,
        order: String,
        depth: Bool
    )
    case coinsIdHistory(
        id: String,
        date: String,
        localization: String
    )
    case coinsIdMarketChart(
        id: String,
        vsCurrency: String,
        days: String,
        interval: String
    )
    case coinsIdMarketChartRange(
        id: String,
        vsCurrency: String,
        from: String,
        to: String
    )
    case coinsIdOhlc(
        id: String,
        vsCurrency: String,
        days: Int
    )

    public var path: String {
        switch self {
        case .coinsList(let includePlatform):
            return "/coins/list?include_platform=\(includePlatform)"
        case .coinsMarket(
            let vsCurrency,
            let ids,
            let category,
            let order,
            let perPage,
            let page,
            let sparkline,
            let priceChangePercentage
        ): return "/coins/markets?vs_currency=\(vsCurrency)&ids=\(ids.joined(separator: ","))&category=\(category)&order=\(order)&per_page=\(perPage)&page=\(page)&sparkline=\(sparkline)&price_change_percentage=\(priceChangePercentage.joined(separator: ","))"
        case .coinsId(
            let id,
            let localization,
            let tickers,
            let marketData,
            let communityData,
            let developerData,
            let sparkline
        ): return "/coins/\(id)?localization=\(localization)&tickers=\(tickers)&market_data=\(marketData)&community_data=\(communityData)&developer_data=\(developerData)&sparkline=\(sparkline)"
        case .coinsIdTickers(
            let id,
            let exchangeIds,
            let includeExchangeLogo,
            let page,
            let order,
            let depth
        ): return "/coins/\(id)/tickers?exchange_ids=\(exchangeIds)&include_exchange_logo=\(includeExchangeLogo)&page=\(page)&order=\(order)&depth=\(depth)"
        case .coinsIdHistory(
            let id,
            let date,
            let localization
        ): return "/coins/\(id)/history?date=\(date)&localization=\(localization)"
        case .coinsIdMarketChart(
            let id,
            let vsCurrency,
            let days,
            let interval
        ): return "/coins/\(id)/market_chart?vs_currency=\(vsCurrency)&days=\(days)&interval=\(interval)"
        case .coinsIdMarketChartRange(
            let id,
            let vsCurrency,
            let from,
            let to
        ): return "/coins/\(id)/market_chart/range?vs_currency=\(vsCurrency)&from=\(from)&to=\(to)"
        case .coinsIdOhlc(
            let id,
            let vsCurrency,
            let days
        ): return "/coins/\(id)/ohlc?vs_currency=\(vsCurrency)&days=\(days)"
        }
    }
}
