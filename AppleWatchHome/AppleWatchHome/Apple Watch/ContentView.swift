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
        count: 20
    )

    let frameSize: CGPoint = CGPoint(x: UIScreen.main.bounds.size.width*0.5,y: UIScreen.main.bounds.size.height*0.5)

    var body: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea([.all])
            Line()
                .edgesIgnoringSafeArea([.all])
                .foregroundColor(.red)
            GeometryReader { parentProxy in
                ScrollView([.horizontal, .vertical], showsIndicators: false) {
                    LazyVGrid(
                        columns: gridItems,
                        alignment: .center,
                        spacing: 15,
                        pinnedViews: [.sectionHeaders]
                    ) {

                        ForEach(0..<1000) { value in
                            GeometryReader { proxy in
                                Image(apps[value%43])
                                    .resizable()
                                    .cornerRadius(50)
                                    .frame(
                                        width: 100,
                                        height: 100
                                    )
                                    .scaleEffect(
                                        distance(
                                            x: isEvenRow(value) ? proxy.frame(in: .global).midX + proxy.size.width/2 :
                                                proxy.frame(in: .global).midX,
                                            y: proxy.frame(in: .global).midY,
                                            value: value%43
                                        )

                                    )
                                    .offset(
                                        x: isEvenRow(value) ? proxy.size.width/2 : 0,
                                        y: 0
                                    )

                                

                            }

                            // You need to add height
                            .frame(width: 100, height: 100)
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
        let xDist = abs(x - frameSize.x)
        let yDist = abs(y - frameSize.y)

        let maxDistanceToCenter = distance2(x: x, y: y, value: value)//CGFloat(sqrt(frameSize.x * frameSize.x + frameSize.y * frameSize.y))

        let result = CGFloat(sqrt(xDist * xDist + yDist * yDist))

        //print("distance: \(apps[value]) ", result)
        //print("center: \(apps[value]) ", maxDistanceToCenter)

        let total = min(abs(result - maxDistanceToCenter), maxDistanceToCenter*0.8)

        let finalResult = total/(maxDistanceToCenter) * 1.2

        return finalResult
    }

    func offsetY(proxy: GeometryProxy, factor: CGFloat) -> CGFloat {
        let y = proxy.frame(in: .global).midY

        if y < frameSize.y {
            return abs(y - frameSize.y) * factor
        }

        return -abs(y - frameSize.y) * factor

    }

    func offset(a: CGFloat, b: CGFloat, factor: CGFloat) -> CGFloat {
        return abs(a - b) * factor
    }

    func distance2(x: CGFloat, y: CGFloat, value: Int) -> CGFloat {
        let m = (frameSize.y - y)/(frameSize.x - x)


        let angle = abs(atan(m) * 180 / .pi)


        print(apps[value], angle)

//        let y2 = (y > frameSize.y) ? frameSize.y*2 : 0
//        let x2 = (y2 - y)/m + x
//        print(apps[value], m)
//        return distance3(x: x2, y: y2, value: value)

        let ipadAngle: CGFloat = 35

        if angle > ipadAngle {
            let y2 = (y > frameSize.y) ? frameSize.y*2 : 0
            let x2 = (y2 - y)/m + x
            //print(apps[value], x2, y2)
            return distance3(x: x2, y: y2, value: value)
        } else {
            let x2 = (x > frameSize.x) ? frameSize.x*2 : 0
            let y2 = m * (x2 - x) + y
            //print(apps[value], x2, y2)
            return distance3(x: x2, y: y2, value: value)
        }
    }

    func distance3(x: CGFloat, y: CGFloat, value: Int) -> CGFloat {
        let xDist = abs(x - frameSize.x)
        let yDist = abs(y - frameSize.y)

        return CGFloat(sqrt(xDist * xDist + yDist * yDist))
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


struct Line: View {
    var body: some View {

        GeometryReader { geometry in
            Path { path in
                path.move(to: CGPoint(x: geometry.frame(in: .global).maxX, y: geometry.frame(in: .global).midY))
                path.addLine(to: CGPoint(x: 0, y: geometry.frame(in: .global).midY))
                path.move(to: CGPoint(x: geometry.frame(in: .global).midX, y: geometry.frame(in: .global).midY))
                path.addLine(to: CGPoint(x: geometry.frame(in: .global).midX, y: geometry.frame(in: .global).maxY))

                path.addLine(to: CGPoint(x: geometry.frame(in: .global).midX, y: geometry.frame(in: .global).minY - 60))

            }
            .stroke(Color.blue, lineWidth: 3)

        }
    }
}
