package com.h1.mycardeepdive.pdf.domain;

import com.h1.mycardeepdive.pdf.ui.dto.SimpleOption;
import java.time.LocalDateTime;
import java.util.List;
import java.util.Objects;
import javax.persistence.Id;
import lombok.Builder;
import lombok.Getter;
import org.springframework.data.mongodb.core.mapping.Document;

@Getter
@Document("pdf_info")
public class PdfInfo {
    @Id private String id;
    private String car_image_url;
    private String car_name;
    private String engine_name;
    private String driving_system_name;
    private String trim_name;
    private String body_name;
    private String max_torque;
    private String max_power;
    private String exterior_color_name;
    private String exterior_color_img_url;
    private long exterior_color_price;
    private String interior_color_name;
    private String interior_color_img_url;
    private long interior_color_price;
    private List<SimpleOption> optionList;
    private long basic_price;
    private String pdf_url;
    private LocalDateTime creationDate;

    @Builder
    public PdfInfo(
            String id,
            String car_image_url,
            String car_name,
            String engine_name,
            String driving_system_name,
            String trim_name,
            String body_name,
            String max_torque,
            String max_power,
            String exterior_color_name,
            String exterior_color_img_url,
            long exterior_color_price,
            String interior_color_name,
            String interior_color_img_url,
            long interior_color_price,
            long basic_price,
            List<SimpleOption> optionList,
            String pdf_url,
            LocalDateTime creationDate) {
        this.id = id;
        this.car_image_url = car_image_url;
        this.car_name = car_name;
        this.engine_name = engine_name;
        this.driving_system_name = driving_system_name;
        this.trim_name = trim_name;
        this.body_name = body_name;
        this.max_torque = max_torque;
        this.max_power = max_power;
        this.exterior_color_name = exterior_color_name;
        this.exterior_color_img_url = exterior_color_img_url;
        this.exterior_color_price = exterior_color_price;
        this.interior_color_name = interior_color_name;
        this.interior_color_img_url = interior_color_img_url;
        this.interior_color_price = interior_color_price;
        this.optionList = optionList;
        this.basic_price = basic_price;
        this.pdf_url = pdf_url;
        this.creationDate = creationDate;
    }

    public void setPdf_url(String pdf_url) {
        this.pdf_url = pdf_url;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        PdfInfo pdfInfo = (PdfInfo) o;
        return Objects.equals(id, pdfInfo.id);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id);
    }
}
