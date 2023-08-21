create table recommendation
(
    recommendation_id     bigint not null auto_increment,
    age_group_id          bigint,
    description           varchar(255),
    life_style_id         bigint,
    recommendation_car_id bigint,
    primary key (recommendation_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

create table recommendation_car
(
    recommendation_car_id bigint not null auto_increment,
    comment1              varchar(255),
    comment2              varchar(255),
    keyword               varchar(255),
    car_spec_id           bigint,
    exterior_color_id     bigint,
    interior_color_id     bigint,
    primary key (recommendation_car_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

create table recommendation_car_option
(
    recommendation_car_option_id bigint not null auto_increment,
    option_id                    bigint,
    recommendation_car_id        bigint,
    primary key (recommendation_car_option_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

create table recommendation_car_package
(
    recommendation_car_package_id bigint not null auto_increment,
    package_id                    bigint,
    recommendation_car_id         bigint,
    primary key (recommendation_car_package_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

create table custom_recommendation
(
    custom_recommendation_id bigint bigint not null auto_increment,
    car_purpose_id           bigint,
    driving_experience_id    bigint,
    family_members_id        bigint,
    personal_value_id        bigint,
    recommendation_car_id    bigint,
    primary key (custom_recommendation_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;