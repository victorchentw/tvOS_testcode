//  NeuronComponentListViews.swift
//  List views for Neuron SwiftUI and UIKit components

import SwiftUI

// MARK: - Neuron SwiftUI Component List View

struct NeuronSwiftUIComponentListView: View {
    var body: some View {
        NavigationStack {
            List {
                Section("Layout Components") {
                    ForEach([
                        NeuronSwiftUIComponent.spacer,
                        .text,
                        .hstack,
                        .vstack,
                        .image,
                        .zstack,
                        .group,
                        .lazyVStack,
                        .scrollView
                    ], id: \.id) { component in
                        NavigationLink(component.title) {
                            NeuronSwiftUIDetail(item: component, selectedOption: .constant(nil))
                        }
                    }
                }
                
                Section("Interactive Components") {
                    ForEach([
                        NeuronSwiftUIComponent.picker,
                        .toggle,
                        .button
                    ], id: \.id) { component in
                        NavigationLink(component.title) {
                            NeuronSwiftUIDetail(item: component, selectedOption: .constant(nil))
                        }
                    }
                }
                
                Section("Common Modifiers") {
                    ForEach([
                        NeuronSwiftUIComponent.frameModifier,
                        .backgroundModifier,
                        .paddingModifier,
                        .cornerRadiusModifier,
                        .opacityModifier,
                        .alertModifier,
                        .onTapGestureModifier,
                        .onAppearModifier,
                        .overlayModifier,
                        .disabledModifier,
                        .focusedModifier
                    ], id: \.id) { component in
                        NavigationLink(component.title) {
                            NeuronSwiftUIDetail(item: component, selectedOption: .constant(nil))
                        }
                    }
                }
            }
            .navigationTitle("Neuron SwiftUI Components")
        }
    }
}

// MARK: - Neuron UIKit Component List View

struct NeuronUIKitComponentListView: View {
    var body: some View {
        NavigationStack {
            List {
                Section("Core Components") {
                    ForEach([
                        NeuronUIKitComponent.uiView,
                        .uiViewController,
                        .uiLabel,
                        .uiButton,
                        .uiImageView,
                        .uiTextField,
                        .uiTextView
                    ], id: \.id) { component in
                        NavigationLink(component.title) {
                            NeuronUIKitDetail(item: component, selectedOption: .constant(nil))
                        }
                    }
                }
                
                Section("System & Application") {
                    ForEach([
                        NeuronUIKitComponent.uiApplication,
                        .uiScreen,
                        .uiWindow,
                        .uiWindowScene,
                        .uiColor,
                        .uiFont,
                        .uiImage
                    ], id: \.id) { component in
                        NavigationLink(component.title) {
                            NeuronUIKitDetail(item: component, selectedOption: .constant(nil))
                        }
                    }
                }
                
                Section("Alerts & Interactions") {
                    ForEach([
                        NeuronUIKitComponent.uiAlertController,
                        .uiAlertAction,
                        .uiTouch,
                        .uiKeyCommand,
                        .uiContextMenuInteraction
                    ], id: \.id) { component in
                        NavigationLink(component.title) {
                            NeuronUIKitDetail(item: component, selectedOption: .constant(nil))
                        }
                    }
                }
                
                Section("Gesture Recognizers") {
                    ForEach([
                        NeuronUIKitComponent.uiGestureRecognizer,
                        .uiTapGestureRecognizer,
                        .uiLongPressGestureRecognizer
                    ], id: \.id) { component in
                        NavigationLink(component.title) {
                            NeuronUIKitDetail(item: component, selectedOption: .constant(nil))
                        }
                    }
                }
                
                Section("Collection Views") {
                    ForEach([
                        NeuronUIKitComponent.uiTableView,
                        .uiCollectionView
                    ], id: \.id) { component in
                        NavigationLink(component.title) {
                            NeuronUIKitDetail(item: component, selectedOption: .constant(nil))
                        }
                    }
                }
                
                Section("Visual Effects & Activities") {
                    ForEach([
                        NeuronUIKitComponent.uiVisualEffectView,
                        .uiActivityIndicatorView
                    ], id: \.id) { component in
                        NavigationLink(component.title) {
                            NeuronUIKitDetail(item: component, selectedOption: .constant(nil))
                        }
                    }
                }
                
                Section("SwiftUI Integration") {
                    ForEach([
                        NeuronUIKitComponent.uiHostingController,
                        .uiViewRepresentable,
                        .uiViewControllerRepresentable
                    ], id: \.id) { component in
                        NavigationLink(component.title) {
                            NeuronUIKitDetail(item: component, selectedOption: .constant(nil))
                        }
                    }
                }
                
                Section("Development Tools") {
                    ForEach([
                        NeuronUIKitComponent.uiStoryboard
                    ], id: \.id) { component in
                        NavigationLink(component.title) {
                            NeuronUIKitDetail(item: component, selectedOption: .constant(nil))
                        }
                    }
                }
            }
            .navigationTitle("Neuron UIKit Components")
        }
    }
}

#Preview("Neuron SwiftUI") {
    NeuronSwiftUIComponentListView()
}

#Preview("Neuron UIKit") {
    NeuronUIKitComponentListView()
}