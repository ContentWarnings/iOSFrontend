import Alamofire
import Foundation

class WarningSettingsViewModel: ObservableObject {
    @Published var warningNames = [String]()
    @Published var isDoneLoading = false

    init() {
        getWarningNames()
    }

    func getWarningNames() {
        AF.request(apiURL + "names").cacheResponse(using: .doNotCache)
            .responseDecodable(of: NamesResponse.self) { response in
                switch response.result {
                case .success(let data):
                    self.warningNames = data.cws.sorted()
                    self.isDoneLoading = true
                case .failure(let error):
                    debugPrint(error)
                }
            }
    }
}
