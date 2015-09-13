//
//  ViewController.swift
//  camera
//
//  Created by Hidemi Ando on 2015/09/06.
//  Copyright (c) 2015年 Hidemi Ando. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate{

    var imageView : UIImageView? = nil
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //ページのタイトル
        self.title = "camera"
        
        //画面表示の設定
        imageView = UIImageView(frame:
            CGRectMake(0, 0, self.view.frame.width, self.view.frame.height))
        
        self.view.addSubview(imageView!)
        
        //右ボタン（カメラ）を生成する
        let rightButton = UIBarButtonItem(barButtonSystemItem: .Camera, target: self, action: "selectPhoto:")
        
        self.navigationItem.rightBarButtonItem = rightButton
        
    }
    func selectPhoto(sender:AnyObject){
        let ipc:UIImagePickerController = UIImagePickerController()
        
        ipc.delegate = self
        ipc.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        
        self.presentViewController(ipc, animated:true, completion:nil)
    
        
            }
}
    


