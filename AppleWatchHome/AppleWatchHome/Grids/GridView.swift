//
//  GridView.swift
//  AppleWatchHome
//
//  Created by Pedro Rojas on 29/09/21.
//

import SwiftUI

struct GridView: View {

    let gridItems = [
        GridItem(.fixed(100), spacing: 10, alignment: .center),
        GridItem(.fixed(100), spacing: 10, alignment: .center),
        GridItem(.fixed(100), spacing: 10, alignment: .center),
        GridItem(.fixed(100), spacing: 10, alignment: .center),
    ]

    var body: some View {
        ScrollView([.horizontal, .vertical]) {
            LazyVGrid(
                columns: gridItems,
                alignment: .center,
                spacing: 10,
                pinnedViews: [.sectionHeaders]
            ) {
                ForEach(0..<100) { value in
                    Rectangle().fill(.red)
                        .frame(width: 100, height: 100)
                        .overlay {
                            Text("\(value)")
                        }
                }
            }
        }
    }
}

struct GridView_Previews: PreviewProvider {
    static var previews: some View {
        GridView()
    }
}
