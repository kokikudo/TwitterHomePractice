//
//  TableViewCell.swift
//  TwitterHomePractice
//
//  Created by kudo koki on 2021/03/17.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var time: UILabel!
    @IBOutlet weak var content: UILabel!
    
    
    @IBAction func actionButton(_ sender: Any) {
        guard let button = sender as? UIButton else { return }
        
        switch button.tag {
        case 1:
            print("リプライボタンが押されました。")
        case 2:
            print("リツイートボタンが押されました。")
        case 3:
            print("いいねボタンが押されました。")
        case 4:
            print("共有ボタンが押されました。")
        default:
            print("Error: どのボタンが押されたかわかりません。")
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
