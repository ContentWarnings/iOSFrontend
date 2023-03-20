import Alamofire
import SwiftUI
import Foundation

class SearchViewModel: ObservableObject {
    @Published var searchResults = [MovieReduced]()
    @Published var isDoneLoading = true

    var query: String
    var genre: String
    var sort: String

    init(query: String, genre: String, sort: String) {
        self.query = query
        self.genre = genre
        self.sort = sort
    }

    func performSearch() {
        self.isDoneLoading = false
        let parameters = [
            "q": self.query,
            "genre": self.genre == "None" ? "Disregard" : self.genre,
            "sort": SearchViewModel.searchSortOptions[self.sort]!
        ]
        print("TESTTESTTEST " + self.genre)

        AF.request("https://api.moviementor.app/search", parameters: parameters)
            .responseDecodable(of: SearchResponse.self) { response in
                switch response.result {
                case .success(let data):
                    self.searchResults = data.results
                    self.isDoneLoading = true
                case .failure(let error):
                    debugPrint(error)
                }
            }
    }
}

extension SearchViewModel {
    static let searchSortOptions = [
        "Relevance": "default_ascending",
        "Title (ascending)": "id_ascending",
        "Title (descending)": "id_descending",
        "Release Date (ascending)": "release_ascending",
        "Release Date (descending)": "release_descending",
        "MPA Rating (ascending)": "mpa_ascending",
        "MPA Rating (descending)": "mpa_descending",
        "Rating (ascending)": "rating_ascending",
        "Rating (descending)": "rating_descending",
        "Runtime (ascending)": "runtime_ascending",
        "Runtime (descending)": "runtime_descending"
    ]

    static let searchOptionNames = [
        "Relevance",
        "Title (ascending)",
        "Title (descending)",
        "Release Date (ascending)",
        "Release Date (descending)",
        "MPA Rating (ascending)",
        "MPA Rating (descending)",
        "Rating (ascending)",
        "Rating (descending)",
        "Runtime (ascending)",
        "Runtime (descending)"
    ]
}
