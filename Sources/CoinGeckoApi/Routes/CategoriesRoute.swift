public enum CategoriesRoute: Route {
    case categoriesList
    case categories(order: String)
    
    public var path: String {
        switch self {
        case .categoriesList: return "/coins/categories/list"
        case .categories(let order): return "/coins/categories?order=\(order)"
        }
    }
}
