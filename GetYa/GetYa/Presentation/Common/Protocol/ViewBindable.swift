//
//  ViewBindable.swift
//  GetYa
//
//  Created by 양승현 on 2023/08/05.
//

/// UIView나 UIViewController에서 준수하면 ViewModel과 바인딩할 때 편하게 사용될 수 있습니다.
protocol ViewBindable {
    associatedtype Input
    associatedtype State
    associatedtype ErrorType
    
    func bind()
    func render(_ state: State)
    func handleError(_ error: ErrorType)
}

extension ViewBindable {
    func handleError(_ error: ErrorType) { }
}
