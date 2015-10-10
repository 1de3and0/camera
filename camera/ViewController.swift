//
//  ViewController.swift
//  camera
//
//  Created by Hidemi Ando on 2015/09/06.
//  Copyright (c) 2015年 Hidemi Ando. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
    /// ファイルの保存先
    let directoryPath = NSHomeDirectory().stringByAppendingPathComponent("Documents")
    
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
        
        self.view.backgroundColor = UIColor.whiteColor()
        
    }
    //ボタンを押した時に呼ばれるメソッド(PhotoLibraryから画像をとってくる)
    
    func selectPhoto(sender:AnyObject){
        let ipc:UIImagePickerController = UIImagePickerController()
        
        ipc.delegate = self
        ipc.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        
        self.presentViewController(ipc, animated:true, completion:nil)
        
    }
    //画像をNSLogに変換し、アプリ上のデータに保存する。
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [NSObject : AnyObject]) {
        // if info[UIImagePickerControllerOriginalImage] != nil {
        // imageView!.image = info[UIImagePickerControllerOriginalImage] as? UIImage
        
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
            
            imageView!.image = image
            
            // NSDataに変換
            
            let fileManager = NSFileManager()
            
            let filePath = directoryPath.stringByAppendingPathComponent("image1.png")
            let imageData = UIImagePNGRepresentation(image)
            
            NSLog("image %@", imageData)
             NSLog("image %@", filePath)
            
            
            
            if fileManager.createFileAtPath(filePath, contents: imageData, attributes: nil) {
                //     showAlertMessage("", message: message_succeed)
                
                //     initPaths()
                
                
                
            }
            
            picker.dismissViewControllerAnimated(true, completion: nil);
            
}


    }}













