//
//  detalles_rumor.swift
//  PROYECTO_3
//
//  Created by Marco Dominguez on 24/02/26.
//

import SwiftUI

// detalles de cada rumor
struct DetallesRumor: View {
    let detalles: [String]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            ForEach(detalles, id: \.self) { detalle in
                HStack(alignment: .top, spacing: 8) {
                    Text("-")
                        .font(.system(size: 16, design: .monospaced))
                        .foregroundColor(.white)
                    
                    Text(detalle)
                        .font(.system(size: 16, design: .monospaced))
                        .foregroundColor(.white)
                        .fixedSize(horizontal: false, vertical: true)
                }
            }
        }
        .padding()
        .background(Color(hex: 0x111C2B))
        .border(Color(hex: 0x4B6E9B), width: 2)
        .padding(.horizontal, 24)
        .shadow(color: .black.opacity(0.5), radius: 10, x: 0, y: 5)
    }
}

#Preview {
    ZStack {
        Color(hex: 0x0E1621).ignoresSafeArea()
        DetallesRumor(detalles: [
            "Un extraño fragmento de roca que deambula cuando nadie mira. Los Nomai determinaron que este fragmento es la razón por la que los objetos en esta arboleda se comportan de manera cuántica.",
            "Los Nomai plantearon la hipótesis de que este fragmento es en realidad un pedazo de la Luna Cuántica."
        ])
    }
}
