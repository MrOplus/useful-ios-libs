
import UIKit

class Triangle: UIView {
    override func draw(_ rect: CGRect) {
        let height = self.layer.frame.size.height
        let width = self.layer.frame.size.width

        // draw the triangle
        let path = UIBezierPath()
        path.move(to: .zero)
        path.addLine(to: CGPoint(x: width, y: 0))
        path.addLine(to: CGPoint(x: 0, y: height))
        path.close()

        // add path to layer
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = path.cgPath
        
        shapeLayer.fillColor = UIColor(hexFromString: "#ff0303",alpha : 0.8).cgColor
        shapeLayer.lineWidth = 1.0

        let tagLabel = UILabel(frame: CGRect(x: 0, y: 0, width: width / 2 + 5, height: height / 2 + 5))
        tagLabel.transform = CGAffineTransform(rotationAngle: -.pi / 4)
        tagLabel.numberOfLines = 1 // 0
        tagLabel.lineBreakMode = .byWordWrapping
        tagLabel.adjustsFontSizeToFitWidth = true;
        tagLabel.minimumScaleFactor = 0.5
        tagLabel.text = ["Test1","Test2","Test3"].randomElement()
        tagLabel.textColor = UIColor(hexFromString: "#ffffff")
        tagLabel.backgroundColor = .clear
        self.layer.addSublayer(shapeLayer)
        self.addSubview(tagLabel)
    }
}

extension UIColor {
    convenience init(hexFromString:String, alpha:CGFloat = 1.0) {
        var cString:String = hexFromString.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        var rgbValue:UInt32 = 10066329 //color #999999 if string has wrong format

        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }

        if ((cString.count) == 6) {
            Scanner(string: cString).scanHexInt32(&rgbValue)
        }

        self.init(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: alpha
        )
    }
}
