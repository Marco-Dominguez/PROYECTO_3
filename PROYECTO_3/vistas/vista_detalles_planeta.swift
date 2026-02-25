//
//  vista_detalles_planeta.swift
//  PROYECTO_3
//
//  Created by Marco Dominguez on 16/02/26.
//
import SwiftUI

struct VistaDetallesPlaneta: View {
    let planeta: PlanetaModelo
    let alVolver: () -> Void
    
    @State private var ubicacionSeleccionada: UbicacionModelo?
    
    var body: some View {
        ZStack {
            Color(hex: 0x0E1621)
                .ignoresSafeArea()
            
            VStack(spacing: 16) {
                // nombre planeta
                HStack {
                    Text(planeta.nombre.replacingOccurrences(of: "\n", with: " "))
                        .font(.system(size: 32, design: .monospaced).bold())
                        .foregroundColor(Color(hex: 0x81C784))
                    
                    Spacer()
                    
                    Button(action: alVolver) {
                        HStack {
                            Text("Volver al Mapa")
                                .font(.system(size: 16, design: .monospaced))
                            Image(systemName: "circle")
                                .foregroundColor(.red)
                        }
                        .foregroundColor(.white)
                    }
                }
                .padding(.horizontal, 16)
                .padding(.vertical, 12)
                .border(Color(hex: 0x4B6E9B), width: 2)
                
                GeometryReader { geo in
                    HStack(spacing: 16) {
                        
                        // Ubicaciones - 70%
                        ScrollView {
                            VStack(alignment: .leading, spacing: 16) {
                                ForEach(planeta.ubicaciones) { ubicacion in
                                    HStack(spacing: 8) {
                                        // flecha de elemento activo
                                        Image(systemName: "arrowtriangle.right.fill")
                                            .foregroundColor(ubicacionSeleccionada?.id == ubicacion.id ? Color(hex: 0xFFA768) : .clear)
                                        
                                        Text(ubicacion.nombre)
                                            .font(.system(size: 18, design: .monospaced))
                                            .foregroundColor(.white)
                                            .fixedSize(horizontal: false, vertical: true)
                                    }
                                    .contentShape(Rectangle())
                                    .onTapGesture {
                                        withAnimation {
                                            ubicacionSeleccionada = ubicacion
                                        }
                                    }
                                }
                            }
                            .padding()
                            .frame(maxWidth: .infinity, alignment: .leading)
                        }
                        .frame(width: (geo.size.width - 16) * 0.55)
                        .border(Color(hex: 0x4B6E9B), width: 2)
                        
                        // Imagen - 30%
                        Color.clear
                            .overlay(
                                Group {
                                    if let ubicacion = ubicacionSeleccionada {
                                        AsyncImage(url: URL(string: ubicacion.urlImagen)) { fase in
                                            if let imagen = fase.image {
                                                imagen
                                                    .resizable()
                                                    .scaledToFill()
                                            } else {
                                                Color.gray.opacity(0.3)
                                            }
                                        }
                                    }
                                }
                            )
                            .clipped()
                        .frame(width: (geo.size.width - 16) * 0.45)
                        .border(Color(hex: 0x4B6E9B), width: 2)
                    }
                }
                .frame(height: 300)
                
                // Detalles
                ScrollView {
                    VStack(alignment: .leading, spacing: 16) {
                        if let ubicacion = ubicacionSeleccionada {
                            ForEach(ubicacion.detalles, id: \.self) { detalle in
                                HStack(alignment: .top, spacing: 8) {
                                    Text("-")
                                        .foregroundColor(.white)
                                    Text(detalle)
                                        .foregroundColor(.white)
                                }
                                .font(.system(size: 16, design: .monospaced))
                            }
                        }
                    }
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .border(Color(hex: 0x4B6E9B), width: 2)
            }
            .padding(24)
        }
        .onAppear {
            if ubicacionSeleccionada == nil {
                ubicacionSeleccionada = planeta.ubicaciones.first
            }
        }
    }
}

#Preview {
    VistaDetallesPlaneta(
        planeta: PlanetaModelo(
            nombre: "Zarza Oscura",
            imagen: "",
            tamaño: 100,
            ubicaciones: [
                UbicacionModelo(nombre: "Campamento de Feldespato", urlImagen: "https://outerwilds.ventures/assets/TH_VILLAGE-VoBiOHgy.jpg", detalles: ["Feldespato está vivo.", "No quiere volver."])
            ]
        ),
        alVolver: {}
    )
}
