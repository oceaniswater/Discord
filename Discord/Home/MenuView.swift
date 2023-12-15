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
    var channels: [Channel]
}

struct Channel: Identifiable, Equatable {
    var id: Int?
    let createdAt: Date
    let name: String
    let type: ChanelType
}

enum ChanelType {
    case text
    case voice
}

struct MenuView: View {
    @Binding var selectedChanel: Channel?
    @State var selectedServer: Server?
    @State var showTextChanels = true
    @State var showVoiceChanels = true
    @Binding var showSideMenu: Bool
    
    var mockServers: [Server] = [
        Server(id: 1, createdAt: .now, name: "Swift", channels: [
            Channel(id: 1, createdAt: .now, name: "general", type: .text),
            Channel(id: 2, createdAt: .now, name: "ux/ui", type: .text),
            Channel(id: 3, createdAt: .now, name: "vision pro", type: .text),
            Channel(id: 4, createdAt: .now, name: "wwdc talks", type: .voice)
        ]),
        Server(id: 2, createdAt: .now, name: "Python", channels: [
            Channel(id: 1, createdAt: .now, name: "general", type: .text),
            Channel(id: 4, createdAt: .now, name: "general", type: .voice)
        ]),
        Server(id: 3, createdAt: .now, name: "Kotlin", channels: [
            Channel(id: 1, createdAt: .now, name: "general", type: .text),
            Channel(id: 4, createdAt: .now, name: "general", type: .voice)
        ]),
        Server(id: 4, createdAt: .now, name: "C++", channels: [
            Channel(id: 1, createdAt: .now, name: "general", type: .text),
            Channel(id: 4, createdAt: .now, name: "general", type: .voice)
        ]),
        Server(id: 5, createdAt: .now, name: "Go", channels: [
            Channel(id: 1, createdAt: .now, name: "general", type: .text),
            Channel(id: 4, createdAt: .now, name: "general", type: .voice)
        ])
    ]
    
    var body: some View {
        HStack {
            // Servers
            ScrollView {
                VStack(spacing: 12) {
                    ForEach(mockServers) { server in
                        Button(action: {
                            withAnimation {
                                selectedServer = server
                            }
                        }, label: {
                            HStack {
                                UnevenRoundedRectangle(cornerRadii: .init(bottomTrailing: 20, topTrailing: 20))
                                    .fill(Color.white)
                                    .frame(width: 4)
                                    .opacity(selectedServer?.id == server.id ? 1 : 0)
                                Text(server.name.prefix(1))
                                    .foregroundStyle(Color.white)
                                    .font(.title)
                                    .frame(maxWidth: .infinity)
                                    .padding(.vertical, 8)
                                    .background {
                                        Circle()
                                            .fill(Color.background)
                                    }
                            }
                        })
                    }
                }
                .frame(width: 60)
                .frame(maxHeight: .infinity, alignment: .topLeading)
                .padding(8)
                
                Button {
                    //
                } label: {
                    HStack {
                        UnevenRoundedRectangle(cornerRadii: .init(bottomTrailing: 20, topTrailing: 20))
                            .fill(Color.white)
                            .frame(width: 4)
                            .opacity(0)
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
                    
                }
                .padding(.vertical, 12)
                

            }
            
            GeometryReader { geometry in
                VStack {
                    HStack {
                        Text(selectedServer?.name ?? "default")
                            .bold()
                        Spacer()
                        Button {
                            dump(selectedChanel)
                        } label: {
                            Image(systemName: "ellipsis")
                                .fontWeight(.heavy)
                                .foregroundStyle(Color.white)
                        }

                        
                    }
                    .padding()
                    
                    ScrollView {
                        HStack(alignment: .center, spacing: 5) {
                            Button(action: {
                                
                            }, label: {
                                ZStack {
                                    RoundedRectangle(cornerSize: CGSize(width: 100, height: 20))
                                        .fill(Color.black)
                                        .frame(height: 40)
                                    
                                    HStack {
                                        Image(systemName: "magnifyingglass")
                                            .font(.callout)
                                            .foregroundStyle(Color.white)
                                        Text("Search")
                                            .font(.callout)
                                            .foregroundStyle(Color.white)
                                        Spacer()
                                    }
                                    .padding(.horizontal, 10)
                                }
                            })
                            
                            Button(action: {
                                
                            }, label: {
                                Image(systemName: "person.fill.badge.plus")
                                    .imageScale(.large)
                                    .foregroundStyle(.white)
                                    .padding(8)
                                    .background {
                                        Circle()
                                            .fill(Color.black)
                                    }
                            })
                        }
                        .padding(.horizontal)
                        
                        Button {
                            withAnimation {
                                showTextChanels.toggle()
                            }
                        } label: {
                            HStack(spacing: 0) {
                                Image(systemName: showTextChanels ? "chevron.down" : "chevron.right")
                                    .font(.footnote)
                                    .frame(width: 24)
                                Text("Text Chanels")
                                    .font(.callout)
                                Spacer()
                            }
                            .foregroundStyle(Color.gray)
                            .padding(.horizontal, 3)
                            .padding(.vertical, 5)
                        }

                        
                        if showTextChanels {
                            ForEach(selectedServer?.channels ?? []) { chanel in
                                if chanel.type == .text {
                                    Button {
                                        withAnimation {
                                            selectedChanel = chanel
                                            showSideMenu = false
                                        }
                                    } label: {
                                        HStack {
                                            Image(systemName: "number")
                                                .foregroundStyle(Color.gray)
                                            Text(chanel.name)
                                                .foregroundStyle(selectedChanel?.id == chanel.id ? Color.white : Color.gray)
                                                .font(.title3)
                                        }
                                    }
                                    .padding(.vertical, 5)
                                    .padding(.horizontal)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .background {
                                        RoundedRectangle(cornerRadius: 10)
                                            .fill(selectedChanel?.id == chanel.id ? Color(uiColor: .systemGray3) : .clear)
                                            .padding(.horizontal, 7)
                                    }

                                }
                            }
                        } 
                        else if let selectedChanel, !showTextChanels, selectedChanel.type == .text {
                            HStack {
                                Image(systemName: "number")
                                    .foregroundStyle(Color.gray)
                                Text(selectedChanel.name)
                                    .foregroundStyle(Color.white)
                                    .font(.title3)
                            }
                            .padding(.vertical, 5)
                            .padding(.horizontal)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background {
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(Color(uiColor: .systemGray3))
                                    .padding(.horizontal, 7)
                            }
                        }
                        
                        Button {
                            withAnimation {
                                showVoiceChanels.toggle()
                            }
                        } label: {
                            HStack(spacing: 0) {
                                Image(systemName: showVoiceChanels ? "chevron.down" : "chevron.right")
                                    .font(.footnote)
                                    .frame(width: 24)
                                Text("Voice Chanels")
                                    .font(.callout)
                                Spacer()
                            }
                            .foregroundStyle(Color.gray)
                            .padding(.horizontal, 3)
                            .padding(.vertical, 5)
                        }

                        
                        if showVoiceChanels {
                            ForEach(selectedServer?.channels ?? []) { chanel in
                                if chanel.type == .voice {
                                    Button {
                                        withAnimation {
                                            selectedChanel = chanel
                                        }
                                    } label: {
                                        HStack {
                                            Image(systemName: "number")
                                                .foregroundStyle(Color.gray)
                                            Text(chanel.name)
                                                .foregroundStyle(selectedChanel?.id == chanel.id ? Color.white : Color.gray)
                                                .font(.title3)
                                        }
                                    }
                                    .padding(.vertical, 5)
                                    .padding(.horizontal)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .background {
                                        RoundedRectangle(cornerRadius: 10)
                                            .fill(selectedChanel?.id == chanel.id ? Color(uiColor: .systemGray3) : .clear)
                                            .padding(.horizontal, 7)
                                    }

                                }
                            }
                        }
                        else if let selectedChanel, !showVoiceChanels, selectedChanel.type == .voice {
                            HStack {
                                Image(systemName: "number")
                                    .foregroundStyle(Color.gray)
                                Text(selectedChanel.name)
                                    .foregroundStyle(Color.white)
                                    .font(.title3)
                            }
                            .padding(.vertical, 5)
                            .padding(.horizontal)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background {
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(Color(uiColor: .systemGray3))
                                    .padding(.horizontal, 7)
                            }
                        }
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
        .preferredColorScheme(.dark)
        .onAppear {
            withAnimation {
                selectedServer = mockServers.first
                selectedChanel = selectedServer?.channels.first
            }
        }
    }
}

#Preview {
    MenuView(selectedChanel: .constant(nil), showSideMenu: .constant(false))
}
