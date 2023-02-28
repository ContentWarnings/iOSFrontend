import SwiftUI

@main
struct Movie_MentorApp: App {
    init() {
        let userDefaults = UserDefaults.standard

        // If default values have not been initalized, set all preferences to "show"
        if !userDefaults.bool(forKey: "DefaultsSet") {
            // TODO: Update to full warning list from API
            for warning in ContentWarning.testData where userDefaults.value(forKey: warning.name) == nil {
                userDefaults.set(ContentWarning.WarningSetting.show.rawValue, forKey: warning.name)
            }

            userDefaults.set(true, forKey: "DefaultsSet")
        }
    }

    var body: some Scene {
        WindowGroup {
            NavigationView {
                MainView()
            }
        }
    }
}
