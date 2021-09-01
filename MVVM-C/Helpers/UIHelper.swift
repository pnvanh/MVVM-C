//
//  UIHelper.swift
//  MVVM-C
//
//  Created by Viet Anh on 01/09/2021.
//

import JGProgressHUD

final class UIHelper {

    static let shared = UIHelper()

    var hub: JGProgressHUD?
}

// MARK: - Loading
extension UIHelper {
    
    func showLoading(_ view: UIView? = nil) {
        let container = view != nil ? view : getVisibleViewController()?.view
        DispatchQueue.main.async { [unowned self] in
            if let container = container {
                if self.hub == nil {
                    self.hub = JGProgressHUD(style: .extraLight)
                    var indicatorView: UIActivityIndicatorView?
                    if #available(iOS 13.0, *) {
                        indicatorView = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.medium)
                    } else {
                        indicatorView = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.gray)
                    }
                    indicatorView?.color = UIColor.gray
                    indicatorView?.startAnimating()
                    self.hub?.indicatorView = JGProgressHUDImageIndicatorView(contentView: indicatorView)
                }
                self.hub?.show(in: container)
            }
        }
    }

    func hideLoading() {
        DispatchQueue.main.async {
            self.hub?.dismiss()
        }
    }
    
    private func getVisibleViewController() -> UIViewController? {
        let sceneDelegate = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate
        let viewController = sceneDelegate?.window?.rootViewController?.visibleViewController
        return viewController
    }
}
