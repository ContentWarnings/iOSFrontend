//
//  SearchView.swift
//  Movie Mentor
//
//  Created by Jacob Franz on 2/5/23.
//

import SwiftUI

struct SearchView: View {
    var body: some View {
        VStack {
            Image(systemName: "magnifyingglass")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("This tab will allow for movie searching!")
        }
        .padding()
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}