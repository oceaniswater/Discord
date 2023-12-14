//
//  ChatRoomView.swift
//  Discord
//
//  Created by Mark Golubev on 14/12/2023.
//

import SwiftUI

struct ChatRoomView: View {
    @Binding var showSideMenu: Bool
    @State var message: String = ""
    var mockMessages: [Message] = [
        Message(id: 1, createdAt:  .distantPast,userName: "Mark Golubev", imageURL: "mark", text: "Hi everyone!"),
        Message(id: 2, createdAt:  .now, userName: "Mark Golubev", imageURL: "mark", text: "How is it going?")
    ]
    var body: some View {
        VStack {
            ScrollView {
                VStack {
                    VStack(alignment: .leading) {
                        Image(systemName: "number")
                            .imageScale(.large)
                            .foregroundStyle(!showSideMenu ? .white : .gray)
                            .padding()
                            .background {
                                Circle()
                                    .fill(Color(uiColor: .systemGray3))
                            }
                        
                            .padding(.bottom, 24)
                        
                        Text("Welcome to general")
                            .font(.title2)
                            .foregroundStyle(!showSideMenu ? .white : .gray)
                            .bold()
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                }
                
                LazyVStack(content: {
                    ForEach(mockMessages) { message in
                        HStack(alignment: .top) {
                            ZStack {
                                Image(message.imageURL)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 48, height: 48)
                                    .clipShape(Circle())
                                Circle()
                                    .fill(Color.gray
                                        .opacity(showSideMenu ? 0.7 : 0))
                                    .frame(width: 48, height: 48)
                            }
                            
                            VStack(alignment: .leading) {
                                HStack {
                                    Text(message.userName)
                                        .bold()
                                        .foregroundStyle(!showSideMenu ? .white : .gray)
                                    Text(message.createdAt.formatted())
                                        .font(.caption)
                                        .foregroundStyle(!showSideMenu ? .white : .gray)
                                    
                                }
                                Text(message.text)
                                    .foregroundStyle(!showSideMenu ? .white : .gray)
                            }
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding()
                    }
                })
            }
            
            Divider()
            
            HStack {
                TextField("Message #general", text: $message)
                    .padding()
                    .background {
                        Capsule()
                            .fill(Color(uiColor: .systemGray6))
                    }
                
                Button(action: {
                    
                }, label: {
                    Image(systemName: "arrow.up.circle.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 32, height: 32)
                        .foregroundStyle(Color(uiColor: .systemGray6))
                        .background {
                            Circle()
                                .fill(.gray)
                        }
                })
                .frame(height: 70)
            }
            .padding(.horizontal, 8)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .preferredColorScheme(.dark)
    }
}

#Preview {
    ChatRoomView(showSideMenu: .constant(true))
}
