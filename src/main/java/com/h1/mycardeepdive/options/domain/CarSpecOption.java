package com.h1.mycardeepdive.options.domain;

import com.h1.mycardeepdive.car.domain.CarSpec;
import javax.persistence.*;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Entity
@NoArgsConstructor
@Getter
public class CarSpecOption {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "car_spec_option_id")
    private Long id;

    @ManyToOne
    @JoinColumn(name = "car_spec_id")
    private CarSpec carSpec;

    @ManyToOne
    @JoinColumn(name = "option_id")
    private Options options;

    private boolean isBasicOption;
}
