//
//  vista_detalles_planeta.swift
//  PROYECTO_3
//
//  Created by Marco Dominguez on 16/02/26.
//
import SwiftUI

/// vista que muestra el desglose de ubicaciones y detalles de un planeta seleccionado.
struct VistaDetallesPlaneta: View {
    let planeta: PlanetaModelo
    let alVolver: () -> Void
    
    /// rastrea qué ubicación está seleccionada para mostrar sus detalles
    @State private var ubicacionSeleccionada: UbicacionModelo?
    
    var body: some View {
        ZStack {
            Color(hex: 0x0E1621)
                .ignoresSafeArea()
            
            VStack(spacing: 16) {
                // MARK: - Header (Título y Botón Volver)
                HStack {
                    Text(planeta.nombre.replacingOccurrences(of: "\n", with: " "))
                        .font(.system(size: 32, design: .monospaced).bold())
                        .foregroundColor(Color(hex: 0x81C784))
                    
                    Spacer()
                    
                    Button(action: alVolver) {
                        HStack {
                            Text("Volver al Mapa")
                                .font(.system(size: 16, design: .monospaced))
                            Image(systemName: "circle") // Ícono simulando botón de control
                                .foregroundColor(.red)
                        }
                        .foregroundColor(.white)
                    }
                }
                .padding(.horizontal, 16)
                .padding(.vertical, 12)
                .border(Color(hex: 0x4B6E9B), width: 2)
                
                // MARK: - Cuerpo Central (Lista e Imagen)
                GeometryReader { geo in
                    HStack(spacing: 16) {
                        
                        // Lista de Ubicaciones (Izquierda) - 70% del ancho
                        ScrollView {
                            VStack(alignment: .leading, spacing: 16) {
                                ForEach(planeta.ubicaciones) { ubicacion in
                                    HStack(spacing: 8) {
                                        // Flecha indicadora de selección
                                        Image(systemName: "arrowtriangle.right.fill")
                                            .foregroundColor(ubicacionSeleccionada?.id == ubicacion.id ? Color(hex: 0xFFA768) : .clear)
                                        
                                        Text(ubicacion.nombre)
                                            .font(.system(size: 18, design: .monospaced))
                                            .foregroundColor(.white)
                                            // Permite que el texto ocupe más de una línea si es largo
                                            .fixedSize(horizontal: false, vertical: true)
                                    }
                                    // Hace que toda la fila sea tocable
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
                        // Aplicamos el 70% de la pantalla menos el espaciado
                        .frame(width: (geo.size.width - 16) * 0.7)
                        .border(Color(hex: 0x4B6E9B), width: 2)
                        
                        // Imagen de la ubicación (Derecha) - 30% del ancho
                        Color.clear // Actúa como una caja rígida
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
                            .clipped() // Corta la imagen sobrante para que no invada la lista
                        // Aplicamos el 30% de la pantalla menos el espaciado
                        .frame(width: (geo.size.width - 16) * 0.3)
                        .border(Color(hex: 0x4B6E9B), width: 2)
                    }
                }
                // Damos un alto fijo a la sección central para asegurar el diseño dividido
                .frame(height: 300)
                
                // MARK: - Panel Inferior (Notas / Detalles)
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
            // Seleccionar por defecto la primera ubicación al abrir
            if ubicacionSeleccionada == nil {
                ubicacionSeleccionada = planeta.ubicaciones.first
            }
        }
    }
}

// Previsualización inyectando datos falsos
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
