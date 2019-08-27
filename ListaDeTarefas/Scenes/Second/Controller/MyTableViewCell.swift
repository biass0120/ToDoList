    //
    //  MyTableViewCell.swift
    //  ListaDeTarefas
    //
    //  Created by bianca.dos.s.sobral on 13/08/19.
    //  Copyright © 2019 bianca.dos.s.sobral. All rights reserved.
    //

    import UIKit

    class MyTableViewCell: UITableViewCell {
       
        @IBOutlet weak var titleLabel: UILabel!
        
        
        override func awakeFromNib() {
            super.awakeFromNib()
            // Initialization code
        }

        func setupCell(with task: Task) {
            titleLabel.text = task.title
        }
        
        override func setSelected(_ selected: Bool, animated: Bool) {
            super.setSelected(selected, animated: animated)

            // Configure the view for the selected state
        }
        
    }
