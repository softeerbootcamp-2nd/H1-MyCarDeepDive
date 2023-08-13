package com.h1.mycardeepdive.trims.domain;

import com.h1.mycardeepdive.car.domain.Car;
import javax.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Entity
@Getter
@NoArgsConstructor
@Builder
@AllArgsConstructor
public class Trims {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "trims_id")
    private Long id;

    private String name;

    private String description;

    private String imgUrl;

    private String wheelName;

    private double wheelSize;

    private String seatName;

    private double navigationSize;

    private double clusterSize;

    private String summary;

    @ManyToOne
    @JoinColumn(name = "car_id")
    private Car car;
}
