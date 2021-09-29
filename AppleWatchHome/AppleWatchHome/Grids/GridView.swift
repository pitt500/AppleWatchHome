//
//  GridView.swift
//  AppleWatchHome
//
//  Created by Pedro Rojas on 29/09/21.
//

import SwiftUI

struct GridView: View {

    let gridItems = [
        GridItem(.fixed(100), spacing: 10, alignment: .leading),
        GridItem(.fixed(100), spacing: 10, alignment: .leading),
        GridItem(.fixed(100), spacing: 10, alignment: .leading),
        GridItem(.fixed(100), spacing: 10, alignment: .leading),
    ]

    let delta = 5

    var body: some View {
        ScrollView([.horizontal, .vertical]) {
            LazyVGrid(
                columns: gridItems,
                alignment: .center,
                spacing: 10,
                pinnedViews: [.sectionHeaders]
            ) {
                ForEach(0..<100) { value in
                    Rectangle().fill(needsExtraSpace(value) ? .green : .red)
                        .frame(
                            width: needsExtraSpace(value) ? 210 : 100,
                            height: 100
                        )
                        .overlay {
                            Text("\(value)")
                        }

                    // This fix overlapping
                    if needsExtraSpace(value) { Color.blue }
                }
            }
        }
    }

    func needsExtraSpace(_ value: Int) -> Bool {
        value % delta == 0
    }
}

struct GridView_Previews: PreviewProvider {
    static var previews: some View {
        GridView()
    }
}
