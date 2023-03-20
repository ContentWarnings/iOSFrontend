import Alamofire
import SwiftUI
import Foundation

class SearchViewModel: ObservableObject {
    @Published var searchResults = [MovieReduced]()
    @Published var isDoneLoading = true

    var query: String

    init(query: String) {
        self.query = query
    }

    func performSearch() {
        self.isDoneLoading = false
        let parameters = ["q": self.query]

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
