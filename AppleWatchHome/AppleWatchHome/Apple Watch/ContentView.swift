//
//  ContentView.swift
//  AppleWatchHome
//
//  Created by Pedro Rojas on 29/09/21.
//

import SwiftUI

struct ContentView: View {
    let gridItems = Array(
        repeating: GridItem(
            .fixed(100),
            spacing: 10,
            alignment: .leading
        ),
        count: 10
    )

    var body: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea([.all])
            ScrollView([.horizontal, .vertical], showsIndicators: false) {
                LazyVGrid(
                    columns: gridItems,
                    alignment: .center,
                    spacing: 10,
                    pinnedViews: [.sectionHeaders]
                ) {
                    ForEach(0..<100) { value in

                            Image(apps[value%43])
                            .resizable()
                            .cornerRadius(50)
                            .frame(
                                width: 100,
                                height: 100
                            )
                            .offset(
                                x: isEvenRow(value) ? 50 : 0,
                                y: 0
                            )

                    }
                }
            }
        }
    }

    func isEvenRow(_ value: Int) -> Bool {
        return (value / gridItems.count) % 2 == 0
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
