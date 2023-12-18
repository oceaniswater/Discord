//
//  ChatView.swift
//  Discord
//
//  Created by Mark Golubev on 13/12/2023.
//

import SwiftUI

struct Message: Identifiable, Equatable {
    var id: Int?
    let createdAt: Date
    let userName: String
    let imageURL: String
    let text: String
}

struct ChatView: View {
    @Binding var selectedChannel: Channel?
    @Binding var showSideMenu: Bool
    
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                Button(action: {
                    withAnimation {
                        showSideMenu = !showSideMenu
                    }
                }, label: {
                    Image(systemName: "arrow.left")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 24)
                        .foregroundStyle(!showSideMenu ? .white : .gray)

                })
                
                Image(systemName: "number")
                    .foregroundStyle(!showSideMenu ? .white : .gray)
                
                Text(selectedChannel?.name ?? "default")
                    .bold()
                    .font(.callout)
                    .foregroundStyle(!showSideMenu ? .white : .gray)
                
                Spacer()
                
                Image(systemName: "person.2.fill")
                    .foregroundStyle(!showSideMenu ? .white : .gray)
            }
            .padding()
            .padding(.top, !showSideMenu ? 42 : 0)

            Divider()
            
            ChatRoomView(selectedChannel: $selectedChannel, showSideMenu: $showSideMenu)
                .padding(.bottom)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .preferredColorScheme(.dark)
        .background {
            UnevenRoundedRectangle(cornerRadii: .init(topLeading: showSideMenu ? 10 : 0, topTrailing: 0))
                    .fill(Color.background)
        }
        .edgesIgnoringSafeArea(!showSideMenu ? .all : [])
        
    }
}

#Preview {
    ChatView(selectedChannel: .constant(Channel(id: 99, createdAt: .now, name: "general", type: .text)), showSideMenu: .constant(false))
}
