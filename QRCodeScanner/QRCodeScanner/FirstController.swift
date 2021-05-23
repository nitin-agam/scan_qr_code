//
//  FirstController.swift
//  QRCodeScanner
//
//  Created by Nitin Aggarwal on 22/05/21.
//

import UIKit
import SnapKit

class FirstController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
    }
    
    private func initialSetup() {
        view.backgroundColor = .lightGray
        navigationItem.title = "QR Scanner"
        
        let scanButton = UIButton(type: .custom)
        scanButton.setTitle("Scan QR", for: .normal)
        scanButton.backgroundColor = .black
        scanButton.setTitleColor(.white, for: .normal)
        scanButton.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        scanButton.layer.cornerRadius = 5
        scanButton.layer.masksToBounds = true
        scanButton.addTarget(self, action: #selector(scanQRActionHandle), for: .touchUpInside)
        
        view.addSubview(scanButton)
        
        // In this example, using SnapKit library to make constraint but you can use own method.
        scanButton.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.equalTo(120)
            make.height.equalTo(50)
        }
    }
    
    @objc private func scanQRActionHandle() {
        let controller = QRScannerController()
        let navigation = UINavigationController(rootViewController: controller)
        navigation.modalPresentationStyle = .fullScreen
        self.present(navigation, animated: true, completion: nil)
    }
}
