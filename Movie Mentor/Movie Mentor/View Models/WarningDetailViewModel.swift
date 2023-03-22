import Alamofire
import Foundation

class WarningDetailViewModel: ObservableObject {
    @Published var didUpvote = false
    @Published var didDownvote = false

    let warning: ContentWarning

    init(warning: ContentWarning) {
        self.warning = warning
        checkIfVoted()
    }

    func checkIfVoted() {
        AF.request(apiURL + "cw/" + warning.id + "/has-voted")
            .responseDecodable(of: StringResponse.self) { response in
                switch response.result {
                case.success(let data):
                    debugPrint(data.response)
                    self.didUpvote = data.response == "upvoted"
                    self.didDownvote = data.response == "downvoted"
                case.failure(let error):
                    debugPrint(error)
                }
            }
    }

    func upvote() {
        AF.request(apiURL + "cw/" + warning.id + "/upvote")
            .responseDecodable(of: StringResponse.self) { response in
                switch response.result {
                case .success(let data):
                    debugPrint(data.response)
                    self.didUpvote = true
                    self.didDownvote = false
                case .failure(let error):
                    debugPrint(error)
                }
            }
    }

    func downvote() {
        AF.request(apiURL + "cw/" + warning.id + "/downvote")
            .responseDecodable(of: StringResponse.self) { response in
                switch response.result {
                case .success(let data):
                    debugPrint(data.response)
                    self.didUpvote = false
                    self.didDownvote = true
                case .failure(let error):
                    debugPrint(error)
                }
            }
    }
}
