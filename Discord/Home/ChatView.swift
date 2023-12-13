//
//  ChatView.swift
//  Discord
//
//  Created by Mark Golubev on 13/12/2023.
//

import SwiftUI

struct Message: Identifiable {
    var id: Int?
    let createdAt: Date
    let userName: String
    let imageURL: String
    let text: String
}

struct ChatView: View {
    @State var message: String = ""
    
    var mockMessages: [Message] = [
        Message(id: 1, createdAt:  .distantPast,userName: "Mark Golubev", imageURL: "mark", text: "Hi everyone!"),
        Message(id: 2, createdAt:  .now, userName: "Mark Golubev", imageURL: "mark", text: "How is it going?")
    ]
    
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                Button(action: {}, label: {
                    Image(systemName: "line.3.horizontal")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 24)
                        .foregroundStyle(.white)
                })
                
                Image(systemName: "number")
                
                Text("general")
                    .bold()
                    .font(.callout)
                
                Spacer()
                
                Image(systemName: "person.2.fill")
            }
            .padding()
            .background {
                Color(uiColor: .systemGray6)
            }
            
            VStack {
                ScrollView {
                    VStack {
                        VStack(alignment: .leading) {
                            Image(systemName: "number")
                                .imageScale(.large)
                                .padding()
                                .background {
                                    Circle()
                                        .fill(Color(uiColor: .systemGray3))
                                }
                            
                                .padding(.bottom, 24)
                            
                            Text("Welcome to general")
                                .font(.title2)
                                .bold()
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding()
                    }
                    
                    LazyVStack(content: {
                        ForEach(mockMessages) { message in
                            HStack(alignment: .top) {
                                Image(message.imageURL)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 48, height: 48)
                                    .clipShape(Circle())
                                
                                VStack(alignment: .leading) {
                                    HStack {
                                        Text(message.userName)
                                            .bold()
                                        Text(message.createdAt.formatted())
                                            .font(.caption)
                                        
                                    }
                                    Text(message.text)
                                }
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding()
                        }
                    })
                }
                
                Divider()
                    .overlay {
                        Color.black
                    }
                
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
                }
                .padding(.horizontal, 8)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .preferredColorScheme(.dark)
        .background {
            Color(.background)
        }
        
    }
}

#Preview {
    ChatView()
}
