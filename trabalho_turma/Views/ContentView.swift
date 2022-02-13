//
//  ContentView.swift
//  trabalho_turma
//
//  Created by Ivan Nunes on 08/01/2022.
//

import SwiftUI

// instanciar a struct com os valores pré defenidos, depois enviar essa struct pela navegationview, neste caso por no pokelogin e seguir ai em diante ao enviar a struct pela view ate chegar as batalhas -> quando chegar as batalhas e ganhar manda para a view Login com os dados atualizados
struct ContentView: View {
    @State var player = Player(Nome: "", BatalhasVencidas: 0)
    
    
    var body: some View {
        NavigationView {
            VStack {
                Image("logo")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 250, height: 250)
                
                Text("Introduza um username:")
                        .font(.callout)
                        .bold()
                
                TextField("", text: $player.Nome)
                    .onChange(of: self.player.Nome) { newValue in      // removed 
                    }
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .font(Font.system(size: 13))
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 5).fill(.blue))
                        .foregroundColor(.black)
                        
                
                NavigationLink {
                    PokeLogin(player: $player)
                } label: {
                    Text("Start!")
                    .frame(width: 130, height: 50)
                }.padding()
                    .background(Color(red: 0.1, green: 0.1, blue: 0.5))
                    .clipShape(Rectangle())
                    .foregroundColor(.white)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
