import Alamofire
import Foundation

class AppViewModel: ObservableObject {
    init() {
        getCurrentVersion()
    }

    func getCurrentVersion() {
        AF.request(apiURL).cacheResponse(using: .doNotCache)
            .responseDecodable(of: StringResponse.self) { response in
                switch response.result {
                case .success(let data):
                    self.updateWarningsIfNeeded(apiVersion: data.response)
                case.failure(let error):
                    debugPrint(error)
                }
            }
    }

    func updateWarningsIfNeeded(apiVersion: String) {
        let userDefaults = UserDefaults.standard

        if userDefaults.string(forKey: "CurrentVersion") != apiVersion {
            AF.request(apiURL + "names").cacheResponse(using: .doNotCache)
                .responseDecodable(of: NamesResponse.self) { response in
                    switch response.result {
                    case .success(let data):
                        for warning in data.cws where userDefaults.value(forKey: warning) == nil {
                            userDefaults.set(ContentWarning.WarningSetting.show.rawValue, forKey: warning)
                        }

                        userDefaults.set(apiVersion, forKey: "CurrentVersion")
                    case .failure(let error):
                        debugPrint(error)
                    }
                }
        }
    }
}
