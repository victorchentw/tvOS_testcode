 //  NexusUIKitDemos.swift
//  38 UIKit components wrapped for SwiftUI previews on tvOS.

import SwiftUI
import UIKit

// MARK: - UIKit Component Enum (38)

enum NexusUIKitComponent: String, CaseIterable, Identifiable {
    // Sorted alphabetically
    case caGradientLayer = "CAGradientLayer✅"
    case caLayer = "CALayer✅"
    case caShapeLayer = "CAShapeLayer✅"
    case uiActivityIndicator = "UIActivityIndicatorView✅"
    case uiAlertController = "UIAlertController✅"
    case uiBarButtonItem = "UIBarButtonItem✅"
    case uiBezierPath = "UIBezierPath✅"
    case uiBlurEffect = "UIBlurEffect✅"
    case uiButton = "UIButton✅"
    case uiCollectionView = "UICollectionView✅"
    case uiDevice = "UIDevice✅"
    case uiEdgeInsets = "UIEdgeInsets✅"
    case uiHostingController = "UIHostingController✅"
    case uiImageView = "UIImageView✅"
    case uiKeyCommand = "UIKeyCommand✅"
    case uiLabel = "UILabel✅"
    case uiLongPress = "UILongPressGestureRecognizer✅"
    case uiMenu = "UIMenu✅"
    case uiModalStyles = "UIModalPresentationStyle✅"
    case uiNavigationBar = "UINavigationBar✅"
    case uiNavigationController = "UINavigationController✅"
    case uiPageControl = "UIPageControl✅"
    case uiPanGesture = "UIPanGestureRecognizer✅"
    case uiPopoverPresentation = "UIPopoverPresentationController❌"
    case uiPresentationController = "UIPresentationController✅"
    case uiScreen = "UIScreen✅"
    case uiScrollView = "UIScrollView✅"
    case uiSegmentedControl = "UISegmentedControl✅"
    case uiSlider = "UISlider❌"
    case uiStackView = "UIStackView✅"
    case uiStatusBarStyle = "UIStatusBarStyle❌"
    case uiSwitch = "UISwitch✅"
    case uiTabBarController = "UITabBarController✅"
    case uiTableView = "UITableView✅"
    case uiTapGesture = "UITapGestureRecognizer✅"
    case uiTextField = "UITextField✅"
    case uiTextView = "UITextView✅"
    case uiVisualEffectView = "UIVisualEffectView✅"

    var id: String { rawValue }
    var title: String { rawValue }
}

// MARK: - Detail Router

struct NexusUIKitDetail: View {
    let item: NexusUIKitComponent
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
            }.padding()
        }
        .navigationTitle(item.title)
    }

    @ViewBuilder
    private var demo: some View {
        switch item {
        case .caGradientLayer: CAGradientLayerDemo()
        case .caLayer: CALayerDemo()
        case .caShapeLayer: CAShapeLayerDemo()
        case .uiActivityIndicator: UIKitActivityIndicatorDemo()
        case .uiAlertController: UIKitAlertControllerDemo()
        case .uiBarButtonItem: UIKitBarButtonItemDemo()
        case .uiBezierPath: UIKitBezierPathDemo()
        case .uiBlurEffect: UIKitBlurEffectDemo()
        case .uiButton: UIKitButtonDemo()
        case .uiCollectionView: UIKitCollectionViewDemo()
        case .uiDevice: UIKitDeviceDemo()
        case .uiEdgeInsets: UIEdgeInsetsDemo()
        case .uiHostingController: UIHostingControllerDemo()
        case .uiImageView: UIKitImageViewDemo()
        case .uiKeyCommand: UIKitKeyCommandDemo()
        case .uiLabel: UIKitLabelDemo()
        case .uiLongPress: UIKitLongPressGestureDemo()
        case .uiMenu: UIMenuDemo()
        case .uiModalStyles: UIModalStyleDemo()
        case .uiNavigationBar: UIKitNavigationBarDemo()
        case .uiNavigationController: UINavigationControllerDemo()
        case .uiPageControl: UIKitPageControlDemo()
        case .uiPanGesture: UIKitPanGestureDemo()
        case .uiPopoverPresentation: UIPopoverPresentationDemo()
        case .uiPresentationController: UIPresentationControllerDemo()
        case .uiScreen: UIKitScreenDemo()
        case .uiScrollView: UIKitScrollViewDemo()
        case .uiSegmentedControl: UIKitSegmentedControlDemo()
        case .uiSlider: UIKitSliderDemo()
        case .uiStackView: UIKitStackViewDemo()
        case .uiStatusBarStyle: UIStatusBarStyleDemo()
        case .uiSwitch: UIKitSwitchDemo()
        case .uiTabBarController: UITabBarControllerDemo()
        case .uiTableView: UIKitTableViewDemo()
        case .uiTapGesture: UIKitTapGestureDemo()
        case .uiTextField: UIKitTextFieldDemo()
        case .uiTextView: UIKitTextViewDemo()
        case .uiVisualEffectView: UIKitVisualEffectDemo()
        }
    }
}

// MARK: - Wrappers & Demos

struct UIKitLabelDemo: UIViewRepresentable {
    func makeUIView(context: Context) -> UILabel {
        let v = UILabel()
        v.text = "UILabel demo"
        v.font = .preferredFont(forTextStyle: .title2)
        v.textAlignment = .center
        return v
    }
    func updateUIView(_ uiView: UILabel, context: Context) {}
}

struct UIKitButtonDemo: UIViewRepresentable {
    class Coordinator {
        @objc func tap(_ sender: UIButton) {
            sender.setTitle("Tapped", for: .normal)
        }
    }
    func makeCoordinator() -> Coordinator { Coordinator() }
    func makeUIView(context: Context) -> UIButton {
        let v = UIButton(type: .system)
        v.setTitle("UIButton", for: .normal)
        v.addTarget(context.coordinator, action: #selector(Coordinator.tap), for: .primaryActionTriggered)
        v.titleLabel?.font = .preferredFont(forTextStyle: .title3)
        return v
    }
    func updateUIView(_ uiView: UIButton, context: Context) {}
}

struct UIKitSwitchDemo: UIViewRepresentable {
    func makeUIView(context: Context) -> UILabel {
        let l = UILabel()
        l.text = "UISwitch is not available on tvOS"
        l.numberOfLines = 0
        l.textAlignment = .center
        return l
    }
    func updateUIView(_ uiView: UILabel, context: Context) {}
}

struct UIKitSliderDemo: UIViewRepresentable {
    func makeUIView(context: Context) -> UILabel {
        let l = UILabel()
        l.text = "UISlider is not available on tvOS"
        l.numberOfLines = 0
        l.textAlignment = .center
        return l
    }
    func updateUIView(_ uiView: UILabel, context: Context) {}
    // 'UISlider' is unavailable in tvOS
    // func makeUIView(context: Context) -> UISlider {
    //     let slider = UISlider()
    //     slider.minimumValue = 0
    //     slider.maximumValue = 100
    //     slider.value = 50
    //     return slider
    // }
    // func updateUIView(_ uiView: UISlider, context: Context) {}
}

struct UIKitPageControlDemo: UIViewRepresentable {
    func makeUIView(context: Context) -> UIStackView {
        let label = UILabel()
        let pc = UIPageControl()
        pc.numberOfPages = 5
        pc.currentPage = 2
        label.text = "Current: 3"
        pc.addAction(UIAction { _ in label.text = "Current: \(pc.currentPage+1)" }, for: .valueChanged)
        let s = UIStackView(arrangedSubviews: [label, pc])
        s.axis = .vertical
        s.spacing = 16
        s.alignment = .center
        return s
    }
    func updateUIView(_ uiView: UIStackView, context: Context) {}
}

struct UIKitActivityIndicatorDemo: UIViewRepresentable {
    func makeUIView(context: Context) -> UIActivityIndicatorView {
        let v = UIActivityIndicatorView(style: .large)
        v.startAnimating()
        return v
    }
    func updateUIView(_ uiView: UIActivityIndicatorView, context: Context) {}
}

struct UIKitSegmentedControlDemo: UIViewRepresentable {
    func makeUIView(context: Context) -> UISegmentedControl {
        let v = UISegmentedControl(items: ["One", "Two", "Three"])
        v.selectedSegmentIndex = 1
        return v
    }
    func updateUIView(_ uiView: UISegmentedControl, context: Context) {}
}

struct UIKitTextFieldDemo: UIViewRepresentable {
    func makeUIView(context: Context) -> UITextField {
        let v = UITextField()
        v.placeholder = "Type here"
        v.borderStyle = .roundedRect
        return v
    }
    func updateUIView(_ uiView: UITextField, context: Context) {}
}

struct UIKitTextViewDemo: UIViewRepresentable {
    func makeUIView(context: Context) -> UITextView {
        let v = UITextView()
        v.text = "UITextView content"
        v.font = .preferredFont(forTextStyle: .body)
        return v
    }
    func updateUIView(_ uiView: UITextView, context: Context) {}
}

struct UIKitImageViewDemo: UIViewRepresentable {
    func makeUIView(context: Context) -> UIImageView {
        let v = UIImageView(image: UIImage(systemName: "star"))
        v.contentMode = .scaleAspectFit
        return v
    }
    func updateUIView(_ uiView: UIImageView, context: Context) {}
}

struct UIKitStackViewDemo: UIViewRepresentable {
    func makeUIView(context: Context) -> UIStackView {
        let a = UILabel()
        a.text = "A"
        let b = UILabel()
        b.text = "B"
        let s = UIStackView(arrangedSubviews: [a,b])
        s.spacing = 12
        return s
    }
    func updateUIView(_ uiView: UIStackView, context: Context) {}
}

struct UIKitScrollViewDemo: UIViewRepresentable {
    func makeUIView(context: Context) -> UIScrollView {
        let scroll = UIScrollView()
        scroll.contentSize = CGSize(width: 800, height: 800)
        let v = UIView(frame: CGRect(x: 0, y: 0, width: 800, height: 800))
        v.backgroundColor = .black
        scroll.addSubview(v)
        return scroll
    }
    func updateUIView(_ uiView: UIScrollView, context: Context) {}
}

struct UIKitTableViewDemo: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> UITableViewController {
        class VC: UITableViewController {
            let data = (1...20).map { "Row \($0)" }
            override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { data.count }
            override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
                let c = UITableViewCell(style: .default, reuseIdentifier: nil)
                c.textLabel?.text = data[indexPath.row]
                return c
            }
        }
        return VC()
    }
    func updateUIViewController(_ uiViewController: UITableViewController, context: Context) {}
}

struct UIKitCollectionViewDemo: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> UIViewController {
        class DS: NSObject, UICollectionViewDataSource {
            func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int { 12 }
            func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
                cell.contentView.backgroundColor = .lightGray
                cell.contentView.layer.cornerRadius = 12
                return cell
            }
        }
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 140, height: 100)
        layout.minimumInteritemSpacing = 12
        layout.minimumLineSpacing = 12
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        let ds = DS()
        cv.dataSource = ds
        let vc = UIViewController()
        vc.view = cv
        objc_setAssociatedObject(vc, "ds", ds, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        return vc
    }
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {}
}

struct UIKitVisualEffectDemo: UIViewRepresentable {
    func makeUIView(context: Context) -> UIVisualEffectView {
        UIVisualEffectView(effect: UIBlurEffect(style: .dark))
    }
    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {}
}

struct UIKitBlurEffectDemo: UIViewRepresentable {
    func makeUIView(context: Context) -> UILabel {
        let l = UILabel()
        l.text = "UIBlurEffect is a value type; see VisualEffectView demo."
        l.numberOfLines = 0
        l.textAlignment = .center
        return l
    }
    func updateUIView(_ uiView: UILabel, context: Context) {}
}

struct UIKitNavigationBarDemo: UIViewRepresentable {
    func makeUIView(context: Context) -> UINavigationBar {
        let nav = UINavigationBar()
        nav.items = [UINavigationItem(title: "Title")]
        return nav
    }
    func updateUIView(_ uiView: UINavigationBar, context: Context) {}
}

struct UIKitBarButtonItemDemo: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> UIViewController {
        let vc = UIViewController()
        vc.title = "BarButtonItem"
        let nav = UINavigationController(rootViewController: vc)
        vc.navigationItem.rightBarButtonItem = UIBarButtonItem(systemItem: .add)
        return nav
    }
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {}
}

struct UIKitAlertControllerDemo: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> UIViewController {
        let vc = UIViewController()
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            let alert = UIAlertController(title: "Hello", message: "UIAlertController on tvOS", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            vc.present(alert, animated: true)
        }
        return vc
    }
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {}
}

struct UIMenuDemo: UIViewRepresentable {
    func makeUIView(context: Context) -> UIButton {
        let button = UIButton(type: .system)
        button.setTitle("Show UIMenu", for: .normal)
        if #available(tvOS 15.0, *) {
            let menu = UIMenu(title: "Menu", children: [
                UIAction(title: "First") { _ in },
                UIAction(title: "Second") { _ in }
            ])
            button.menu = menu
            button.showsMenuAsPrimaryAction = true
        }
        return button
    }
    func updateUIView(_ uiView: UIButton, context: Context) {}
}

struct UIKitKeyCommandDemo: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> UIViewController {
        class VC: UIViewController {
            override var keyCommands: [UIKeyCommand]? {
                [UIKeyCommand(input: UIKeyCommand.inputLeftArrow, modifierFlags: [], action: #selector(handleMove))]
            }
            @objc func handleMove() {}
        }
        return VC()
    }
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {}
}

struct UIKitTapGestureDemo: UIViewRepresentable {
    class Coordinator {
        @objc func tap() {}
    }
    func makeCoordinator() -> Coordinator { Coordinator() }
    func makeUIView(context: Context) -> UIView {
        let v = UIView()
        v.backgroundColor = .gray
        let g = UITapGestureRecognizer(target: context.coordinator, action: #selector(Coordinator.tap))
        v.addGestureRecognizer(g)
        return v
    }
    func updateUIView(_ uiView: UIView, context: Context) {}
}

struct UIKitPanGestureDemo: UIViewRepresentable {
    func makeUIView(context: Context) -> UIView {
        let v = UIView()
        let g = UIPanGestureRecognizer()
        v.addGestureRecognizer(g)
        v.backgroundColor = .gray
        return v
    }
    func updateUIView(_ uiView: UIView, context: Context) {}
}

struct UIKitLongPressGestureDemo: UIViewRepresentable {
    func makeUIView(context: Context) -> UIView {
        let v = UIView()
        let g = UILongPressGestureRecognizer()
        v.addGestureRecognizer(g)
        v.backgroundColor = .gray
        return v
    }
    func updateUIView(_ uiView: UIView, context: Context) {}
}

struct UIKitScreenDemo: UIViewRepresentable {
    func makeUIView(context: Context) -> UILabel {
        let s = UIScreen.main.bounds.size
        let l = UILabel()
        l.text = "Screen: \(Int(s.width))x\(Int(s.height))"
        l.textAlignment = .center
        return l
    }
    func updateUIView(_ uiView: UILabel, context: Context) {}
}

struct UIKitDeviceDemo: UIViewRepresentable {
    func makeUIView(context: Context) -> UILabel {
        let l = UILabel()
        l.text = "Device: \(UIDevice.current.model)"
        l.textAlignment = .center
        return l
    }
    func updateUIView(_ uiView: UILabel, context: Context) {}
}

struct UIKitBezierPathDemo: UIViewRepresentable {
    func makeUIView(context: Context) -> UIView {
        let v = DemoDrawingView()
        v.backgroundColor = .black
        return v
    }
    func updateUIView(_ uiView: UIView, context: Context) {}
    class DemoDrawingView: UIView {
        override func draw(_ rect: CGRect) {
            let p = UIBezierPath(roundedRect: rect.insetBy(dx: 20, dy: 20), cornerRadius: 24)
            UIColor.systemBlue.setStroke()
            p.lineWidth = 4
            p.stroke()
        }
    }
}

struct CAShapeLayerDemo: UIViewRepresentable {
    func makeUIView(context: Context) -> UIView {
        let v = UIView()
        let layer = CAShapeLayer()
        layer.path = UIBezierPath(roundedRect: CGRect(x: 20, y: 20, width: 200, height: 100), cornerRadius: 16).cgPath
        layer.fillColor = UIColor.clear.cgColor
        layer.strokeColor = UIColor.systemBlue.cgColor
        layer.lineWidth = 3
        v.layer.addSublayer(layer)
        return v
    }
    func updateUIView(_ uiView: UIView, context: Context) {}
}

struct CAGradientLayerDemo: UIViewRepresentable {
    func makeUIView(context: Context) -> UIView {
        let v = UIView()
        let g = CAGradientLayer()
        g.colors = [UIColor.systemBlue.cgColor, UIColor.systemTeal.cgColor]
        g.frame = CGRect(x: 0, y: 0, width: 400, height: 160)
        v.layer.addSublayer(g)
        v.frame = g.frame
        return v
    }
    func updateUIView(_ uiView: UIView, context: Context) {}
}

struct CALayerDemo: UIViewRepresentable {
    func makeUIView(context: Context) -> UIView {
        let v = UIView()
        v.layer.cornerRadius = 20
        v.layer.borderWidth = 3
        v.layer.borderColor = UIColor.systemGray.cgColor
        v.backgroundColor = .black
        v.frame = CGRect(x: 0, y: 0, width: 320, height: 120)
        return v
    }
    func updateUIView(_ uiView: UIView, context: Context) {}
}

struct UIHostingControllerDemo: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> UIViewController {
        UIHostingController(rootView: Text("Inside UIHostingController"))
    }
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {}
}

struct UINavigationControllerDemo: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> UINavigationController {
        let root = UIViewController()
        root.title = "Root"
        root.view.backgroundColor = .black
        return UINavigationController(rootViewController: root)
    }
    func updateUIViewController(_ uiViewController: UINavigationController, context: Context) {}
}

struct UITabBarControllerDemo: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> UITabBarController {
        let a = UIViewController()
        a.tabBarItem = UITabBarItem(title: "A", image: UIImage(systemName: "a.circle"), tag: 0)
        let b = UIViewController()
        b.tabBarItem = UITabBarItem(title: "B", image: UIImage(systemName: "b.circle"), tag: 0)
        let t = UITabBarController()
        t.viewControllers = [a, b]
        return t
    }
    func updateUIViewController(_ uiViewController: UITabBarController, context: Context) {}
}

struct UIPopoverPresentationDemo: UIViewRepresentable {
    func makeUIView(context: Context) -> UILabel {
        let l = UILabel()
        l.text = "Use UIViewController + popoverPresentationController in real app"
        l.numberOfLines = 0
        l.textAlignment = .center
        return l
    }
    func updateUIView(_ uiView: UILabel, context: Context) {}

    // func makeUIView(context: Context) -> UIView {
    //     let view = UIView()
    //     let vc = UIViewController()
    //     vc.view = view

    //     let contentVC = UIPopoverContentViewController()
    //     contentVC.modalPresentationStyle = .popover

    //     // 取得 popoverPresentationController
    //     if let popover = contentVC.popoverPresentationController {
    //         popover.sourceView = sender
    //         popover.sourceRect = sender.bounds
    //         popover.permittedArrowDirections = .any
    //         popover.delegate = self
    //     }

    //     // 在 iPhone 上用 .popover 時，需要這個設定才能顯示為 popover 而不是 fullScreen
    //     // contentVC.preferredContentSize = CGSize(width: 200, height: 150)

    //     // present(contentVC, animated: true, completion: nil)


    //     // Use UIPopoverPresentationController which is available on tvOS
    //     // let popover = vc.popoverPresentationController
    //     // popover?.sourceView = view
    //     // popover?.sourceRect = CGRect(x: 100, y: 100, width: 200, height: 200)
    //     return view
    // }
    // func updateUIView(_ uiView: UIView, context: Context) {}
}

struct UIPresentationControllerDemo: UIViewRepresentable {
    func makeUIView(context: Context) -> UILabel {
        let l = UILabel()
        l.text = "Custom UIPresentationController requires VC hierarchy"
        l.numberOfLines = 0
        l.textAlignment = .center
        return l
    }
    func updateUIView(_ uiView: UILabel, context: Context) {}
}

struct UIModalStyleDemo: UIViewRepresentable {
    func makeUIView(context: Context) -> UILabel {
        let l = UILabel()
        l.text = "UIModalPresentationStyle demonstrated via controller.present(...)"
        l.numberOfLines = 0
        l.textAlignment = .center
        return l
    }
    func updateUIView(_ uiView: UILabel, context: Context) {}
}

struct UIStatusBarStyleDemo: UIViewRepresentable {
    func makeUIView(context: Context) -> UILabel {
        let l = UILabel()
        l.text = "Status bar style is managed by VC & Info.plist"
        l.numberOfLines = 0
        l.textAlignment = .center
        return l
    }
    func updateUIView(_ uiView: UILabel, context: Context) {}
}

struct UIEdgeInsetsDemo: UIViewRepresentable {
    func makeUIView(context: Context) -> UILabel {
        let inset = UIEdgeInsets(top: 10, left: 20, bottom: 10, right: 20)
        let l = UILabel()
        l.text = "UIEdgeInsets: \(Int(inset.top)),\(Int(inset.left)),\(Int(inset.bottom)),\(Int(inset.right))"
        l.textAlignment = .center
        l.numberOfLines = 0
        return l
    }
    func updateUIView(_ uiView: UILabel, context: Context) {}
}
