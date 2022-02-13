//
//  pokedetalhes.swift
//  trabalho_turma
//
//  Created by Ivan Nunes on 11/01/2022.
//
import Foundation
import SwiftUI

struct Detalhes: View {
    @ObservedObject var pokemon: Pokemon
    var body: some View {
        VStack{
            HStack{
                Group{
                    Image(uiImage: pokemon.img)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 125, height: 125)
                        .padding(.leading, 30)
                    VStack(alignment: .leading){
                        Group{
                        Text(pokemon.nome)
                        ForEach(pokemon.atk) { pd_ataque in
                            Text("Atk \(pd_ataque.Nome) \(String(format: "%.2f", pd_ataque.Tipo))")
                        }
                            Text("Def: \(String(format: "%.2f", pokemon.def))")
                            ProgressView(value: Float(pokemon.xp), total: 100.0)
                            {
                               Text("To Evolve:")
                                    .font(.footnote)
                           }
                                .progressViewStyle(.linear)
                                .frame(width: 100)
                        }
                        .padding(.bottom, 1)
                    }
                }
                Spacer()
            }//HStack
            .frame(height: 200)
            Spacer()
        }
        .navigationTitle(self.pokemon.nome)
    }
}

//struct Detalhes_Previews: PreviewProvider {
//    static var previews: some View {
//        Detalhes(pokemon: Pokemon(nome: "Porygon",
//                                      nickName: "Joao",
//                                      img: "porygon"))
//    }
//}
