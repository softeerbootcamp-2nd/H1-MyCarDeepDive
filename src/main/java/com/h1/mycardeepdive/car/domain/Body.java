package com.h1.mycardeepdive.car.domain;

import lombok.Getter;
import lombok.NoArgsConstructor;

import javax.persistence.*;

@Entity
@Getter
@NoArgsConstructor
public class Body {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "body_id")
    private Long id;
}