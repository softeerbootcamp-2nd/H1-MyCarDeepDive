package com.h1.mycardeepdive.options.domain;

import com.h1.mycardeepdive.car.domain.CarSpec;
import java.util.Objects;
import javax.persistence.*;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Entity
@NoArgsConstructor
@Getter
public class CarSpecOptions {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "car_spec_option_id")
    private Long id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "car_spec_id")
    private CarSpec carSpec;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "option_id")
    private Options options;

    @Column(name = "is_basic_option")
    private boolean isBasicOption;

    @Builder
    public CarSpecOptions(Long id, CarSpec carSpec, Options options, boolean isBasicOption) {
        this.id = id;
        this.carSpec = carSpec;
        this.options = options;
        this.isBasicOption = isBasicOption;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        CarSpecOptions carSpecOptions = (CarSpecOptions) o;
        return Objects.equals(id, carSpecOptions.id);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id);
    }
}
