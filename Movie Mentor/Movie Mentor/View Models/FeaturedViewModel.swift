import Alamofire
import Foundation

class FeaturedViewModel: ObservableObject {
    @Published var movies = [MovieReduced]()
    @Published var isDoneLoading = false

    init() {
        getTrendingMovies()
    }

    func getTrendingMovies() {
        AF.request("https://api.moviementor.app/search").responseDecodable(of: SearchResponse.self) { response in
            switch response.result {
            case .success(let data):
                self.movies = data.results
                self.isDoneLoading = true
            case .failure(let error):
                debugPrint(error)
            }
        }
    }
}
