//
//  HomeView.swift
//  Discord
//
//  Created by Mark Golubev on 13/12/2023.
//

import SwiftUI

struct HomeView: View {
    @State var showSideMenu = false
    
    var body: some View {

        GeometryReader { geometry in
            ZStack {
                // Menu View
                MenuView(showSideMenu: $showSideMenu)
                // Chat View
                ChatView(showSideMenu: $showSideMenu)
                    .offset(x: showSideMenu ? geometry.size.width * 0.86 : 0)
                    .onTapGesture {
                        withAnimation {
                            showSideMenu = false
                        }
                    }
            }
            .toolbar(showSideMenu ? .visible : .hidden, for: .tabBar)
        }

    }
}

#Preview {
    HomeView()
}
