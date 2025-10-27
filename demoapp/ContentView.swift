//
//  ContentView.swift
//  demoapp
//
//  Created by victor.chen on 2025/10/23.
//

import SwiftUI

// MARK: - Focusable Menu (toolbar)
struct FocusableMenu: View {
    @FocusState private var isFocused: Bool

    var body: some View {
        Menu {
            Button("Settings") { print("Settings tapped") }
            Menu("Streaming") {
                Button("YouTube") { print("YouTube tapped") }
                Button("Facebook Live") { print("Facebook Live tapped") }
            }
        } label: {
            Image(systemName: "ellipsis.circle.fill")
                .font(.title)
                .foregroundColor(isFocused ? .accentColor : .primary)
        }
        .focused($isFocused)
        .focusable()
    }
}

// MARK: - Native Toggle Wrapper (preserves system switch look)
struct FocusableNativeToggle: View {
    let title: String
    @Binding var isOn: Bool
    @FocusState private var focused: Bool

    var body: some View {
        HStack {
            Toggle(isOn: $isOn) {
                Text(title)
                    .foregroundColor(.white)
            }
            .toggleStyle(.switch) // ✅ 關鍵：啟用系統 switch 外觀
        }
        .padding(.horizontal, 10)
        .frame(width: 400, height: 50)
        .background(focused ? Color.white.opacity(0.2) : Color.clear)
        .cornerRadius(10)
        .focused($focused)
        .focusable()
        // ✅ tvOS 遙控器點擊
        .onTapGesture {
            isOn.toggle()
            print("Native Toggle switched to: \(isOn)")
        }
    }
}

// MARK: - Main ContentView
struct ContentView: View {
    @State private var isEnabled = false
    @State private var selectedMode = "1080p"
    @State private var showOverlay = false
    @FocusState private var focused: Bool

    var body: some View {
        NavigationView {
            VStack(spacing: 30) {
                // Text("🧩 Testing Native Components on tvOS")
                //     .font(.headline)
                //     .padding(.bottom, 10)

                // 1️⃣ Toolbar Menu
                HStack {
                    Text("1️⃣ Native Toolbar Menu (Menu) ❌  doesn't support dropdown on tvOS")
                    Spacer()
                    FocusableMenu()
                }

                // 2️⃣ Native Toggle
                HStack {
                    Text("2️⃣ Native Toggle ✅ , but no focused state on tvOS ❌")
                    Spacer()
                    Toggle(isOn: $isEnabled) {
                        Text("Toggle Test")
                            .foregroundColor(.white)
                    }
                    .toggleStyle(.switch)
                    .padding(.horizontal, 10)
                    .frame(width: 400, height: 50)
                    .background(focused ? Color.white.opacity(0.2) : Color.clear)
                    .cornerRadius(10)
                    .focused($focused)
                    .focusable()
                    .onTapGesture {
                        isEnabled.toggle()
                        print("Native Toggle switched to: \(isEnabled)")
                    }
                }

                                // 3️⃣ Picker
                VStack(alignment: .leading, spacing: 10) {
                    HStack {
                        Text("Picker (Menu) ✅")
                        Spacer()
                        Picker("Quality", selection: $selectedMode) {
                            Text("720p").tag("720p")
                            Text("1080p").tag("1080p")
                            Text("4K").tag("4K")
                        }
                        .pickerStyle(.menu)
                    }
                    HStack {
                        Text("Picker (Segmented) ❌ can't focus and move")
                        Spacer()
                        Picker("Quality", selection: $selectedMode) {
                            Text("720p").tag("720p")
                            Text("1080p").tag("1080p")
                            Text("4K").tag("4K")
                        }
                        .pickerStyle(.segmented)
                        .frame(width: 300)
                        .focusable(true)
                    }
                }

                // 4️⃣ Context Menu
                HStack {
                    Text("4️⃣ Context Menu (Long Press)")
                    Spacer()
                    Button("Show Options") {
                        print("Button tapped normally")
                    }
                    .contextMenu {
                        Button("Restart Stream") { print("Restart stream tapped") }
                        Button("Disconnect") { print("Disconnect tapped") }
                        Toggle("Show Overlay", isOn: $showOverlay)
                        Picker("Bitrate", selection: $selectedMode) {
                            Text("5 Mbps").tag("5 Mbps")
                            Text("10 Mbps").tag("10 Mbps")
                            Text("15 Mbps").tag("15 Mbps")
                        }
                    }
                }

                // 5️⃣ Overlay
                HStack {
                    Text("5️⃣ Overlay Display (Conditional View)")
                    Spacer()
                    if showOverlay {
                        Text("Overlay Active")
                            .padding()
                            .background(.ultraThinMaterial)
                            .cornerRadius(10)
                            .transition(.opacity)
                    }
                }
            }
            .padding()
            .navigationTitle("Native API Test App")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    FocusableMenu()
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
