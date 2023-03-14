import Alamofire
import Foundation

class FeaturedViewModel: ObservableObject {
    @Published var movies = [MovieReduced]()

    init() {
        getTrendingMovies()
    }

    func getTrendingMovies() {
        AF.request("https://api.moviementor.app/search")
            .responseDecodable(of: FeaturedViewModel.TrendingResults.self) { response in
                switch response.result {
                case .success(let data):
                    self.movies = data.results
                case .failure(let error):
                    debugPrint(error)
                }
            }
    }
}

extension FeaturedViewModel {
    struct TrendingResults: Decodable {
        var results: [MovieReduced]
    }
}
