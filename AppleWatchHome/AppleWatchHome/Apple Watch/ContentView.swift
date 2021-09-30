//
//  ContentView.swift
//  AppleWatchHome
//
//  Created by Pedro Rojas on 29/09/21.
//

import SwiftUI

let spacing: CGFloat = 30

struct ContentView: View {

    let gridItems = Array(
        repeating: GridItem(
            .fixed(100),
            spacing: spacing,
            alignment: .leading
        ),
        count: 10
    )

    var body: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea([.all])
            GeometryReader { parentProxy in
                ScrollView([.horizontal, .vertical], showsIndicators: false) {
                    LazyVGrid(
                        columns: gridItems,
                        alignment: .center,
                        spacing: 15,
                        pinnedViews: [.sectionHeaders]
                    ) {

                        ForEach(0..<100) { value in
                            GeometryReader { proxy in
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
                                    //.scaleEffect(1.5)
                                    .scaleEffect(
//                                        ratioScale(
//                                            reference: parentProxy.size.width / 2,
//                                            actual: proxy.frame(in: .global).midX
//                                        )

                                        distance(
                                            x: proxy.frame(in: .global).midX,
                                            y: proxy.frame(in: .global).midY,
                                            value: value%43
                                        )
                                        * 1.4
                                    )

                            }

                            // You need to add height
                            .frame(height: 100)
                        }
                    }
                }
            }
        }
    }

    func isEvenRow(_ value: Int) -> Bool {
        return (value / gridItems.count) % 2 == 0
    }

    func distance(x: CGFloat, y: CGFloat, value: Int) -> CGFloat {
        let frameSize: CGPoint = CGPoint(x: UIScreen.main.bounds.size.width*0.5,y: UIScreen.main.bounds.size.height*0.5)
        let xDist = abs(x - frameSize.x)
        let yDist = abs(y - frameSize.y)

        let maxDistanceToCenter = CGFloat(sqrt(frameSize.x * frameSize.x + frameSize.y * frameSize.y))

        let result = CGFloat(sqrt(xDist * xDist + yDist * yDist))

        print("distance: \(apps[value]) ", result)
        print("center: \(apps[value]) ", maxDistanceToCenter)

        return (abs(result - maxDistanceToCenter)/maxDistanceToCenter)
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
