package com.h1.mycardeepdive.trims.domain;

import com.h1.mycardeepdive.car.domain.Car;
import lombok.Getter;
import lombok.NoArgsConstructor;

import javax.persistence.*;

@Entity
@Getter
@NoArgsConstructor
public class Trims {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "trims_id")
    private Long id;

    private String name;

    private String description;

    private String img_url;

    private String wheel_name;

    private double wheel_size;

    private String seat_name;

    private double navigation_size;

    private double cluster_size;

    @ManyToOne
    @JoinColumn(name = "car_id")
    private Car car;
}