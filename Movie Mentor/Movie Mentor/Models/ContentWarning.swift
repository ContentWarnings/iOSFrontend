import Foundation

struct ContentWarning: Identifiable, Comparable {
    var id: String
    var name: String
    var times: [(Int, Int)]
    var description: String

    static func < (lhs: ContentWarning, rhs: ContentWarning) -> Bool {
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

    static func == (lhs: ContentWarning, rhs: ContentWarning) -> Bool {
        return lhs.id == rhs.id
    }

    static func timeString(startTime: Int, endTime: Int) -> String {
        let startHour = startTime / 60
        let startMinute = String(format: "%02d", startTime % 60)
        let endHour = endTime / 60
        let endMinute = String(format: "%02d", endTime % 60)

        return "\(startHour):\(startMinute) - \(endHour):\(endMinute)"
    }

    func shouldHide() -> Bool {
        return UserDefaults.standard.string(forKey: self.name) == ContentWarning.WarningSetting.hide.rawValue
    }

    func shouldWarn() -> Bool {
        return UserDefaults.standard.string(forKey: self.name) == ContentWarning.WarningSetting.warn.rawValue
    }

    func timeSummaryString() -> String {
        if times.count > 1 {
            return "Multiple Instances"
        } else {
            return ContentWarning.timeString(startTime: self.times[0].0, endTime: self.times[0].1)
        }
    }

    func allTimesString() -> String {
        var res = ""

        for time in times {
            res += ContentWarning.timeString(startTime: time.0, endTime: time.1) + "\n"
        }

        return res
    }
}

extension ContentWarning {
    static let testData: [ContentWarning] =
    [
        ContentWarning(id: "cc8ea1b8-2155-4e35-97b5-cda4058edc0e",
                       name: "Murder",
                       times: [(1, 2), (3, 4)],
                       description: "Blue people die."),
        ContentWarning(id: "cc8ea1b8-2155-4e35-97b5-cda4058acd3",
                       name: "Kidnapping",
                       times: [(3, 4)],
                       description: "Blue people are kidnapped."),
        ContentWarning(id: "cc8ea1b8-2155-4e35-97b5-cda4058edabde",
                       name: "Drug Use",
                       times: [(92, 128)],
                       description: "Blue people use drugs.")
    ]
}

extension ContentWarning {
    enum WarningSetting: String {
        case show = "Show"
        case warn = "Warn"
        case hide = "Hide"
    }
}
