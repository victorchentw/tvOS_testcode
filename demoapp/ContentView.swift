//
//  ContentView.swift
//  demoapp
//
//  Created by victor.chen on 2025/10/23.
//

import SwiftUI

// MARK: - Option Views
struct Option1View: View {
    let tvOSVersion: String
    let onBack: () -> Void
    
    var body: some View {
        VStack {
            Text("Option 1 View")
            Text("tvOS Version: \(tvOSVersion)")
            Spacer()
        }
        .navigationTitle("Option 1")
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button("Back to Menu") {
                    onBack()
                }
                .buttonStyle(.borderedProminent)
            }
        }
    }
}

struct Option2View: View {
    let tvOSVersion: String
    let onBack: () -> Void
    
    var body: some View {
        VStack {
            Text("Option 2 View")
            Text("tvOS Version: \(tvOSVersion)")
            Spacer()
        }
        .navigationTitle("Option 2")
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button("Back to Menu") {
                    onBack()
                }
                .buttonStyle(.borderedProminent)
            }
        }
    }
}

struct Option3View: View {
    let tvOSVersion: String
    let onBack: () -> Void
    @State private var selectedSubOption = "Sub Option A"
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: 20) {
                Text("Option 3 View - Menu Style")
                Text("tvOS Version: \(tvOSVersion)")
                
                Text("Selected: \(selectedSubOption)")
                
                List {
                    NavigationLink("Sub Option A") {
                        SubOptionView(title: "Sub Option A", tvOSVersion: tvOSVersion)
                    }
                    NavigationLink("Sub Option B") {
                        SubOptionView(title: "Sub Option B", tvOSVersion: tvOSVersion)
                    }
                    NavigationLink("Sub Option C") {
                        SubOptionView(title: "Sub Option C", tvOSVersion: tvOSVersion)
                    }
                }
                .navigationTitle("Sub Options")
                
                Spacer()
            }
            .padding()
            .navigationTitle("Option 3 (Menu Style)")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Back to Menu") {
                        onBack()
                    }
                    .buttonStyle(.borderedProminent)
                }
            }
        }
    }
}

struct SubOptionView: View {
    let title: String
    let tvOSVersion: String
    
    var body: some View {
        VStack {
            Text("\(title) Detail")
            Text("tvOS Version: \(tvOSVersion)")
            Spacer()
        }
        .navigationTitle(title)
    }
}
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
        .focusable(true)
    }
}

// MARK: - Main ContentView
struct ContentView: View {
    @State private var isEnabled = false
    @State private var selectedMode = "1080p"
    @State private var showOverlay = false
    @State private var inputText = ""
    @FocusState private var focused: Bool
    @State private var selectedOption: String? = nil
    @State private var columnVisibility: NavigationSplitViewVisibility = .all

    var tvOSVersion: String {
        UIDevice.current.systemVersion
    }

    var body: some View {
        NavigationSplitView(columnVisibility: $columnVisibility) {
            List {
                Button("Go to Test Page") {
                    selectedOption = "Test Page"
                }
                
                Button("Option 1") {
                    selectedOption = "Option 1"
                }
                
                Button("Option 2") {
                    selectedOption = "Option 2"
                }
                
                Button("Option 3 (Menu Style)") {
                    selectedOption = "Option 3"
                }
            }
            .navigationTitle("Sidebar (NavigationSplitView ✅)")
        } detail: {
            Group {
                if let option = selectedOption {
                    switch option {
                    case "Test Page":
                        TestView(tvOSVersion: tvOSVersion)
                    case "Option 1":
                        Option1View(tvOSVersion: tvOSVersion, onBack: { selectedOption = nil })
                    case "Option 2":
                        Option2View(tvOSVersion: tvOSVersion, onBack: { selectedOption = nil })
                    case "Option 3":
                        Option3View(tvOSVersion: tvOSVersion, onBack: { selectedOption = nil })
                    default:
                        TestView(tvOSVersion: tvOSVersion)
                    }
                } else {
                    VStack(alignment: .leading, spacing: 20) {
                        Text("NavigationSplitView test ok ✅")
                            .font(.title)
                            .fontWeight(.bold)
                        
                        Text("please open the sidebar and select an option:")
                            .font(.headline)
                        
                        VStack(alignment: .leading, spacing: 10) {
                            Text("• Go to Test Page - SwiftUI Native API Test")
                            Text("• Option 1 - Simple Option Page")
                            Text("• Option 2 - Another Simple Option Page")
                            Text("• Option 3 (Menu Style) - Page with Submenu")
                        }
                        .padding(.leading, 20)
                        
                        Button("display Sidebar") {
                            columnVisibility = .doubleColumn
                        }
                        .buttonStyle(.borderedProminent)
                        .padding(.top, 20)
                        
                        Spacer()
                    }
                    .padding()
                    .navigationTitle("歡迎")
                }
            }
        }
    }
}

// MARK: - Detail Content TestView
struct TestView: View {
    let tvOSVersion: String
    @State private var isEnabled = false
    @State private var selectedMode = "1080p"
    @State private var showOverlay = false
    @State private var inputText = ""
    @FocusState private var focused: Bool
    @State private var showAlert = false
    @State private var showConfirmationDialog = false

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 30) {
                    // 1️⃣ Native Navigation
                    Text("1️⃣ Native NavigationStack ✅ navigationTitle shown above")

                    // 2️⃣ Native Toolbar
                    Text("2️⃣ Native Toolbar ✅ using .toolbar modifier")
                        .toolbar {
                            ToolbarItem(placement: .navigationBarTrailing) {
                                FocusableMenu()
                            }
                        }

                    // 3️⃣ Native ScrollView
                    Text("3️⃣ Native ScrollView ✅ this page is scrollable")

                    // 4️⃣ Native Button
                    HStack {
                        Text("4️⃣ Native Button ✅ focus & click ok")
                        Spacer()
                        Button("Native Button") {
                            print("Native Button tapped")
                        }
                        .buttonStyle(.borderedProminent)
                    }

                    // 5️⃣ Native TextField
                    HStack {
                        Text("5️⃣ Native TextField ✅ ")
                        Spacer()
                        TextField("Enter text...", text: $inputText)
                            .padding(8)
                            .frame(width: 300)
                            .background(Color.gray.opacity(0.3))
                            .cornerRadius(6)
                            // .disabled(true) // tvOS 無法直接輸入
                    }

                    // 6️⃣ Native ColorPicker
                    HStack {
                        Text("6️⃣ Native ColorPicker tvOS doesn't support(compile error) ❌")
                        Spacer()
                        // ❌ ColorPicker is unavailable in tvOS
                        // ColorPicker("Pick Color", selection: $selectedColor)
                        //     .frame(width: 150)
                        //     .focusable(true)
                    }

                    // 7️⃣ Native Toolbar Menu
                    HStack {
                        Text("7️⃣ Native Toolbar Menu (Menu) focused ✅, doesn't support dropdown menu on tvOS ❌")
                        Spacer()
                        FocusableMenu()
                    }

                    // 8️⃣ Native Toggle
                    HStack {
                        Text("8️⃣ Native Toggle , switch ✅ , focus with remote controller ✅")
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
                        .onTapGesture {
                            isEnabled.toggle()
                            print("Native Toggle switched to: \(isEnabled)")
                        }
                    }

                    // 9️⃣ Native Picker
                    VStack(alignment: .leading, spacing: 10) {
                        HStack {
                            Text("9️⃣ Picker (Menu), focused ok ✅ dropdown menu ok ✅")
                            Spacer()
                            Picker("Quality", selection: $selectedMode) {
                                Text("720p").tag("720p")
                                Text("1080p").tag("1080p")
                                Text("4K").tag("4K")
                            }
                            .pickerStyle(.menu)
                        }
                        HStack {
                            Text("🔟 Picker (Segmented) doesn't support focus and move ❌ ")
                            Spacer()
                            Picker("Quality", selection: $selectedMode) {
                                Text("Option1").tag("Option1")
                                Text("Option2").tag("Option2")
                                Text("Option3").tag("Option3")
                            }
                            .pickerStyle(.segmented)
                            .frame(width: 300)
                            .focusable(true)
                        }
                    }

                    // 1️⃣1️⃣ Context Menu
                    HStack {
                        Text("1️⃣1️⃣ Context Menu (Long Press) ✅")
                        Spacer()
                        Button("Show Options") {
                            print("Button tapped normally")
                        }
                        .buttonStyle(.borderedProminent)
                        .contextMenu {
                            Button("Restart Stream") { print("Restart stream tapped") }
                            Button("Disconnect") { print("Disconnect tapped") }
                            Toggle("Show Overlay", isOn: $showOverlay)
                            Picker("Bitrate", selection: $selectedMode) {
                                Text("Option1").tag("Option1")
                                Text("Option2").tag("Option2")
                                Text("Option3").tag("Option3")
                            }
                        }
                    }

                    // 1️⃣2️⃣ Overlay Test
                    HStack {
                        Text("1️⃣2️⃣ Overlay (moved .overlay to VStack) ✅")
                        Spacer()
                        Button(action: {
                            showOverlay.toggle()
                            print("showOverlay toggled to: \(showOverlay)")
                        }) {
                            Text(showOverlay ? "Hide Overlay" : "Show Overlay")
                        }
                        .buttonStyle(.borderedProminent)
                    }

                    // 1️⃣3️⃣ Alert Test
                    HStack {
                        Text("1️⃣3️⃣ Alert (System AlertView) ✅")
                        Spacer()
                        Button("Show Alert") {
                            showAlert = true
                            print("Alert button tapped")
                        }
                        .buttonStyle(.borderedProminent)
                        .alert("Native Alert", isPresented: $showAlert) {
                            Button("ok", role: .cancel) {
                                print("Alert: ok button tapped")
                            }
                            Button("cancel") {
                                print("Alert: cancel button tapped")
                            }
                            Button("delete", role: .destructive) {
                                print("Alert: delete button tapped")
                            }
                        } message: {
                            Text("This is an alert message.")
                        }
                    }

                    // 1️⃣4️⃣ ConfirmationDialog Test (ActionSheet on iOS, similar on tvOS)
                    HStack {
                        Text("1️⃣4️⃣ ConfirmationDialog (like ActionSheet) ✅")
                        Spacer()
                        Button("Show Options") {
                            showConfirmationDialog = true
                            print("ConfirmationDialog button tapped")
                        }
                        .buttonStyle(.borderedProminent)
                        .confirmationDialog("Selection Option", isPresented: $showConfirmationDialog) {
                            Button("Option 1") {
                                print("ConfirmationDialog: Option 1 tapped")
                            }
                            Button("Option 2") {
                                print("ConfirmationDialog: Option 2 tapped")
                            }
                            Button("Option 3", role: .destructive) {
                                print("ConfirmationDialog: Option 3 tapped")
                            }
                            Button("Option 4", role: .cancel) {
                                print("ConfirmationDialog: Option 4 tapped")
                            }
                        } message: {
                            Text("Please select an action to perform")
                        }
                    }
                }
                .padding()
                // ✅ overlay moved to container
                .overlay(alignment: .topTrailing) {
                    if showOverlay {
                        Text("Overlay Content")
                            .padding(8)
                            .background(Color.red.opacity(0.9))
                            .cornerRadius(8)
                            .transition(.opacity)
                            .zIndex(10)
                            .padding(.top, 10)
                            .padding(.trailing, 20)
                    }
                }
            }
            .navigationTitle("(NavigationTitle)SwiftUI Native API Test (tvOS \(tvOSVersion))")
        }
    }
}

#Preview {
    ContentView()
}
