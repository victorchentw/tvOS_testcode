//  NeuronSwiftUIDemos.swift
//  SwiftUI components focused on most commonly used elements with tvOS-safe demos.

import SwiftUI

// MARK: - Data Models

struct NeuronPerson: Identifiable {
    let id = UUID()
    let name: String
    let age: Int
}

// MARK: - SwiftUI Component Enum (Most Used Components)

enum NeuronSwiftUIComponent: String, CaseIterable, Identifiable {
    // Core Layout Components (sorted by usage)
    case spacer = "Spacer✅"
    case text = "Text✅"
    case hstack = "HStack✅"
    case vstack = "VStack✅"
    case image = "Image✅"
    case zstack = "ZStack✅"
    case group = "Group✅"
    case lazyVStack = "LazyVStack✅"
    case scrollView = "ScrollView✅"
    
    // Interactive Components
    case picker = "Picker✅"
    case toggle = "Toggle✅"
    case button = "Button✅"
    
    // Modifiers as Components (most used)
    case frameModifier = ".frame✅"
    case backgroundModifier = ".background✅"
    case paddingModifier = ".padding✅"
    case cornerRadiusModifier = ".cornerRadius✅"
    case opacityModifier = ".opacity✅"
    case alertModifier = ".alert✅"
    case onTapGestureModifier = ".onTapGesture✅"
    case onAppearModifier = ".onAppear✅"
    case overlayModifier = ".overlay✅"
    case disabledModifier = ".disabled✅"
    case focusedModifier = ".focused✅"

    var id: String { rawValue }
    var title: String { rawValue }
}

// MARK: - Detail Router

struct NeuronSwiftUIDetail: View {
    let item: NeuronSwiftUIComponent
    @Binding var selectedOption: String?

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 24) {
                Text(item.title).font(.title2)
                Divider()
                demo
                Spacer(minLength: 20)
                Button("Back to Sidebar") {
                    selectedOption = nil
                }
                .buttonStyle(.borderedProminent)
                .controlSize(.large)
                .padding(.top, 20)
            }
            .padding()
        }
        .navigationTitle(item.title)
    }

    @ViewBuilder
    private var demo: some View {
        switch item {
        case .text: Text("Neuron Text Component").font(.title3)
        case .image:
            Image(systemName: "brain.head.profile").resizable().scaledToFit().frame(width: 160, height: 160)
        case .button:
            Button("Neuron Button") { }.buttonStyle(.bordered)
        case .toggle:
            Toggle("Neuron Toggle", isOn: .constant(true)).frame(maxWidth: 800)
        case .spacer:
            HStack { Text("Left"); Spacer(); Text("Right") }.frame(maxWidth: .infinity)
        case .group:
            Group { Text("Inside Neuron Group") }.padding().overlay(RoundedRectangle(cornerRadius: 12).stroke(.gray))
        case .scrollView:
            ScrollView { VStack(alignment: .leading, spacing: 8) { ForEach(1...20, id: \.self) { i in Text("Neuron Item \(i)"); Divider() } }.padding(.horizontal) }.frame(maxHeight: 320)
        case .vstack:
            VStack { Text("Neuron Top"); Text("Neuron Bottom") }.frame(maxWidth: .infinity)
        case .hstack:
            HStack { Text("Neuron Left"); Text("Neuron Right") }.frame(maxWidth: .infinity)
        case .zstack:
            ZStack { Color.gray.opacity(0.15); Text("Neuron Centered") }.frame(height: 140).clipShape(RoundedRectangle(cornerRadius: 12))
        case .lazyVStack:
            ScrollView { LazyVStack { ForEach(1...15, id: \.self) { item in Text("Neuron LazyVStack row \(item)") } } }.frame(maxHeight: 300)
        case .picker:
            Picker("Neuron Quality", selection: .constant("HD")) {
                Text("SD").tag("SD")
                Text("HD").tag("HD")
                Text("4K").tag("4K")
            }.pickerStyle(.menu)
        case .frameModifier:
            FrameModifierDemo()
        case .backgroundModifier:
            BackgroundModifierDemo()
        case .paddingModifier:
            PaddingModifierDemo()
        case .cornerRadiusModifier:
            CornerRadiusModifierDemo()
        case .opacityModifier:
            OpacityModifierDemo()
        case .alertModifier:
            AlertModifierDemo()
        case .onTapGestureModifier:
            OnTapGestureModifierDemo()
        case .onAppearModifier:
            OnAppearModifierDemo()
        case .overlayModifier:
            OverlayModifierDemo()
        case .disabledModifier:
            DisabledModifierDemo()
        case .focusedModifier:
            FocusedModifierDemo()
        }
    }
}

// MARK: - Modifier Demos

private struct FrameModifierDemo: View {
    var body: some View {
        VStack(spacing: 12) {
            Text(".frame Demo")
            Text("Fixed Size").frame(width: 200, height: 60).background(.blue.opacity(0.3))
            Text("Max Width").frame(maxWidth: .infinity).background(.green.opacity(0.3))
        }
    }
}

private struct BackgroundModifierDemo: View {
    var body: some View {
        VStack(spacing: 12) {
            Text(".background Demo")
            Text("Color Background").background(.red.opacity(0.3))
            Text("Material Background").background(.ultraThinMaterial)
        }
    }
}

private struct PaddingModifierDemo: View {
    var body: some View {
        VStack(spacing: 12) {
            Text(".padding Demo")
            Text("Default Padding").padding().background(.gray.opacity(0.3))
            Text("Custom Padding").padding(.horizontal, 40).background(.blue.opacity(0.3))
        }
    }
}

private struct CornerRadiusModifierDemo: View {
    var body: some View {
        VStack(spacing: 12) {
            Text(".cornerRadius Demo")
            Text("Rounded Corners").padding().background(.purple.opacity(0.3)).cornerRadius(12)
            Text("More Rounded").padding().background(.orange.opacity(0.3)).cornerRadius(25)
        }
    }
}

private struct OpacityModifierDemo: View {
    var body: some View {
        VStack(spacing: 12) {
            Text(".opacity Demo")
            Text("Full Opacity").opacity(1.0)
            Text("Half Opacity").opacity(0.5)
            Text("Low Opacity").opacity(0.3)
        }
    }
}

private struct AlertModifierDemo: View {
    @State private var showAlert = false
    var body: some View {
        VStack(spacing: 12) {
            Text(".alert Demo")
            Button("Show Alert") { showAlert = true }
                .alert("Neuron Alert", isPresented: $showAlert) {
                    Button("OK", role: .cancel) {}
                }
        }
    }
}

private struct OnTapGestureModifierDemo: View {
    @State private var tapCount = 0
    var body: some View {
        VStack(spacing: 12) {
            Text(".onTapGesture Demo")
            Text("Tapped \(tapCount) times")
                .padding()
                .background(.teal.opacity(0.3))
                .onTapGesture { tapCount += 1 }
        }
    }
}

private struct OnAppearModifierDemo: View {
    @State private var appeared = false
    var body: some View {
        VStack(spacing: 12) {
            Text(".onAppear Demo")
            Text(appeared ? "View Appeared!" : "Loading...")
                .onAppear { appeared = true }
        }
    }
}

private struct OverlayModifierDemo: View {
    var body: some View {
        VStack(spacing: 12) {
            Text(".overlay Demo")
            Rectangle()
                .fill(.blue.opacity(0.3))
                .frame(width: 120, height: 80)
                .overlay(Text("Overlay").foregroundColor(.white))
        }
    }
}

private struct DisabledModifierDemo: View {
    var body: some View {
        VStack(spacing: 12) {
            Text(".disabled Demo")
            Button("Enabled Button") {}
            Button("Disabled Button") {}.disabled(true)
        }
    }
}

private struct FocusedModifierDemo: View {
    @FocusState private var isFocused: Bool
    var body: some View {
        VStack(spacing: 12) {
            Text(".focused Demo")
            TextField("Focus me", text: .constant(""))
                .focused($isFocused)
                .frame(maxWidth: 300)
            Button("Toggle Focus") { isFocused.toggle() }
        }
    }
}