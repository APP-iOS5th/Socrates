//
//  ImageSave.swift
//  KnowYourselfApp
//
//  Created by seokyung on 6/13/24.
//

import UIKit
import Photos

class ImageSave: NSObject {

    private var isPermissionDenied = false
    private var imageSavedHandler: (() -> Void)?
    private var viewController: UIViewController?
    
    // 이미지 저장
    func saveImage(_ image: UIImage, target: UIViewController? = nil, handler: (() -> Void)? = nil) {
        imageSavedHandler = handler
        viewController = target
        
        isPermissionDenied = checkPhotoPermission()
        
        // PNG 형식으로 변환 후 다시 UIImage로 변환
        if let pngData = image.pngData(),
           let pngImage = UIImage(data: pngData) {
            UIImageWriteToSavedPhotosAlbum(pngImage,
                                           self,
                                           #selector(imageSaved(image:didFinishSavingWithError:contextInfo:)),
                                           nil)
        } else {
            NSLog("Failed to convert image to PNG.")
        }
    }
    
    @objc func imageSaved(image: UIImage, didFinishSavingWithError error: Error?, contextInfo: UnsafeRawPointer) {
        if let error = error {
            NSLog("Failed to save image. Error = \(error.localizedDescription)")
            if isPermissionDenied, let vc = viewController {
                presentPhotoPermissionAlert(vc)
            }
        } else {
            imageSavedHandler?()
        }
    }
    
    // 권한 체크
    private func checkPhotoPermission() -> Bool {
        var status: PHAuthorizationStatus = .notDetermined
        if #available(iOS 14, *) {
            status = PHPhotoLibrary.authorizationStatus(for: .addOnly)
        } else {
            status = PHPhotoLibrary.authorizationStatus()
        }
        return status == .denied
    }
    
    // 권한요청 알림
    private func presentPhotoPermissionAlert(_ vc: UIViewController) {
        let alert = UIAlertController(title: "사진 권한 거부됨",
                                      message: "이미지를 저장하려면 설정에서 사진 접근 권한을 허용해주세요.",
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "취소", style: .cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "설정", style: .default, handler: { _ in
            if let url = URL(string: UIApplication.openSettingsURLString) {
                UIApplication.shared.open(url)
            }
        }))
        vc.present(alert, animated: true, completion: nil)
    }
}
