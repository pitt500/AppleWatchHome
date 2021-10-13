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
            Color.blue
                .padding(80)
        }
    }
}

struct GeometryDemoView_Previews: PreviewProvider {
    static var previews: some View {
        GeometryDemoView()
    }
}
