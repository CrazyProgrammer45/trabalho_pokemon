//
//  PassarDados.swift
//  trabalho_turma
//
//  Created by Ivan Nunes on 24/01/2022.
//

import SwiftUI

struct foo {
    var curr:Float
    var total:Float
}

struct PassarDados: View {
    @State var f = foo(curr: 100, total: 100)
    @State var aux:Float = Float(Int.random(in: 0...10))
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                ProgressView("bla bla bla \(Int(f.curr)) \(Int(f.total))", value: f.curr, total: f.total).frame(width: 200)
                
                HStack {
                    Button {
                        if f.curr < f.total {
                            f.curr += aux
                        } else {
                            f.curr = f.total
                        }
                    } label: {
                        Text("Up")
                            .frame(width: 50, height: 50)
                            .background(.yellow)
                    }
                    
                    Button {
                        if f.curr > 0 {
                            f.curr -= aux
                        } else {
                            f.curr = 0
                        }
                        
                    } label: {
//                        Image(systemName: "banana").font(.title).frame(width: 50, height: 40)
                        
                        Text("Down")
                            .frame(width: 50, height: 50)
                            .background(.red)
                            .foregroundColor(.white)
                    }
                }
                
                Spacer()
                HStack {
                    Text("Btn")
                        .frame(width: 50, height: 30)
                        .padding()
                }
            }
        }
    }
}

struct PassarDados_Previews: PreviewProvider {
    static var previews: some View {
        PassarDados()
    }
}
