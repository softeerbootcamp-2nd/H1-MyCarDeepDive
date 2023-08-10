package com.h1.mycardeepdive.options.service;

import com.h1.mycardeepdive.options.domain.repository.OptionsRepository;
import com.h1.mycardeepdive.options.mapper.OptionsMapper;
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

    }
}
