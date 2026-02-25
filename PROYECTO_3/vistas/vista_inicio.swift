//
//  vista_inicio.swift
//  PROYECTO_3
//
//  Created by Marco Dominguez on 16/02/26.
//
import SwiftUI

struct VistaInicio: View {
    var body: some View {
        NavigationView {
            ZStack {
                // fondo
                Color(hex: 0x0E1621)
                    .ignoresSafeArea()
                
                VStack(spacing: 50) {
                    
                    // logo
                    VStack(spacing: 20) {
                        ZStack {
                            Image(systemName: "triangle")
                                .font(.system(size: 140, weight: .ultraLight))
                                .foregroundColor(.white)
                            
                            Image(systemName: "sparkles")
                                .font(.system(size: 30))
                                .foregroundColor(.white)
                                .offset(y: -25)
                            
                            Image(systemName: "flame.fill")
                                .font(.system(size: 50))
                                .foregroundColor(Color(hex: 0xFFA768))
                                .offset(y: 15)
                        }
                        .frame(height: 160)
                        
                        VStack(spacing: 8) {
                            Text("OUTER WILDS")
                                .font(.system(size: 36, design: .monospaced).bold())
                                .foregroundColor(Color(hex: 0xB4764B))
                            
                            Text("BITÁCORA DE EXPLORACIÓN")
                                .font(.system(size: 16, design: .monospaced))
                                .foregroundColor(Color(hex: 0x81C784))
                        }
                    }
                    .padding(.top, 40)
                    
                    // menu
                    VStack(spacing: 24) {
                        NavigationLink(destination: VistaSistemaSolar()) {
                            BotonMenu(texto: "Sistema Solar", icono: "sun.max.fill")
                        }
                        
                        NavigationLink(destination: VistaMapaRumores()) {
                            BotonMenu(texto: "Mapa de Rumores", icono: "map.fill")
                        }
                        
                        NavigationLink(destination: VistaInfoPersonajes()) {
                            BotonMenu(texto: "Personajes", icono: "person.3.sequence.fill")
                        }
                    }
                    
                    Spacer()
                }
            }
            .navigationBarHidden(true)
        }
        .accentColor(Color(hex: 0xFFA768))
        .navigationViewStyle(.stack)
    }
}

#Preview {
    VistaInicio()
}
