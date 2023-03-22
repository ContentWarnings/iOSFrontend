import Alamofire
import Foundation

class IndividualSettingViewModel: ObservableObject {
    @Published var description = String()
    @Published var isDoneLoading = false

    let warningName: String

    init(warningName: String) {
        self.warningName = warningName
        getDescription()
    }

    func getDescription() {
        let parameters = ["name": self.warningName]

        AF.request("https://api.moviementor.app/descriptions", parameters: parameters)
            .responseDecodable(of: StringResponse.self) { response in
                switch response.result {
                case .success(let data):
                    self.description = data.response
                    self.isDoneLoading = true
                case .failure(let error):
                    debugPrint(error)
                }
            }
    }
}
