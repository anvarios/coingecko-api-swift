public struct RPing: Codable {
    public let geckoSays: String
    
    private enum CodingKeys: String, CodingKey {
        case geckoSays = "gecko_says"
    }
}
