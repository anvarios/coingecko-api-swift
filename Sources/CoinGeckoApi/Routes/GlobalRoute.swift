public enum GlobalRoute: Route {
    case global
    case globalDecentralizedFinanceDefi
    
    public var path: String {
        switch self {
        case .global: return "/global"
        case .globalDecentralizedFinanceDefi: return "/global/decentralized_finance_defi"
        }
    }
}
