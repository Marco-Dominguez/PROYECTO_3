//
//  boton_menu.swift
//  PROYECTO_3
//
//  Created by Marco Dominguez on 24/02/26.
//
import SwiftUI

struct BotonMenu: View {
    let texto: String
    let icono: String
    
    var body: some View {
        HStack(spacing: 16) {
            Image(systemName: icono)
                .font(.system(size: 22))
                .foregroundColor(Color(hex: 0xFFA768))
                .frame(width: 30)
            
            Text(texto)
                .font(.system(size: 20, design: .monospaced).bold())
                .foregroundColor(.white)
            
            Spacer()
            
            Image(systemName: "chevron.right")
                .foregroundColor(Color(hex: 0x4B6E9B))
        }
        .padding(.horizontal, 20)
        .padding(.vertical, 16)
        .frame(maxWidth: 320)
        .background(Color(hex: 0x111C2B))
        .border(Color(hex: 0x4B6E9B), width: 2)
        .shadow(color: .black.opacity(0.4), radius: 5, x: 0, y: 5)
    }
}

#Preview {
    ZStack {
        Color(hex: 0x0E1621).ignoresSafeArea()
        BotonMenu(texto: "Sistema Solar", icono: "sun.max.fill")
    }
}
