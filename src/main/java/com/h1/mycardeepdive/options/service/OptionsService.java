package com.h1.mycardeepdive.options.service;

import com.h1.mycardeepdive.options.domain.Options;
import com.h1.mycardeepdive.options.domain.Packages;
import com.h1.mycardeepdive.options.domain.repository.OptionsRepository;
import com.h1.mycardeepdive.options.domain.repository.PackageRepository;
import com.h1.mycardeepdive.options.mapper.OptionMapper;
import com.h1.mycardeepdive.options.ui.dto.*;
import com.h1.mycardeepdive.tags.domain.repository.TagRepository;
import java.util.List;
import java.util.stream.Collectors;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional(readOnly = true)
@RequiredArgsConstructor
@Slf4j
public class OptionsService {

    private final OptionsRepository optionsRepository;

    private final PackageRepository packageRepository;

    private final TagRepository tagRepository;

    public OptionResponse findAllAdditionalOptions(Long carSpecId) {
        List<Packages> packagesList = packageRepository.findPackageOptions(carSpecId);
        List<Options> additionalOptionsList =
                optionsRepository.findAdditionalOptions(carSpecId, packagesList);
        List<PackageOptionResponse> packageOptionResponses =
                packagesList.stream()
                        .map(
                                pkg ->
                                        OptionMapper.optionToPackageOptionResponse(
                                                pkg,
                                                tagRepository.findTagsByPackageId(pkg.getId()),
                                                optionsRepository.findPackageImgUrlFromOption(
                                                        pkg.getId())))
                        .collect(Collectors.toList());
        List<AdditionalOptionResponse> additionalOptionResponses =
                additionalOptionsList.stream()
                        .map(
                                option ->
                                        OptionMapper.optionToAdditionalOptionResponse(
                                                option,
                                                tagRepository.findTagsByOptionId(option.getId())))
                        .collect(Collectors.toList());
        return new OptionResponse(packageOptionResponses, additionalOptionResponses);
    }

    public List<BasicOptionResponse> findAllBasicOptions(Long carSpecId) {
        return optionsRepository.findBasicOptions(carSpecId).stream()
                .map(
                        options ->
                                OptionMapper.optionToBasicOptionResponse(
                                        options, tagRepository.findTagsByOptionId(options.getId())))
                .collect(Collectors.toList());
    }

    @Transactional
    public boolean userClickedOptionLog(Long optionId) {
        return true;
    }

    @Transactional
    public boolean userClickedPackageLog(Long optionId) {
        return true;
    }

    public List<OptionDetailResponse> findPackageOptionDetail(Long optionId) {
        return optionsRepository.findOptionsByPackageId(optionId).stream()
                .map(
                        options ->
                                OptionMapper.optionToOptionDetailResponse(
                                        options, tagRepository.findTagsByOptionId(options.getId())))
                .collect(Collectors.toList());
    }

    public OptionDetailResponse findOptionDetail(Long optionId) {
        Options options = optionsRepository.findById(optionId).orElseThrow();
        return OptionMapper.optionToOptionDetailResponse(
                options, tagRepository.findTagsByOptionId(options.getId()));
    }
}
