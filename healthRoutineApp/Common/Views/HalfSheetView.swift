//
//  HalfSheetView.swift
//  healthRoutineApp
//
//  Created by geonhui Yu on 2023/01/31.
//

import SwiftUI

struct HalfSheetView: View {
    
    @State var showSheet: Bool = false
    
    var body: some View {
        
        Button {
            
            showSheet.toggle()
            
        } label: {
            
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            
        }
        .halfSheet(showSheet: $showSheet) {
            
            ZStack {
                
                Color.red
                
                Text("Test")
            }
            .ignoresSafeArea()
            
            
        } onEnd: {
            print("Dismiss")
        }
    }
}

struct HalfSheetView_Previews: PreviewProvider {
    static var previews: some View {
        HalfSheetView()
    }
}

extension View {
    
    func halfSheet<SheetView: View>(showSheet: Binding<Bool>,
                                    @ViewBuilder sheetView: @escaping () -> SheetView,
                                    onEnd: @escaping () -> ()) -> some View {
        
        return self
            .background(HalfSheetHelper(sheetView: sheetView(), showSheet: showSheet, onEnd: onEnd))
    }
}

struct HalfSheetHelper<SheetView: View>: UIViewControllerRepresentable {
    
    var sheetView: SheetView
    @Binding var showSheet: Bool
    
    var onEnd: () -> ()
    
    let controller = UIViewController()
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(parent: self)
    }
    
    func makeUIViewController(context: Context) -> some UIViewController {
        
        controller.view.backgroundColor = .clear
        return controller
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
        if showSheet {
            
            let sheetController = CustomHostingController(rootView: sheetView)
            sheetController.presentationController?.delegate = context.coordinator
            uiViewController.present(sheetController, animated: true)
            
        } else {
            
            uiViewController.dismiss(animated: true)
        }
    }
    
    class Coordinator: NSObject, UISheetPresentationControllerDelegate {
        
        var parent: HalfSheetHelper
        
        init(parent: HalfSheetHelper) {
            self.parent = parent
        }
        
        func presentationControllerDidDismiss(_ presentationController: UIPresentationController) {
            
            parent.showSheet = false
            parent.onEnd()
        }
    }
}

class CustomHostingController<Content: View>: UIHostingController<Content> {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .clear
        
        if let presentationController = presentationController as? UISheetPresentationController {
            
            presentationController.detents = [.medium(), .medium()]
            
            presentationController.prefersGrabberVisible = true
        }
    }
}
