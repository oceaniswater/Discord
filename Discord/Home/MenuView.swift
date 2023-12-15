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

struct Chanel: Identifiable, Equatable {
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
    @State var selectedChanel: Chanel?
    @State var showTextChanels = true
    @State var showVoiceChanels = true

    
    var mockServers: [Server] = [
        Server(id: 1, createdAt: .now, name: "Swift"),
        Server(id: 2, createdAt: .now, name: "Python"),
        Server(id: 3, createdAt: .now, name: "Kotlin"),
        Server(id: 4, createdAt: .now, name: "C++"),
        Server(id: 5, createdAt: .now, name: "Go")
    ]
    
    var mockChanel: [Chanel] = [
        Chanel(id: 1, createdAt: .now, name: "general", type: .text),
        Chanel(id: 2, createdAt: .now, name: "ux/ui", type: .text),
        Chanel(id: 3, createdAt: .now, name: "vision pro", type: .text),
        Chanel(id: 4, createdAt: .now, name: "wwdc talks", type: .voice)
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
                            .bold()
                        Spacer()
                        Image(systemName: "ellipsis")
                            .fontWeight(.heavy)
                        
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
                            ForEach(mockChanel) { chanel in
                                if chanel.type == .text {
                                    Button {
                                        withAnimation {
                                            selectedChanel = chanel
                                        }
                                    } label: {
                                        HStack {
                                            Image(systemName: "number")
                                                .foregroundStyle(Color.gray)
                                            Text(chanel.name)
                                                .foregroundStyle(selectedChanel == chanel ? Color.white : Color.gray)
                                                .font(.title3)
                                        }
                                    }
                                    .padding(.vertical, 5)
                                    .padding(.horizontal)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .background {
                                        RoundedRectangle(cornerRadius: 10)
                                            .fill(selectedChanel == chanel ? Color(uiColor: .systemGray3) : .clear)
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
                            ForEach(mockChanel) { chanel in
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
                                                .foregroundStyle(selectedChanel == chanel ? Color.white : Color.gray)
                                                .font(.title3)
                                        }
                                    }
                                    .padding(.vertical, 5)
                                    .padding(.horizontal)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .background {
                                        RoundedRectangle(cornerRadius: 10)
                                            .fill(selectedChanel == chanel ? Color(uiColor: .systemGray3) : .clear)
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
    }
}

#Preview {
    MenuView()
}
