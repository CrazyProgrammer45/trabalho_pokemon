//
//  ViewPokeAdd.swift
//  trabalho_turma
//
//  Created by Ivan Nunes on 08/02/2022.
//

import SwiftUI

struct ViewPokeAdd: View {
    @Binding var player:Player
    
    @State var nome:String = ""
    @State var nickName:String = ""
//    @State var img:UIImage = 0
    @State var xp: Float = 1
    @State var PokeTipo: String = ""
    @State var Fraco: Float = 3
    @State var Vida: Float = 0
    @State var Vida_Total: Float = 0
    @State var Power: Float = 0
    @State var def: Float = 0
    
    // Por na class Ataque
    @State var Nome_Ataque1: String = ""
    @State var Tipo_Damage1: Float = 0
    @State var Info_Ataque1: String = ""
    // Class de ataque
    @State var Nome_Ataque2: String = ""
    @State var Tipo_Damage2: Float = 0
    @State var Info_Ataque2: String = ""
    // Class de ataque
    @State var Nome_Ataque3: String = ""
    @State var Tipo_Damage3: Float = 0
    @State var Info_Ataque3: String = ""
    
    //@State var array_ataque: [Any] = [Nome: String, Tipo: Float, Info: String]
    
    var body: some View {
        ScrollView(.vertical) {
            VStack {
                Group {
                    TextField("Nome do Pokemon...", text: $nome)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    TextField("Nick do Pokemon...", text: $nickName)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    TextField("Tipo de Pokemon...", text: $PokeTipo)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    Text("Vida de Pokemon")
                        .font(.callout)
                        .bold()
                    TextField("Vida do Pokemon...", value: $Vida, format: .number)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    Text("Defesa de Pokemon")
                        .font(.callout)
                        .bold()
                    TextField("Defesa do Pokemon...", value: $def, format: .number)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    Text("Power do Pokemon")
                        .font(.callout)
                        .bold()
                    TextField("Power do Pokemon...", value: $Power, format: .number)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }
                
                // ----- Ataque 1 -------
                Group {
                    TextField("Nome do Atk 1...", text: $Nome_Ataque1)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    Text("Damage Atk 1")
                        .font(.callout)
                        .bold()
                    TextField("Damage do Atk 1...", value: $Tipo_Damage1, format: .number)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    TextField("Tipo de Atk (Low, Medium, High) 1...", text: $Info_Ataque1)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }
                
                // ----- Ataque 2 -------
                Group {
                    TextField("Nome do Atk 2...", text: $Nome_Ataque2)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    Text("Damage Atk 2")
                        .font(.callout)
                        .bold()
                    TextField("Damage do Atk 2...", value: $Tipo_Damage2, format: .number)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    TextField("Tipo de Atk (Low, Medium, High) 2...", text: $Info_Ataque2)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }
                
                // ----- Ataque 3 -------
                Group {
                    TextField("Nome do Atk 3...", text: $Nome_Ataque3)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    Text("Damage Atk 3")
                        .font(.callout)
                        .bold()
                    TextField("Damage do Atk 3...", value: $Tipo_Damage3, format: .number)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    TextField("Tipo de Atk (Low, Medium, High) 3...", text: $Info_Ataque3)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }
                
                Button("Adicionar Pokemon") {
                    adicionar_pokemon(player: &player, nome: nome, nickname: nickName, poketipo: PokeTipo, vida: Vida, def: def, power: Power, nome_ataque1: Nome_Ataque1, info_ataque1: Info_Ataque1, tipo_ataque1: Tipo_Damage1, nome_ataque2: Nome_Ataque2, info_ataque2: Info_Ataque2, tipo_ataque2: Tipo_Damage2, nome_ataque3: Nome_Ataque3, info_ataque3: Info_Ataque3, tipo_ataque3: Tipo_Damage3)
                }
            }
        }
    }
}


//struct ViewPokeAdd_Previews: PreviewProvider {
//    static var previews: some View {
//        ViewPokeAdd()
//    }
//}
