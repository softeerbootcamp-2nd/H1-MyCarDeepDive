package com.h1.mycardeepdive.car.domain;

import com.h1.mycardeepdive.options.domain.CarSpecOptions;
import com.h1.mycardeepdive.trims.domain.Trim;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;
import javax.persistence.*;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Entity
@Getter
@NoArgsConstructor
public class CarSpec {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "car_spec_id")
    private Long id;

    @ManyToOne
    @JoinColumn(name = "car_id")
    private Car car;

    @ManyToOne
    @JoinColumn(name = "trim_id")
    private Trim trim;

    @ManyToOne
    @JoinColumn(name = "body_id")
    private Body body;

    @ManyToOne
    @JoinColumn(name = "engine_id")
    private Engine engine;

    @ManyToOne
    @JoinColumn(name = "driving_system_id")
    private DrivingSystem drivingSystem;

    @OneToMany(mappedBy = "carSpec")
    private List<CarSpecOptions> carSpecOptions = new ArrayList<>();

    private long price;

    @Builder
    public CarSpec(
            Long id,
            Car car,
            Trim trim,
            Body body,
            Engine engine,
            DrivingSystem drivingSystem,
            List<CarSpecOptions> carSpecOptions,
            long price) {
        this.id = id;
        this.car = car;
        this.trim = trim;
        this.body = body;
        this.engine = engine;
        this.drivingSystem = drivingSystem;
        this.carSpecOptions = carSpecOptions;
        this.price = price;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        CarSpec carSpec = (CarSpec) o;
        return Objects.equals(id, carSpec.id);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id);
    }
}
