import Foundation

struct TrendingResponse: Decodable {
    var results: [MovieReduced]
}

struct NamesResponse: Decodable {
    var cws: [String]
}
