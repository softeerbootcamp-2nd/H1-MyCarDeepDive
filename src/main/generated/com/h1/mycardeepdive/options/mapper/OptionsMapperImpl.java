package com.h1.mycardeepdive.options.mapper;

import com.h1.mycardeepdive.options.domain.WheelOptions;
import com.h1.mycardeepdive.options.ui.dto.WheelOptionResponse;
import javax.annotation.processing.Generated;

@Generated(
    value = "org.mapstruct.ap.MappingProcessor",
    date = "2023-08-09T16:42:01+0900",
    comments = "version: 1.4.2.Final, compiler: javac, environment: Java 18.0.1 (Oracle Corporation)"
)
public class OptionsMapperImpl implements OptionsMapper {

    @Override
    public WheelOptionResponse entityToResponse(WheelOptions wheelOptions) {
        if ( wheelOptions == null ) {
            return null;
        }

        WheelOptionResponse wheelOptionResponse = new WheelOptionResponse();

        wheelOptionResponse.setWheel_id( wheelOptions.getId() );
        wheelOptionResponse.setWheel_size( wheelOptions.getWheelSize() );
        wheelOptionResponse.setWheel_image_url( wheelOptions.getOptionsImageUrl() );
        wheelOptionResponse.setWheel_name( wheelOptions.getOptionsName() );
        wheelOptionResponse.setWheel_description( wheelOptions.getOptionsDescription() );
        wheelOptionResponse.setWheel_price( wheelOptions.getOptionsPrice() );
        wheelOptionResponse.setWheel_summary( wheelOptions.getOptionsSummary() );

        return wheelOptionResponse;
    }
}
