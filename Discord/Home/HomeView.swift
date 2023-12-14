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

        ZStack {
            // Menu View
            MenuView()
            // Chat View
            ChatView(showSideMenu: $showSideMenu)
                .offset(x: showSideMenu ? 340 : 0)
                
            Color.black
                .opacity(showSideMenu ? 0.6 : 0)
                .offset(x: showSideMenu ? 340 : 0)
                .ignoresSafeArea()
                .onTapGesture {
                    withAnimation {
                        showSideMenu = !showSideMenu
                    }
                }
                
        }
        .toolbar(showSideMenu ? .visible : .hidden, for: .tabBar)

    }
}

#Preview {
    HomeView()
}
