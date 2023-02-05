//
//  FeaturedView.swift
//  Movie Mentor
//
//  Created by Jacob Franz on 1/22/23.
//

import SwiftUI

struct FeaturedView: View {
    var body: some View {
        VStack {
            Image(systemName: "star.fill")
                .imageScale(.large)
                .foregroundColor(Color("Secondary"))
            Text("This tab will show the featured movies!")
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        FeaturedView()
    }
}
