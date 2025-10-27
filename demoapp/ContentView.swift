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
// struct FocusableNativeToggle: View {
//     let title: String
//     @Binding var isOn: Bool
//     @FocusState private var focused: Bool

//     var body: some View {
//         HStack {
//             Toggle(isOn: $isOn) {
//                 Text(title)
//                     .foregroundColor(.white)
//             }
//             .toggleStyle(.switch) // ✅ 關鍵：啟用系統 switch 外觀
//         }
//         .padding(.horizontal, 10)
//         .frame(width: 400, height: 50)
//         .background(focused ? Color.white.opacity(0.2) : Color.clear)
//         .cornerRadius(10)
//         .focused($focused)
//         .focusable()
//         // ✅ tvOS 遙控器點擊
//         .onTapGesture {
//             isOn.toggle()
//             print("Native Toggle switched to: \(isOn)")
//         }
//     }
// }

// MARK: - Main ContentView
struct ContentView: View {
    @State private var isEnabled = false
    @State private var selectedMode = "1080p"
    @State private var showOverlay = false
    @FocusState private var focused: Bool

    var tvOSVersion: String {
        UIDevice.current.systemVersion
    }

    var body: some View {
        NavigationView {
            VStack(spacing: 30) {
                // Text("🧩 Testing Native Components on tvOS")
                //     .font(.headline)
                //     .padding(.bottom, 10)

                // 1️⃣ Toolbar Menu
                HStack {
                    Text("1️⃣ Native Toolbar Menu (Menu) focused ✅, doesn't support dropdown menu on tvOS ❌")
                    Spacer()
                    FocusableMenu()
                }

                // 2️⃣ Native Toggle
                HStack {
                    Text("2️⃣ Native Toggle , switch ✅ , no focused state on tvOS ❌ background color can be changed ✅")
                    Spacer()
                    Toggle(isOn: $isEnabled) {
                        Text("Toggle Test")
                            .foregroundColor(.white)
                    }
                    .toggleStyle(.switch)
                    .padding(.horizontal, 10)
                    .frame(width: 400, height: 50)
                    .background(isEnabled ? Color.white.opacity(0.2) : Color.clear)
                    .cornerRadius(10)
                    .focused($focused)
                    .focusable()
                    .onChange(of: focused) { newValue in
                        print("Toggle onChange: \(newValue)")
                    }
                    .onTapGesture {
                        isEnabled.toggle()
                        print("Native Toggle switched to: \(isEnabled)")
                    }
                }

                // 3️⃣ Picker
                VStack(alignment: .leading, spacing: 10) {
                    HStack {
                        Text("3️⃣ Picker (Menu), focused ok ✅ dropdown menu ok ✅")
                        Spacer()
                        Picker("Quality", selection: $selectedMode) {
                            Text("720p").tag("720p")
                            Text("1080p").tag("1080p")
                            Text("4K").tag("4K")
                        }
                        .pickerStyle(.menu)
                    }
                    HStack {
                        Text("4️⃣Picker (Segmented) doesn't support focus and move ❌ ")
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

                // 5️⃣ Context Menu
                HStack {
                    Text("5️⃣ Context Menu (Long Press) ✅")
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

                // 6️⃣ Overlay
                HStack {
                    Text("6️⃣ Overlay (using .overlay modifier)")
                    Spacer()
                    Button(action: { 
                        showOverlay.toggle()
                        print("showOverlay toggled to: \(showOverlay)")
                    }) {
                        Text(showOverlay ? "Hide Overlay" : "Show Overlay")
                            .padding()
                            .background(Color.blue.opacity(0.1))
                            .cornerRadius(10)
                            .overlay(
                                Group {
                                    if showOverlay {
                                        Text("Overlay Content")
                                            .padding(5)
                                            .background(Color.red.opacity(0.9)) // 更明顯的顏色
                                            .cornerRadius(5)
                                            .transition(.opacity)
                                    }
                                },
                                alignment: .top // 疊加在頂部
                            )
                    }
                    .focusable()
                }
            }
            .padding()
            .navigationTitle("SwiftUI Native API Test App on Apple TV (tvOS \(tvOSVersion))")
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
