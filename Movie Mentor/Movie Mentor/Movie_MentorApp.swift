import Alamofire
import SwiftUI

@main
struct Movie_MentorApp: App {
    @StateObject var viewModel = AppViewModel()

    init() {
        URLCache.shared.removeAllCachedResponses()
    }

    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
