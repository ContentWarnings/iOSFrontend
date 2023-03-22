import Alamofire
import Foundation

class MovieDetailsViewModel: ObservableObject {
    @Published var movie = MovieFull.testData
    @Published var isDoneLoading = false

    let movieId: Int

    init(movieId: Int) {
        self.movieId = movieId
        getMovie()
    }

    func getMovie() {
        AF.request(apiURL + "movie/" + movieId.description).cacheResponse(using: .doNotCache)
            .responseDecodable(of: MovieFull.self) { response in
                switch response.result {
                case .success(let data):
                    self.movie = data
                    self.isDoneLoading = true
                case .failure(let error):
                    debugPrint(error)
                }
            }
    }
}
