//
//  PermissionManager.swift
//  Instagram
//
//  Created by 황성진 on 1/22/24.
//

import Foundation
import AVFoundation

class PermissionManager : ObservableObject {
    @Published var permissionGranted = false
    
    /**
     * 카메라 권한을 요청합니다.
     */
    func requestCameraPermission() {
        AVCaptureDevice.requestAccess(for: .video, completionHandler: { (granted: Bool) in
            if granted {
                print("Camera: 권한 허용")
            } else {
                print("Camera: 권한 거부")
            }
        })
    }
}
