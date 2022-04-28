public enum ExchangeRatesRoute: Route {
    case exchangeRates
    
    public var path: String {
        switch self {
        case .exchangeRates: return "/exchange_rates"
        }
    }
}
