//
//  vista_detalles_personaje.swift
//  PROYECTO_3
//
//  Created by Marco Dominguez on 24/02/26.
//
import SwiftUI

/// lista de personajes
struct VistaDetallesPersonaje: View {
    let personaje: PersonajeModelo
    let alVolver: () -> Void
    
    var body: some View {
        ZStack {
            Color(hex: 0x0E1621)
                .ignoresSafeArea()
            
            VStack(spacing: 16) {
                // titulo
                HStack {
                    Text(personaje.nombre.replacingOccurrences(of: "\n", with: " "))
                        .font(.system(size: 32, design: .monospaced).bold())
                        .foregroundColor(Color(hex: 0x81C784))
                    
                    Spacer()
                    
                    Button(action: alVolver) {
                        HStack {
                            Text("Volver")
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
                
                // scroll
                ScrollView(showsIndicators: false) {
                    VStack(spacing: 16) {
                        
                        // iamgen
                        AsyncImage(url: URL(string: personaje.urlImagen)) { fase in
                            if let imagen = fase.image {
                                imagen
                                    .resizable()
                                    .scaledToFill()
                            } else {
                                Color.gray.opacity(0.3)
                            }
                        }
                        .frame(maxWidth: .infinity, minHeight: 200, maxHeight: 300)
                        .clipped()
                        .border(Color(hex: 0x4B6E9B), width: 2)
                        
                        // decripcion
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Descripción")
                                .font(.system(size: 20, design: .monospaced).bold())
                                .foregroundColor(Color(hex: 0xFFA768))
                            
                            Text(personaje.descripcion)
                                .font(.system(size: 16, design: .monospaced))
                                .foregroundColor(.white)
                        }
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(Color(hex: 0x111C2B))
                        .border(Color(hex: 0x4B6E9B), width: 2)
                        
                        // objetos
                        if !personaje.objetos.isEmpty {
                            VStack(alignment: .leading, spacing: 8) {
                                Text("Objetos Identificados")
                                    .font(.system(size: 20, design: .monospaced).bold())
                                    .foregroundColor(Color(hex: 0xFFA768))
                                
                                ForEach(personaje.objetos, id: \.self) { objeto in
                                    HStack(alignment: .top) {
                                        Text("-")
                                            .foregroundColor(.white)
                                        Text(objeto)
                                            .foregroundColor(.white)
                                    }
                                    .font(.system(size: 16, design: .monospaced))
                                }
                            }
                            .padding()
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background(Color(hex: 0x111C2B))
                            .border(Color(hex: 0x4B6E9B), width: 2)
                        }
                    }
                }
            }
            .padding(24)
        }
    }
}

#Preview {
    VistaDetallesPersonaje(
        personaje: PersonajeModelo(
            nombre: "Gabbro",
            descripcion: "Un astronauta muy relajado que pasa su tiempo tocando la flauta en el Abismo del Gigante.",
            urlImagen: "https://outerwilds.ventures/assets/TH_VILLAGE-VoBiOHgy.jpg",
            objetos: ["Flauta Hearthiana", "Estatua Nomai"]
        ),
        alVolver: {}
    )
}
