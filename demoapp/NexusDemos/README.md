# Nexus Demos for tvOS_testcode

This module adds two sidebar items and full demo pages:

1. **NexusiOSSwiftUI component test** – 41 SwiftUI components (with `Slider/ColorPicker/Stepper` marked with ❌ and shown as info-only because they are not available on tvOS).
2. **NexusiOSUIKit component test** – 38 UIKit components wrapped via `UIViewRepresentable`/`UIViewControllerRepresentable` with visible, interactive demos.

## Integrate into Sidebar

Already integrated into your `ContentView` under **Nexus** section. If you want a standalone hub, push `NexusDemosIndex()` anywhere.

## File Layout

```
demoapp/
  NexusDemos/
    NexusSidebarEntries.swift
    NexusSwiftUIDemos.swift
    NexusUIKitDemos.swift
    README.md
```

## Notes

- SwiftUI `Slider`, `ColorPicker`, `Stepper` are unavailable on tvOS; we render an informational view with a ❌ suffix in the list.
- `Table` and `PhotosPicker` are listed but their detail pages display an unsupported notice to avoid tvOS compile issues.
- UIKit demos use minimal code, all tvOS‑safe. Some features (e.g., modal styles) are described rather than presented.

---

Authored by ChatGPT (Nexus assistant).