import Foundation

struct ContentWarningReduced: Comparable, Decodable, Identifiable {
    var id = UUID()
    var name: String

    // Sorted alphabetically with 'warn' warnings first
    static func < (lhs: ContentWarningReduced, rhs: ContentWarningReduced) -> Bool {
        let firstShouldWarn = lhs.shouldWarn()
        let secondShouldWarn = rhs.shouldWarn()

        if firstShouldWarn && !secondShouldWarn {
            return true
        } else if !firstShouldWarn && secondShouldWarn {
            return false
        } else {
            return lhs.name < rhs.name
        }
    }

    static func == (lhs: ContentWarningReduced, rhs: ContentWarningReduced) -> Bool {
        return lhs.id == rhs.id
    }

    func shouldHide() -> Bool {
        return UserDefaults.standard.string(forKey: self.name) == ContentWarning.WarningSetting.hide.rawValue
    }

    func shouldWarn() -> Bool {
        return UserDefaults.standard.string(forKey: self.name) == ContentWarning.WarningSetting.warn.rawValue
    }
}

extension ContentWarningReduced {
    static let testData: [ContentWarningReduced] =
    [
        ContentWarningReduced(name: "Murder"),
        ContentWarningReduced(name: "Kidnapping"),
        ContentWarningReduced(name: "Drug Use")
    ]
}
