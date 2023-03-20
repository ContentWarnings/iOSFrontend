import Foundation

struct SearchResponse: Decodable {
    var results: [MovieReduced]
}

struct NamesResponse: Decodable {
    var cws: [String]
}

struct DescriptionsResponse: Decodable {
    var response: String
}
