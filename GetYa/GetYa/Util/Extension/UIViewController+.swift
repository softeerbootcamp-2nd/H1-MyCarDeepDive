//
//  UIViewController+.swift
//  GetYa
//
//  Created by 배남석 on 2023/08/17.
//

import UIKit

extension UIViewController {
    func showAlert(
        type: AlertType,
        buttonType: AlertButtonType,
        leftTitle: String = "아니요",
        rightTitle: String = "네",
        leftButtonHandler: (() -> Void)? = nil,
        rightButtonHandler: (() -> Void)? = nil
    ) {
        let alertViewController = AlertViewController()
        
        if buttonType == .twoButton {
            alertViewController.setLeftButtonAction(
                title: leftTitle,
                handler: {
                    self.dismiss(animated: false, completion: leftButtonHandler)
                })
        }
        alertViewController.setRightButtonAction(
            title: rightTitle,
            handler: {
                self.dismiss(animated: false, completion: rightButtonHandler)
            })
        alertViewController.modalPresentationStyle = .overFullScreen
        
        switch type {
        case .title(let title):
            alertViewController.setTitle(text: title)
        case .message(let title, let description):
            alertViewController.setTitle(text: title)
            alertViewController.setDescription(text: description)
        case .share(let pdfID):
            let urlString = "https://make-my-car.shop/mycar/result/\(pdfID)"
            alertViewController.setTitle(text: "공유하기")
            alertViewController.setDescription(
                text: "구성하신 견적이 URL로 생성되었어요.\n아래 URL을 공유하시면 견적을 다시 확인하실 수 있어요.\n(30일간 유효)")
            alertViewController.setTextField(placeHolder: urlString, isEnaled: false)
            alertViewController.setRightButtonAction(
                title: rightTitle,
                handler: {
                    self.dismiss(animated: false, completion: {
                        let activityVC = UIActivityViewController(
                            activityItems: [MyActivityItemSource(
                                title: "내 차 만들기 견적을 공유합니다.",
                                text: urlString)],
                            applicationActivities: nil)
                        activityVC.popoverPresentationController?.sourceView = self.view
                        activityVC.popoverPresentationController?.sourceRect = CGRect(
                            x: self.view.bounds.midX,
                            y: self.view.bounds.midY,
                            width: 0,
                            height: 0)

                        self.present(activityVC, animated: true)
                    })
                })
        case .mail:
            alertViewController.setTitle(text: "메일 주소를 알려주세요")
            alertViewController.setDescription(text: "해당 주소로 만들어진 내 차를 보내드립니다.")
            alertViewController.setTextField(placeHolder: "example@mail.com", isEnaled: true)
            alertViewController.setRightButtonAction(
                title: rightTitle,
                handler: {
                    self.dismiss(animated: false, completion: {
                        let text = alertViewController.textField.text ?? ""
                        
                        NotificationCenter.default.post(
                            name: Notification.Name("AlertEmail"),
                            object: nil,
                            userInfo: ["email": text])
                    })
                })
        default:
            break
        }
        
        present(alertViewController, animated: false)
    }
}
