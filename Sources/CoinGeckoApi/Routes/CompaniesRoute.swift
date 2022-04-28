public enum CompaniesRoute: Route {
    case publicTreasuryCoinId(coinId: String)
    
    public var path: String {
        switch self {
        case .publicTreasuryCoinId(let coinId): return "/companies/public_treasury/\(coinId)"
        }
    }
}
