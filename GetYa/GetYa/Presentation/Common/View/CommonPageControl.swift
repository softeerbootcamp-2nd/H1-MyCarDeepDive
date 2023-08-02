//
//  CommonPageControl.swift
//  GetYa
//
//  Created by 배남석 on 2023/08/02.
//

import UIKit

class CommonPageControl: UIPageControl {
    // MARK: - UI Properties
    
    // MARK: - Properties
    
    // MARK: - LifeCycles
    convenience init(numberOfPages: Int) {
        self.init(frame: .zero)
        self.numberOfPages = numberOfPages
    }
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureUI()
    }
    
    // MARK: - Functions
    private func configureUI() {
        self.isUserInteractionEnabled = false
        self.currentPage = 0
        
        //TODO: Color 변경
        self.currentPageIndicatorTintColor = UIColor(hexString: "2197C9")
    }
}
