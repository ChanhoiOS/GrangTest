import UIKit

open class ScreenProtect {
    
    public static func guardScreen(_ window: UIWindow?, _ hide: Bool) {
        var backgroundView: UIView = {
            let background = UIView()
            background.frame = UIScreen.main.bounds
            background.tag = -101
            background.backgroundColor = .black
            return background
        }()
        
        let bgView = window?.rootViewController?.view.window?.viewWithTag(-101)
        
        if hide {
            guard let rootView = window?.rootViewController?.view.window else { return }
            
            if let presentedVC = rootView.rootViewController?.presentedViewController, presentedVC is UIImagePickerController {
                return
            }
            
            if bgView == nil {
                window?.rootViewController?.view.window?.addSubview(backgroundView)
            }
        } else {
            if let bgView = bgView {
                bgView.removeFromSuperview()
            }
        }
    }
}
