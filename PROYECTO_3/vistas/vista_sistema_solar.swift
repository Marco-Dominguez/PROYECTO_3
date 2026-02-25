//
//  vista_sistema_solar.swift
//  PROYECTO_3
//
//  Created by Marco Dominguez on 16/02/26.
//

import SwiftUI

struct VistaSistemaSolar: View {
    @StateObject private var listaPlanetas = SistemaSolar()
    
    var body: some View {
        ZStack {
            // color de fondo
            Color(hex: 0x0E1621)
                .ignoresSafeArea()
            
            VStack(alignment: .leading) {
                // título
                Text("Sistema Solar")
                    .font(.system(size: 32, design: .monospaced).bold())
                    .foregroundColor(Color(hex: 0x81C784))
                    .frame(maxWidth: .infinity, alignment: .center)
                    .padding(.vertical, 12)
                    .border(Color(hex: 0x4B6E9B), width: 2)
                    .padding(.horizontal, 30)
                    .padding(.top, 20)
                
                // scroll de planetas
                ZStack {
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(alignment: .center, spacing: 20) {
                            ForEach(listaPlanetas.planetas) { planeta in
                                Planeta(planeta: planeta) {
                                    print("planeta: \(planeta.nombre)")
                                }
                            }
                        }
                        .padding(.horizontal, 40)
                        .frame(maxHeight: .infinity)
                    }
                }
            }
        }
    }
}

#Preview {
    VistaSistemaSolar()
}
