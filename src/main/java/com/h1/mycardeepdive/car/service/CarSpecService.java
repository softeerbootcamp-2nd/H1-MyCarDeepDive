package com.h1.mycardeepdive.car.service;

import static com.h1.mycardeepdive.car.mapper.CarSpecMapper.toCarSpecComparisonResponse;
import static com.h1.mycardeepdive.car.mapper.CarSpecMapper.toCarSpecResponse;
import static com.h1.mycardeepdive.car.service.CarSpecService.basicOptions.*;

import com.h1.mycardeepdive.car.domain.CarSpec;
import com.h1.mycardeepdive.car.domain.repository.CarSpecRepository;
import com.h1.mycardeepdive.car.ui.dto.CarSpecComparisonResponse;
import com.h1.mycardeepdive.car.ui.dto.CarSpecInfo;
import com.h1.mycardeepdive.car.ui.dto.CarSpecResponse;
import com.h1.mycardeepdive.exception.ErrorType;
import com.h1.mycardeepdive.exception.MyCarDeepDiveException;
import com.h1.mycardeepdive.trims.domain.Trim;
import java.util.ArrayList;
import java.util.List;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import net.logstash.logback.marker.Markers;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional(readOnly = true)
@RequiredArgsConstructor
@Slf4j
public class CarSpecService {

    private static final String TRIM = "trim";
    private static final long EXCLUSIVE_ID = 1L;
    private static final long LEBLANC_ID = 2L;
    private static final long PRESTIGE_ID = 3L;
    private static final long CALLIGRAPHY_ID = 4L;
    private final CarSpecRepository carSpecRepository;

    public CarSpecResponse findCarSpecsBySpec(Long engineId, Long bodyId, Long drivingSystemId) {
        List<CarSpec> carSpecs =
                carSpecRepository.findByEngineIdAndBodyIdAndDrivingSystemId(
                        engineId, bodyId, drivingSystemId);
        List<CarSpecInfo> carSpecInfos = new ArrayList<>();
        for (CarSpec carSpec : carSpecs) {
            Trim trim = carSpec.getTrim();
            CarSpecInfo carSpecInfo =
                    toCarSpecResponse(
                            carSpec,
                            getBasicOptionNames(trim.getId()),
                            getBasicOptionIds(trim.getId()),
                            getBasicOptionUrls(trim.getId()));
            carSpecInfos.add(carSpecInfo);
        }
        return new CarSpecResponse(carSpecInfos, LEBLANC_ID);
    }

    public List<CarSpecComparisonResponse> findCarSpecComparisonsBySpec(
            Long engineId, Long bodyId, Long drivingSystemId) {
        List<CarSpec> carSpecs =
                carSpecRepository.findByEngineIdAndBodyIdAndDrivingSystemId(
                        engineId, bodyId, drivingSystemId);
        List<CarSpecComparisonResponse> carSpecComparisonResponses = new ArrayList<>();
        for (CarSpec carSpec : carSpecs) {
            Trim trim = carSpec.getTrim();
            CarSpecComparisonResponse carSpecComparisonResponse =
                    toCarSpecComparisonResponse(
                            carSpec,
                            getBasicOptionNames(trim.getId()),
                            getBasicOptionIds(trim.getId()));
            carSpecComparisonResponses.add(carSpecComparisonResponse);
        }
        return carSpecComparisonResponses;
    }

    private List<String> getBasicOptionNames(Long trimId) {
        if (trimId == EXCLUSIVE_ID) {
            return List.of(EXCLUSIVE_OPTION1.name, EXCLUSIVE_OPTION2.name, EXCLUSIVE_OPTION3.name);
        }
        if (trimId == LEBLANC_ID) {
            return List.of(LEBLANC_OPTION1.name, LEBLANC_OPTION2.name, LEBLANC_OPTION3.name);
        }
        if (trimId == PRESTIGE_ID) {
            return List.of(PRESTIGE_OPTION1.name, PRESTIGE_OPTION2.name, PRESTIGE_OPTION3.name);
        }
        return List.of(
                CALLIGRAPHY_OPTION1.name, CALLIGRAPHY_OPTION2.name, CALLIGRAPHY_OPTION3.name);
    }

    private List<Long> getBasicOptionIds(Long trimId) {
        if (trimId == EXCLUSIVE_ID) {
            return List.of(EXCLUSIVE_OPTION1.id, EXCLUSIVE_OPTION2.id, EXCLUSIVE_OPTION3.id);
        }
        if (trimId == LEBLANC_ID) {
            return List.of(LEBLANC_OPTION1.id, LEBLANC_OPTION2.id, LEBLANC_OPTION3.id);
        }
        if (trimId == PRESTIGE_ID) {
            return List.of(PRESTIGE_OPTION1.id, PRESTIGE_OPTION2.id, PRESTIGE_OPTION3.id);
        }
        return List.of(CALLIGRAPHY_OPTION1.id, CALLIGRAPHY_OPTION2.id, CALLIGRAPHY_OPTION3.id);
    }

    private List<String> getBasicOptionUrls(Long trimId) {
        if (trimId == EXCLUSIVE_ID) {
            return List.of(EXCLUSIVE_OPTION1.url, EXCLUSIVE_OPTION2.url, EXCLUSIVE_OPTION3.url);
        }
        if (trimId == LEBLANC_ID) {
            return List.of(LEBLANC_OPTION1.url, LEBLANC_OPTION2.url, LEBLANC_OPTION3.url);
        }
        if (trimId == PRESTIGE_ID) {
            return List.of(PRESTIGE_OPTION1.url, PRESTIGE_OPTION2.url, PRESTIGE_OPTION3.url);
        }
        return List.of(CALLIGRAPHY_OPTION1.url, CALLIGRAPHY_OPTION2.url, CALLIGRAPHY_OPTION3.url);
    }

    public boolean userClickedTrimLog(Long trimId) {
        log.info(Markers.append(TRIM, trimId), TRIM);
        return true;
    }

    public CarSpecResponse findCarSpecsByCarSpecId(Long carSpecId) {
        CarSpec carSpec =
                carSpecRepository
                        .findById(carSpecId)
                        .orElseThrow(
                                () ->
                                        new MyCarDeepDiveException(
                                                HttpStatus.BAD_REQUEST,
                                                ErrorType.CAR_SPEC_NOT_FOUND));
        return findCarSpecsBySpec(
                carSpec.getEngine().getId(),
                carSpec.getBody().getId(),
                carSpec.getDrivingSystem().getId());
    }

    enum basicOptions {
        EXCLUSIVE_OPTION1("전방 충돌 방지 보조", 10L, "img.make-my-car.shop/option/fca.jpg"),
        EXCLUSIVE_OPTION2("내비 기반 크루즈 컨트롤", 16L, "img.make-my-car.shop/option/ncss.jpg"),
        EXCLUSIVE_OPTION3("세이프티 파워 윈도우", 108L, "img.make-my-car.shop/option/safetypowerwindow.jpg"),
        LEBLANC_OPTION1("퀼팅 천연가죽 시트", 80L, "img.make-my-car.shop/option/realleather.jpg"),
        LEBLANC_OPTION2("12인치 클러스터", 59L, "img.make-my-car.shop/option/12.3cluster.jpg"),
        LEBLANC_OPTION3("서라운드 뷰 모니터", 113L, "img.make-my-car.shop/option/svm.jpg"),
        PRESTIGE_OPTION1("2열 통풍시트", 129L, "img.make-my-car.shop/option/2_cooling.jpg"),
        PRESTIGE_OPTION2("스마트 자세제어", 86L, "img.make-my-car.shop/option/smartcontrol.jpg"),
        PRESTIGE_OPTION3("2열 수동식 도어 커튼", 116L, "img.make-my-car.shop/option/manualcurtain.jpg"),
        CALLIGRAPHY_OPTION1(
                "20인치 캘리그라피 전용 휠", 52L, "img.make-my-car.shop/option/calligraphydesign.jpg"),
        CALLIGRAPHY_OPTION2("KRELL 프리미엄 사운드", 127L, "img.make-my-car.shop/option/krellsound.jpg"),
        CALLIGRAPHY_OPTION3("원격 스마트 주차 보조", 27L, "img.make-my-car.shop/option/rspa.jpg");

        final String name;
        final long id;
        final String url;

        basicOptions(String name, long id, String url) {
            this.name = name;
            this.id = id;
            this.url = url;
        }
    }
}
