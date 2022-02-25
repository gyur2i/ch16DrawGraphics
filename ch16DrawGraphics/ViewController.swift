//
//  ViewController.swift
//  ch16DrawGraphics
//
//  Created by 김규리 on 2022/01/27.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet var imgView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnDrawLine(_ sender: UIButton) {
        UIGraphicsBeginImageContext(imgView.frame.size)// 콘텍스트를 이미지 뷰의 크기와 같게 생성
        let context = UIGraphicsGetCurrentContext()! // 생성한 콘텍스트의 정보를 가져옴
        
        // Draw Line : 콘텍스트에 대한 설정
        context.setLineWidth(2.0) // 선의 굵기
        context.setStrokeColor(UIColor.red.cgColor) // 선 색상
        
        context.move(to: CGPoint(x: 70, y: 50)) // 시작 위치 지정
        context.addLine(to: CGPoint(x: 270, y: 250)) // 여기까지 선을 추가
        
        context.strokePath() // 추가한 경로를 콘텍스트에 그림
        
        // Draw Triangle
        context.setLineWidth(4.0) // 선 굵기
        context.setStrokeColor(UIColor.blue.cgColor) // 선 색상
        
        context.move(to: CGPoint(x: 170, y: 200)) // 시작 위치
        context.addLine(to: CGPoint(x: 270, y: 350))
        context.addLine(to: CGPoint(x: 70, y: 350))
        context.addLine(to: CGPoint(x: 170, y: 200)) // 다시 돌아옴
        context.strokePath()
        
        imgView.image = UIGraphicsGetImageFromCurrentImageContext() // 현재 그려진 이미지를 가지고 와서 이미지 뷰에 나타냄
        UIGraphicsEndImageContext() // 그림 그리기 끝내기
        
    }
    
    @IBAction func btnDrawRectangle(_ sender: UIButton) {
        UIGraphicsBeginImageContext(imgView.frame.size)// 콘텍스트를 이미지 뷰의 크기와 같게 생성
        let context = UIGraphicsGetCurrentContext()! // 생성한 콘텍스트의 정보를 가져옴
        
        // Draw Rectangle
        context.setLineWidth(2.0) // 선 굵기
        context.setStrokeColor(UIColor.red.cgColor) // 선 색상
        
        context.addRect(CGRect(x:70, y:100, width:200, height:200)) // 7,10에서 시작
        context.strokePath()
        
        imgView.image = UIGraphicsGetImageFromCurrentImageContext() // 현재 그려진 이미지를 가지고 와서 이미지 뷰에 나타냄
        UIGraphicsEndImageContext() // 그림 그리기 끝내기
    }
    
    @IBAction func btnDrawCircle(_ sender: UIButton) {
        UIGraphicsBeginImageContext(imgView.frame.size)// 콘텍스트를 이미지 뷰의 크기와 같게 생성
        let context = UIGraphicsGetCurrentContext()! // 생성한 콘텍스트의 정보를 가져옴
        
        // Draw Ellipse
        context.setLineWidth(2.0) // 선 굵기
        context.setStrokeColor(UIColor.red.cgColor) // 선 색상
        context.addEllipse(in: CGRect(x: 70, y: 50, width: 200, height: 100))
        context.strokePath()
        
        // Draw Circle
        context.setLineWidth(5.0) // 선 굵기
        context.setStrokeColor(UIColor.green.cgColor) // 선 색상
        
        context.addEllipse(in: CGRect(x: 70, y: 200, width: 200, height: 200))
        context.strokePath()
        
        imgView.image = UIGraphicsGetImageFromCurrentImageContext() // 현재 그려진 이미지를 가지고 와서 이미지 뷰에 나타냄
        UIGraphicsEndImageContext() // 그림 그리기 끝내기
    }
    
    @IBAction func btnDrawArc(_ sender: UIButton) {
        UIGraphicsBeginImageContext(imgView.frame.size)// 콘텍스트를 이미지 뷰의 크기와 같게 생성
        let context = UIGraphicsGetCurrentContext()! // 생성한 콘텍스트의 정보를 가져옴
        
        context.setLineWidth(5.0) // 선 굵기
        context.setStrokeColor(UIColor.red.cgColor) // 선 색상
        
        context.move(to: CGPoint(x: 100, y: 50))
        context.addArc(tangent1End: CGPoint(x: 250, y: 50), tangent2End: CGPoint(x: 250, y: 200), radius: CGFloat(50))
        context.addLine(to: CGPoint(x: 250, y: 200))
        
        context.move(to: CGPoint(x: 100, y: 250))
        context.addArc(tangent1End: CGPoint(x: 270, y: 250), tangent2End: CGPoint(x: 100, y: 400), radius: CGFloat(20))
        context.addLine(to: CGPoint(x: 100, y: 400))
        
        context.strokePath()
        
        imgView.image = UIGraphicsGetImageFromCurrentImageContext() // 현재 그려진 이미지를 가지고 와서 이미지 뷰에 나타냄
        UIGraphicsEndImageContext() // 그림 그리기 끝내기
    }

    @IBAction func btnDrawFill(_ sender: UIButton) {
        UIGraphicsBeginImageContext(imgView.frame.size)// 콘텍스트를 이미지 뷰의 크기와 같게 생성
        let context = UIGraphicsGetCurrentContext()! // 생성한 콘텍스트의 정보를 가져옴
        
        // Draw Rectangle
        context.setLineWidth(1.0) // 선 굵기
        context.setStrokeColor(UIColor.red.cgColor) // 선 색상
        context.setFillColor(UIColor.red.cgColor) // 채우기 색상
        
        let rectangle = CGRect(x:70, y:50, width:200, height:100)
        context.addRect(rectangle)
        context.fill(rectangle)
        context.strokePath()
        
        // Draw Circle
        context.setLineWidth(1.0) // 선 굵기
        context.setStrokeColor(UIColor.blue.cgColor) // 선 색상
        context.setFillColor(UIColor.blue.cgColor) // 채우기 색상
        
        let circle = CGRect(x:70, y:200, width:200, height:100)
        context.addEllipse(in: circle)
        context.fillEllipse(in: circle)
        context.strokePath()
        
        
        // Draw Triangle
        context.setLineWidth(1.0) // 선 굵기
        context.setStrokeColor(UIColor.green.cgColor) // 선 색상
        context.setFillColor(UIColor.green.cgColor) // 채우기 색상
        
        context.move(to: CGPoint(x: 170, y: 350))
        context.addLine(to: CGPoint(x: 270, y: 450))
        context.addLine(to: CGPoint(x: 70, y: 450))
        context.addLine(to: CGPoint(x: 170, y: 350))
        context.fillPath()
        context.strokePath()

        imgView.image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
    }
    
}

