//
//  PokeLogin.swift
//  trabalho_turma
//
//  Created by Ivan Nunes on 17/01/2022.
//

import SwiftUI
import UIKit
import AVKit
import AVFoundation

struct PokeLogin: View {
    @Binding var player:Player
    @State var show_tutorial: Bool = false
    
    var body: some View {
        Text("Bem Vindo: \(player.Nome)")
            .font(.system(size: 26, weight: .bold, design: .serif))
            
        Text("Nº de Batalhas Vencidas: \(Int(player.BatalhasVencidas))")
            .font(.system(size: 24, weight: .bold, design: .serif))
        
        GeometryReader { geo in
            ZStack {
                //PlayerView()
                //.aspectRatio(contentMode: .fill)
                //.frame(width: geo.size.width, height: geo.size.height+200)
                //.overlay(Color.black.opacity(0.2))
                //.blur(radius: 1)
                //.edgesIgnoringSafeArea(.all)
                                 
                VStack {
                    HStack {
                        Spacer()
                        Spacer()
                        NavigationLink {
                            ViewPokedex(player: $player)
                        } label: {
                            Text("Pokedex")
                            .frame(width: 90, height: 50)
                        }.padding()
                            .background(Color(red: 0.1, green: 0.1, blue: 0.5))
                            .clipShape(Rectangle())
                            .foregroundColor(.white)
                            .frame(width: 90, height: 50, alignment: .leading)
                        
                        Spacer()
                        Spacer()
                        
                        NavigationLink {
                            ViewBattle(player: $player)
                        } label: {
                            Text("Battle")
                            .frame(width: 90, height: 50)
                        }.padding()
                            .background(Color(red: 0.1, green: 0.1, blue: 0.5))
                            .clipShape(Rectangle())
                            .foregroundColor(.white)
                            .frame(width: 90, height: 50, alignment: .leading)
                        
                    } .padding()
                    .frame(width: 300, height: 100, alignment: .center)
                    
                    Button("Tutorial") {
                        if(show_tutorial) {
                            show_tutorial = false
                        } else {
                            show_tutorial = true
                        }
                    }.padding(.trailing)
                        .background(Color(red: 0.1, green: 0.1, blue: 0.5))
                        .clipShape(Rectangle())
                        .foregroundColor(.white)
                        .frame(width: 110, height: 50, alignment: .center)
                    
                    if(show_tutorial) {
                        Image("tutorial")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 150, height: 150)
                        Group {
                            Text("Objectivo: Ganhar o maior número de batalhas. Se perder uma batalha, o jogo irá chegar ao fim. Por cada batalha ganha, o Pokeman ganha XP. Quanto mais XP o Pokeman tiver, mais forte ele fica. Cada Pokeman tem três tipos de ataque (Light,Medium,High). Sendo que o Light mais fraco, e o High o mais forte. Se o pokeman selecionar High e o adversário selecionar light, só o ataque Light irá ser jogado. Cada Pokeman tem um tipo cujo é mais forte e é mais fraco.")
                        }.padding()
                            .background(Color(red: 0.1, green: 0.1, blue: 0.5))
                            .foregroundColor(.white)
                    }
                }
            }
        }
    }
}

//struct PokeLogin_Previews: PreviewProvider {
//    static var previews: some View {
//        PokeLogin()
//    }
//}
