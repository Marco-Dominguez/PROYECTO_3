//
//  tarjeta_rumor.swift
//  PROYECTO_3
//
//  Created by Marco Dominguez on 16/02/26.
//
import SwiftUI

struct TarjetaRumor: View {
    @State private var estaSeleccionado = false
    @State private var estaActivo = false
    let tituloTarjeta: String
    let urlImagen: String
    let colorTarjeta: Color
    let colorSobreTarjeta: Color
    let tamaño: TamañoTarjeta
    
    var body: some View {
        VStack(spacing:0){
            Text(tituloTarjeta)
                .foregroundColor(.black)
                .font(.system(size: tamaño.tamañoFuente, design: .monospaced).bold())
                .multilineTextAlignment(.center)
                .padding(.vertical, 12)
                .padding(.horizontal, 8)
                .fixedSize(horizontal: true, vertical: true)
                
            
            AsyncImage(url: URL(string: urlImagen)) { fase in
                if let imagen = fase.image {
                    imagen
                        .resizable()
                        .scaledToFit()
                } else {
                    ProgressView()
                }
            }
            .padding(.horizontal, 8)
            .padding(.bottom, 8)
        }
        .background(estaSeleccionado ? colorTarjeta : colorSobreTarjeta)
        .frame(width: tamaño.dimension)
        .cornerRadius(0)
        .onHover { seleccionado in
            self.estaActivo = seleccionado
        }
        .onTapGesture {
            self.estaSeleccionado.toggle()
        }
        .animation(.easeInOut(duration: 0.2), value: estaSeleccionado)
        .animation(.easeInOut(duration: 0.2), value: estaActivo)
    }
}

#Preview {
    VStack{
        TarjetaRumor(tituloTarjeta: "Ash Twin\nProject", urlImagen: "https://outerwilds.ventures/assets/TH_VILLAGE-VoBiOHgy.jpg", colorTarjeta: Color(hex: 0xB4764B), colorSobreTarjeta: (Color(hex: 0xFFA768)), tamaño: .grande)
        
        TarjetaRumor(tituloTarjeta: "Ash Twin\nProject", urlImagen: "https://outerwilds.ventures/assets/TH_VILLAGE-VoBiOHgy.jpg", colorTarjeta: Color(hex: 0xB4764B), colorSobreTarjeta: (Color(hex: 0xFFA768)), tamaño: .mediana)
        
        TarjetaRumor(tituloTarjeta: "Ash Twin\nProject", urlImagen: "https://outerwilds.ventures/assets/TH_VILLAGE-VoBiOHgy.jpg", colorTarjeta: Color(hex: 0xB4764B), colorSobreTarjeta: (Color(hex: 0xFFA768)), tamaño: .pequeña)
    }
    
}
