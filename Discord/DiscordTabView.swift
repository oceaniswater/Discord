//
//  DiscordTabView.swift
//  Discord
//
//  Created by Mark Golubev on 13/12/2023.
//

import SwiftUI

struct DiscordTabView: View {
    @State var selectedTab = 0
    
    var body: some View {
        TabView(selection: $selectedTab) {
            HomeView()
                .tag(0)
                .tabItem {
                    Image(systemName: "house")
                }
            
            UserSearchView()
                .tag(1)
                .tabItem {
                    Image(systemName: "magnifyingglass")
                }
            
            ProfileView()
                .tag(2)
                .tabItem {
                    Image(systemName: "person")
                }
        }
    }
}

#Preview {
    DiscordTabView()
}
