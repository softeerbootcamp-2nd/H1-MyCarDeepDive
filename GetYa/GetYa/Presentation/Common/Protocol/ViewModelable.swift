//
//  ViewModelable.swift
//  GetYa
//
//  Created by 양승현 on 2023/08/05.
//

import Combine

/**
 ViewController에 Undirectional 데이터 흐름을 위한 바인딩
 
 - associatedtype Input:  ViewController로부터 발생되는 event
 - associatedtype State: UI component를 (render)업데이트 해야 할 상태 지정
 - associatedtype Output: ViewController에게 UI component관련 상태 변경을 전달
 */
protocol ViewModelable {
    associatedtype Input
    associatedtype State
    associatedtype Output
    
    /// ViewController로부터 발생된 event를 transform(input:)의 Input 매개변수로 전달합니다.
    /// ViewModel에서 Input에 대한 로직 처리 후 뷰에게 화면을 업데이트 하도록 Output을 통해 전달합니다.
    func transform(input: Input) -> Output
}
