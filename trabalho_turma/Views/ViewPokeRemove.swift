//
//  ViewPokeRemove.swift
//  trabalho_turma
//
//  Created by Ivan Nunes on 13/02/2022.
//

import SwiftUI

struct ViewPokeRemove: View {
    @Binding var player: Player
    @State var i: Int = 0
    
    var body: some View {
        Menu {
            ForEach(player.Pokevar) { pd in
                ForEach(0..<pd.pokemons.count) { p in // TENTAR PERCEBER O PQ DO NÃO FUNCIONAR NO BUTTON!!!!
                    Button {
                        i = pd.pokemons.count + 1
                        
                        if(pd.pokemons[p].nome == "Mineiron") {
                            i -= i
                            player.Pokevar.remove(at: i)
                        } else if(pd.pokemons[p].nome == "Barramon") {
                            i = i - 1
                            let isIndexValid = player.Pokevar.indices.contains(i)
                            if(isIndexValid) {
                                player.Pokevar.remove(at: i)
                            } else {
                                i = i - 1
                                player.Pokevar.remove(at: i)
                            }
                        } else if(pd.pokemons[p].nome == "Bravamon") {
                            i = i
                            player.Pokevar.remove(at: i)
                        } else {
                            i = i + 1
                            let isIndexValid = player.Pokevar.indices.contains(i)
                            if(isIndexValid) {
                                i = i + 1
                                let isIndexValid = player.Pokevar.indices.contains(i)
                                if(isIndexValid) {
                                    player.Pokevar.remove(at: i)
                                } else {
                                    i = i - 1
                                    player.Pokevar.remove(at: i)
                                }
                            }
                        }
                        
                    } label: {
                        Text(pd.pokemons[p].nome)
                        Image(systemName: "arrow.up.and.down.circle")
                    }
                }
            }
            
        } label: {
             Text("Selecione o Pokemon a Remover")
             Image(systemName: "tag.circle")
        }
    }
}

//struct ViewPokeRemove_Previews: PreviewProvider {
//    static var previews: some View {
//        ViewPokeRemove()
//    }
//}
