//
//  GeometryDemoView.swift
//  AppleWatchHome
//
//  Created by Pedro Rojas on 11/10/21.
//

import SwiftUI

struct GeometryDemoView: View {
    var body: some View {
        ZStack {
            Color.red
            Color.green
                .padding(40)
            GeometryReader { proxy in
                VStack(alignment: .leading) {
                    Color.blue
                        .padding(proxy.size.width*0.1)
                        .frame(
                            width: proxy.size.width/2,
                            height: proxy.size.height/2
                        )
                    Text("Local min x: \(proxy.frame(in: .local).minX)")
                    Text("Local min y: \(proxy.frame(in: .local).minY)")
                    Text("Local max x: \(proxy.frame(in: .local).maxX)")
                    Text("Local max y: \(proxy.frame(in: .local).maxY)")
                    Text("size: \(proxy.size.width)")

                    Text("Global min x: \(proxy.frame(in: .global).minX)")
                    Text("Global min y: \(proxy.frame(in: .global).minY)")
                    Text("Global max x: \(proxy.frame(in: .global).maxX)")
                    Text("Global max y: \(proxy.frame(in: .global).maxY)")

                }
                .font(.system(size: 24))

            }
            .background(.gray)
            .offset(x: 50, y: 50)
            .frame(width: 300, height: 300)
        }
    }
}

struct GeometryDemoView_Previews: PreviewProvider {
    static var previews: some View {
        GeometryDemoView()
    }
}
