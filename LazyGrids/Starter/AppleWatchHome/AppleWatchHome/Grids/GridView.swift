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


    var body: some View {
        ScrollView([.horizontal, .vertical]) {
            LazyVGrid(
                columns: gridItems,
                alignment: .center,
                spacing: 100,
                pinnedViews: [.sectionHeaders]
            ) {
                Section(header: Text("Section 1").font(.largeTitle)) {
                    ForEach(0..<100) { value in
                        Rectangle().fill(needsExtraSpace(value) ? .green : .red)
                            .frame(
                                width: needsExtraSpace(value) ? 210 : 100,
                                height: 100
                            )
                            .border(.blue, width: 2)
                            .overlay {
                                Text("\(value)")
                            }

                        // This fix overlapping
                        if needsExtraSpace(value) { Color.blue }
                    }
                }
            }
        }
    }

    func needsExtraSpace(_ value: Int) -> Bool {
        value % (gridItems.count + 1) == 0
    }
}

struct GridView_Previews: PreviewProvider {
    static var previews: some View {
        GridView()
    }
}
