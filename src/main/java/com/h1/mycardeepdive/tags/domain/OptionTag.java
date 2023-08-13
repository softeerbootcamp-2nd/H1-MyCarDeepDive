package com.h1.mycardeepdive.tags.domain;

import com.h1.mycardeepdive.options.domain.Options;
import java.util.Objects;
import javax.persistence.*;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Entity
@NoArgsConstructor
@Getter
public class OptionTag {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "option_tag_id")
    private Long id;

    @ManyToOne
    @JoinColumn(name = "option_id")
    private Options option;

    @ManyToOne
    @JoinColumn(name = "tag_id")
    private Tags tag;

    private double position_x;

    private double position_y;

    @Builder
    public OptionTag(Long id, Options option, Tags tag, double position_x, double position_y) {
        this.id = id;
        this.option = option;
        this.tag = tag;
        this.position_x = position_x;
        this.position_y = position_y;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        OptionTag tag = (OptionTag) o;
        return Objects.equals(id, tag.id);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id);
    }
}
