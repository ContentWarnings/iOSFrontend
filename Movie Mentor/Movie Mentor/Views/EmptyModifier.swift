// https://medium.com/macoclock/conditional-views-in-swiftui-dc09c808bc30
// TODO: Properly cite source

import SwiftUI

struct EmptyModifier: ViewModifier {
    let isEmpty: Bool

    func body(content: Content) -> some View {
        Group {
            if isEmpty {
                EmptyView()
            } else {
                content
            }
        }
    }
}

extension View {
    func isEmpty(_ bool: Bool) -> some View {
        modifier(EmptyModifier(isEmpty: bool))
    }
}
