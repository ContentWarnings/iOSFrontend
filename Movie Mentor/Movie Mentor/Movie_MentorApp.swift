import Alamofire
import SwiftUI

@main
struct Movie_MentorApp: App {
    init() {
        URLCache.shared.removeAllCachedResponses()
        let userDefaults = UserDefaults.standard

        // If default values have not been initalized, set all preferences to "show"
        if !userDefaults.bool(forKey: "DefaultsSet") {
            AF.request(apiURL + "names").cacheResponse(using: .doNotCache)
                .responseDecodable(of: NamesResponse.self) { response in
                    switch response.result {
                    case .success(let data):
                        for warning in data.cws where userDefaults.value(forKey: warning) == nil {
                            userDefaults.set(ContentWarning.WarningSetting.show.rawValue, forKey: warning)
                        }

                        userDefaults.set(true, forKey: "DefaultsSet")
                    case .failure(let error):
                        debugPrint(error)
                    }
                }
        }
    }

    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
