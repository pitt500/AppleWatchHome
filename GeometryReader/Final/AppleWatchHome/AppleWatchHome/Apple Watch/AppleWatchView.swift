//
//  ContentView.swift
//  AppleWatchHome
//
//  Created by Pedro Rojas on 29/09/21.
//

import SwiftUI

struct AppleWatchView: View {
    private static let size: CGFloat = 100
    private static let spacingBetweenColumns: CGFloat = 16
    private static let spacingBetweenRows: CGFloat = 16
    private static let totalColumns: Int = 30

    let gridItems = Array(
        repeating: GridItem(
            .fixed(size),
            spacing: spacingBetweenColumns,
            alignment: .center
        ),
        count: totalColumns
    )

    var body: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea([.all])

            ScrollView([.horizontal, .vertical], showsIndicators: false) {
                LazyVGrid(
                    columns: gridItems,
                    alignment: .center,
                    spacing: Self.spacingBetweenRows
                ) {

                    ForEach(0..<1000) { value in

                        Image(appName(value))
                            .resizable()
                            .cornerRadius(Self.size/2)
                            .frame(height: Self.size)
                            .offset(
                                x: offsetX(value),
                                y: 0
                            )
                    }
                }
            }

        }
    }

    func offsetX(_ value: Int) -> CGFloat {
        let rowNumber = value / gridItems.count

        if rowNumber % 2 == 0 {
            return Self.size/2 + Self.spacingBetweenColumns/2
        }

        return 0
    }

    func appName(_ value: Int) -> String {
        apps[value%apps.count]
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        AppleWatchView()
    }
}
