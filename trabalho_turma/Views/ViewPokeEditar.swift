//
//  ViewPokeEditar.swift
//  trabalho_turma
//
//  Created by Ivan Nunes on 13/02/2022.
//

import SwiftUI

struct ViewPokeEditar: View {
    @Binding var player: Player
    
    var body: some View {
        ScrollView(.vertical) {
            VStack {
                ForEach(player.Pokevar) { pd in
                    ForEach(pd.pokemons) {p in
                        Group {
//                            TextField("Nome do Pokemon...", text: p.$nome)
//                                .textFieldStyle(RoundedBorderTextFieldStyle())
//
//                            TextField("Nick do Pokemon...", text: p.$nickName)
//                                .textFieldStyle(RoundedBorderTextFieldStyle())
//
//                            TextField("Tipo de Pokemon...", text: p.$PokeTipo)
//                                .textFieldStyle(RoundedBorderTextFieldStyle())
                        }
                    }
                }
            }
        }
    }
}

//struct ViewPokeEditar_Previews: PreviewProvider {
//    static var previews: some View {
//        ViewPokeEditar()
//    }
//}
