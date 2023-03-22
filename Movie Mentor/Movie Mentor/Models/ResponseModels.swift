import Foundation

struct SearchResponse: Decodable {
    var results: [MovieReduced]
}

struct NamesResponse: Decodable {
    var cws: [String]
}

struct StringResponse: Decodable {
    var response: String
}

let apiURL = "https://api.moviementor.app/"
