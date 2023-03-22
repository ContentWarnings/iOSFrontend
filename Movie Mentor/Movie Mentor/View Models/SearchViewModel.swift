// https://www.donnywals.com/implementing-an-infinite-scrolling-list-with-swiftui-and-combine/

import Alamofire
import SwiftUI
import Foundation

class SearchViewModel: ObservableObject {
    @Published var searchResults = [MovieReduced]()
    @Published var isDoneLoading = true
    @Published var isLoadingNextPage = false

    var query: String
    var genre: String
    var sort: String

    private var canLoadMorePages = true
    private var currentPage = 1

    init(query: String, genre: String, sort: String) {
        self.query = query
        self.genre = genre
        self.sort = sort
    }

    func performSearch(query: String, genre: String, sort: String) {
        self.query = query
        self.genre = genre
        self.sort = sort

        self.isDoneLoading = false
        self.canLoadMorePages = true
        self.currentPage = 1

        let parameters = [
            "q": self.query,
            "genre": self.genre == "Any" ? "Disregard" : self.genre,
            "sort": SearchViewModel.searchSortOptions[self.sort]!
        ]

        AF.request(apiURL + "search", parameters: parameters)
            .responseDecodable(of: SearchResponse.self) { response in
                switch response.result {
                case .success(let data):
                    var containsResults = false

                    // Check if all movies need to be hidden
                    for movie in data.results where !movie.shouldHide() {
                        containsResults = true
                        break
                    }

                    if containsResults {
                        self.isDoneLoading = true
                        self.searchResults = data.results
                    } else if data.results.count == 0 {
                        // Backend responded with no results, so don't check any more pages
                        self.canLoadMorePages = false
                    } else {
                        // Backend returned results but they were all hidden, so try next page
                        self.loadNextPage()
                    }
                case .failure(let error):
                    debugPrint(error)
                }
            }
    }

    func loadNextPageIfNeeded(currentItem: MovieReduced) {
        // If the current item is 5 away from the last, start loading the next page
        let thresholdIndex = searchResults.index(searchResults.endIndex, offsetBy: -5)
        if searchResults.firstIndex(where: { $0.id == currentItem.id }) == thresholdIndex {
            loadNextPage()
        }
    }

    func loadNextPage() {
        guard !isLoadingNextPage && canLoadMorePages else {
            return
        }

        self.isLoadingNextPage = true
        self.currentPage += 1

        let parameters = [
            "q": self.query,
            "p": self.currentPage.description,
            "genre": self.genre == "Any" ? "Disregard" : self.genre,
            "sort": SearchViewModel.searchSortOptions[self.sort]!
        ]

        AF.request(apiURL + "search", parameters: parameters)
            .responseDecodable(of: SearchResponse.self) { response in
                switch response.result {
                case .success(let data):
                    var containsResults = false

                    // Check if all movies need to be hidden
                    for movie in data.results where !movie.shouldHide() {
                        containsResults = true
                        break
                    }

                    if containsResults {
                        self.isLoadingNextPage = false
                        self.searchResults += data.results
                    } else if data.results.count == 0 {
                        // Backend responded with no results, so don't check any more pages
                        self.isLoadingNextPage = false
                        self.canLoadMorePages = false
                    } else {
                        // Backend returned results but they were all hidden, so try next page
                        self.loadNextPage()
                    }
                case .failure(let error):
                    debugPrint(error)
                }
            }
    }

    func cancelAllRequests() {
        Alamofire.Session.default.session.getAllTasks { tasks in
            tasks.forEach { $0.cancel() }
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
