//
//  MenuView.swift
//  Discord
//
//  Created by Mark Golubev on 14/12/2023.
//

import SwiftUI

struct Server: Identifiable {
    var id: Int?
    let createdAt: Date
    let name: String
}

struct MenuView: View {
    var mockServers: [Server] = [
        Server(id: 1, createdAt: .now, name: "Swift"),
        Server(id: 2, createdAt: .now, name: "Python"),
        Server(id: 3, createdAt: .now, name: "Kotlin"),
        Server(id: 4, createdAt: .now, name: "C++"),
        Server(id: 5, createdAt: .now, name: "Go")
    ]
    
    var body: some View {
        HStack {
            // Servers
            ScrollView {
                VStack(spacing: 12) {
                    ForEach(mockServers) { server in
                        Text(server.name.prefix(1))
                            .font(.title)
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 8)
                            .background {
                                Circle()
                                    .fill(Color.background)
                            }
                    }
                }
                .frame(width: 60)
                .frame(maxHeight: .infinity, alignment: .topLeading)
                .padding(8)
                
                Button {
                    //
                } label: {
                    Image(systemName: "plus")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 20)
                        .foregroundStyle(.green)
                        .background {
                            Circle()
                                .fill(Color.background)
                                .padding(-14)
                        }
                    
                }
                .padding(.vertical, 12)
                

            }
            
            GeometryReader { geometry in
                VStack {
                    HStack {
                        Text("Swift")
                        Spacer()
                        Image(systemName: "ellipsis")
                        
                    }
                    .padding()
                    
                    ScrollView {
                        
                    }
                }
                .frame(width: geometry.size.width - 60)
                .frame(maxHeight: .infinity, alignment: .topLeading)
                .background {
                    UnevenRoundedRectangle(cornerRadii: .init(topLeading: 25, topTrailing: 10))
                        .fill(Color.background)
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
//        .background {
//            Color(uiColor: .black)
//        }
        .preferredColorScheme(.dark)
    }
}

#Preview {
    MenuView()
}
