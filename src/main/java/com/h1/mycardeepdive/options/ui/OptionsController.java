package com.h1.mycardeepdive.options.ui;

import com.h1.mycardeepdive.global.response.ApiResponse;
import com.h1.mycardeepdive.options.service.OptionsService;
import io.swagger.v3.oas.annotations.tags.Tag;
import java.util.List;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequiredArgsConstructor
@RequestMapping("/api/v1/wheel-options")
public class OptionsController {
    private final OptionsService optionsService;

    }
}
