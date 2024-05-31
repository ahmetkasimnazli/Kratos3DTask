//
//  ContentView.swift
//  Kratos3DTask
//
//  Created by Ahmet Kasım Nazlı on 31.05.2024.
//

import SwiftUI
import SDWebImageSwiftUI

struct LaunchView: View {
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea(.all)
            AnimatedImage(name: "launch.gif")
                .resizable()
                .scaledToFit()
                .frame(width: 400, height: 400)
        }
    }
}

#Preview {
    LaunchView()
}
