//
//  SaveJpeg.swift
//  KnowYourselfApp
//
//  Created by seokyung on 6/13/24.
//

import UIKit
import Photos

class SaveJpeg: NSObject {

    private var isPermissionDenied = false
    private var imageSavedHandler: (() -> Void)?
    private var viewController: UIViewController?
    
    // 이미지 저장
    func saveImage(_ image: UIImage, target: UIViewController? = nil, handler: (() -> Void)? = nil) {
        imageSavedHandler = handler
        viewController = target
        
        isPermissionDenied = checkPhotoPermission()
        
        // JPEG 형식으로 변환
        if let jpegData = image.jpegData(compressionQuality: 1.0),
           let jpegImage = UIImage(data: jpegData) {
            UIImageWriteToSavedPhotosAlbum(jpegImage,
                                           self,
                                           #selector(imageSaved(image:didFinishSavingWithError:contextInfo:)),
                                           nil)
        } else {
            NSLog("Failed to convert image to JPEG.")
        }
    }
    
    // 이미지 저장 후
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
        let alert = UIAlertController(title: "Photo Access Denied",
                                      message: "To save images, please allow photo access in Settings.",
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "Settings", style: .default, handler: { _ in
            if let url = URL(string: UIApplication.openSettingsURLString) {
                UIApplication.shared.open(url)
            }
        }))
        vc.present(alert, animated: true, completion: nil)
    }
}
