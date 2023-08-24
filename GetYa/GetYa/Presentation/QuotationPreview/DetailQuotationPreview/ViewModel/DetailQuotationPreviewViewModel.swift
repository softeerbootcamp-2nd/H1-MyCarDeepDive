//
//  DetailQuotationPreviewViewModel.swift
//  GetYa
//
//  Created by 양승현 on 2023/08/09.
//

import Foundation
import Combine

// MARK: - View Model
struct QuotationPreviewCarInfoModel {
    var carName: String
    var trimName: String
    var carPrice: String
    var carOptions: String
}

struct QuotationPreviewMainHeaderModel {
    var thumbnailKeywords: [String]
    var recommendCarProductOption: QuotationPreviewCarInfoModel
    var firstSectionTitle: String
    var thumbnailUrl: String
    
    init(
        thumbnailKeywords: [String] = [],
        recommendCarProductOption: QuotationPreviewCarInfoModel = .init(
            carName: "",
            trimName: "",
            carPrice: "",
            carOptions: ""),
        firstSectionTitle: String = "",
        thumbnailUrl: String = ""
    ) {
        self.thumbnailKeywords = thumbnailKeywords
        self.recommendCarProductOption = recommendCarProductOption
        self.firstSectionTitle = firstSectionTitle
        self.thumbnailUrl = thumbnailUrl
    }
}

final class DetailQuotationPreviewViewModel: CommonQuotationPreviewTableViewModel {
    // MARK: - Input
    struct DetailQuotationPreviewInput {
        let viewDidLoadEvent: AnyPublisher<Void, Never>
        let customButtonEvent: AnyPublisher<Void, Never>
        let quickQuoteEvent: AnyPublisher<Void, Never>
    }
    
    // MARK: - Output state
    enum DetailQuotationPreviewState {
        case none
        case updateDetailQuotationPreview
        case gotoCustomPage(TrimCarSpec)
        case gotoCompletionPage(AdditionalTrimCarSpec)
    }
    
    // MARK: - Dependencies
    private let quotationUseCase: QuotationUseCase!
    
    // MARK: - Properties
    private var mainSectionHeader = QuotationPreviewMainHeaderModel()
    private var sectionHeaders: [String] = []
    private var secondSectionFooter: String = "데이터 불러오는 중입니다."
    private var quotationTrimCarSpec = TrimCarSpec(
        engineId: 0,
        bodyId: 0,
        drivingSystemId: 0)
    private var subscriptions = Set<AnyCancellable>()

    // MARK: - Lifecycles
    init(keywords: [String], quotationUseCase: QuotationUseCase) {
        self.quotationUseCase = quotationUseCase
        mainSectionHeader.thumbnailKeywords = keywords
        sectionHeaders = QuotationPreviewHeaderTitleList.lists
        super.init(dataSource: [[]])
    }
}

// MARK: - CharacterSelectSuccessViewModelable
extension DetailQuotationPreviewViewModel: DetailQuotationPreviewViewModelable {
    func transform(input: Input) -> Output {
        return Publishers.MergeMany(
            customButtonEventChains(input),
            quickQuoteEventChains(input),
            viewDidLoadChains(input),
            updateQuotationPreview()
        ).eraseToAnyPublisher()
    }
}

// MARK: - CharacterSelectSuccessViewModelable private function
private extension DetailQuotationPreviewViewModel {
    
    func updateQuotationPreview() -> Output {
        return quotationUseCase
            .carQuotation
            .map { [weak self] quotationModel -> State in
                let carOptions = [
                    quotationModel.engineName,
                    quotationModel.drivingSystemName,
                    quotationModel.bodyName
                ].joined(separator: " ・ ")
                self?.quotationTrimCarSpec = TrimCarSpec(
                    engineId: quotationModel.engineId,
                    bodyId: quotationModel.bodyId,
                    drivingSystemId: quotationModel.drivingSystemId)
                let recommendCarProductOption = QuotationPreviewCarInfoModel(
                    carName: "펠리세이드",
                    trimName: quotationModel.trimName,
                    carPrice: quotationModel.trimPrice.toPriceFormat+"원",
                    carOptions: carOptions)
                self?.mainSectionHeader.recommendCarProductOption = recommendCarProductOption
                self?.mainSectionHeader.firstSectionTitle = "색상"
                self?.mainSectionHeader.thumbnailUrl = quotationModel.carImgUrl
                self?.secondSectionFooter = quotationModel.totalPrice.toPriceFormat+"원"
                let exteriorColor = quotationModel.exteriorColor
                let interiorColor = quotationModel.interiorColor
                
                let optionList: [[OptionInfo]] = [
                    [.init(optionID: exteriorColor.colorId,
                           optionName: exteriorColor.colorName,
                           optionImageURL: exteriorColor.colorIconUrl,
                           optionPrice: exteriorColor.colorPrice,
                           optionComment: exteriorColor.colorComment),
                     .init(optionID: interiorColor.colorId,
                           optionName: interiorColor.colorName,
                           optionImageURL: interiorColor.colorIconUrl,
                           optionPrice: interiorColor.colorPrice,
                           optionComment: interiorColor.colorComment)],
                    quotationModel.options,
                    quotationModel.packages]
                    self?.setDataSource(with: optionList)
                return .updateDetailQuotationPreview
            }.eraseToAnyPublisher()
    }
    
    func customButtonEventChains(_ input: Input) -> Output {
        return input.customButtonEvent
            .map { _ -> State in
                return .gotoCustomPage(self.quotationTrimCarSpec)
            }
            .eraseToAnyPublisher()
    }
    
    // 서버에서 받아와서 업데이트?!
    func quickQuoteEventChains(_ input: Input) -> Output {
        return input.quickQuoteEvent
            .map { _ -> State in
                return .gotoCompletionPage(
                    .init(trimCarSpec: self.quotationTrimCarSpec,
                          aditoinalOptionIdList: []))
            }
            .eraseToAnyPublisher()
    }
    
    func viewDidLoadChains(_ input: Input) -> Output {
        return input.viewDidLoadEvent
            .map { [weak self] _ -> State in
                self?.quotationUseCase.fetchCarQuotation()
                return .none
            }
            .eraseToAnyPublisher()
    }
}

// MARK: - CharacterSSTableViewAdapterDataSource
extension DetailQuotationPreviewViewModel: DetailQuotationPreviewAdapterDataSource {
    var lastSectionHeaderItem: String {
        sectionHeaders[2]
    }
    
    var lastSectionFooterItem: String {
        secondSectionFooter
    }
    
    var mainSectionHeaderItem: QuotationPreviewMainHeaderModel {
        mainSectionHeader
    }
    
    var secondSectionHeaderItem: String {
        sectionHeaders[1]
    }
}
