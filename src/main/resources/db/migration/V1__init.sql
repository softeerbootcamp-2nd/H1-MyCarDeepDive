create table body (
                      body_id bigint not null auto_increment,
                      description varchar(255),
                      img_url varchar(255),
                      name varchar(255),
                      primary key (body_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

create table car (
                     car_id bigint not null auto_increment,
                     comment varchar(255),
                     name varchar(255),
                     primary key (car_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

create table car_body (
                          car_body_id bigint not null auto_increment,
                          body_id bigint,
                          car_id bigint,
                          primary key (car_body_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

create table car_driving_system (
                                    car_driving_system_id bigint not null auto_increment,
                                    car_id bigint,
                                    driving_system_id bigint,
                                    primary key (car_driving_system_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

create table car_engine (
                            car_engine_id bigint not null auto_increment,
                            car_id bigint,
                            engine_id bigint,
                            primary key (car_engine_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

create table car_spec (
                          car_spec_id bigint not null auto_increment,
                          price bigint not null,
                          body_id bigint,
                          car_id bigint,
                          driving_system_id bigint,
                          engine_id bigint,
                          trim_id bigint,
                          primary key (car_spec_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

create table car_spec_options (
                                  car_spec_option_id bigint not null auto_increment,
                                  is_basic_option bit,
                                  car_spec_id bigint,
                                  option_id bigint,
                                  primary key (car_spec_option_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

create table car_spec_package (
                                  car_spec_package_id bigint not null auto_increment,
                                  car_spec_id bigint,
                                  package_id bigint,
                                  primary key (car_spec_package_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

create table color_combination (
                                   color_combination_id bigint not null auto_increment,
                                   exterior_color_id bigint,
                                   interior_color_id bigint,
                                   primary key (color_combination_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

create table driving_system (
                                driving_system_id bigint not null auto_increment,
                                description varchar(255),
                                img_url varchar(255),
                                name varchar(255),
                                primary key (driving_system_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

create table engine (
                        engine_id bigint not null auto_increment,
                        description varchar(255),
                        img_url varchar(255),
                        max_power varchar(255),
                        max_torque varchar(255),
                        name varchar(255),
                        primary key (engine_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

create table exterior_color (
                                exterior_color_id bigint not null auto_increment,
                                choose_rate double precision not null,
                                comment varchar(255),
                                exterior_img_url varchar(255),
                                img_url varchar(255),
                                name varchar(255),
                                price bigint not null,
                                primary key (exterior_color_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

create table interior_color (
                                interior_color_id bigint not null auto_increment,
                                choose_rate double precision not null,
                                comment varchar(255),
                                img_url varchar(255),
                                interior_img_url varchar(255),
                                name varchar(255),
                                price bigint not null,
                                primary key (interior_color_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

create table option_package (
                                option_package_id bigint not null auto_increment,
                                option_id bigint,
                                package_id bigint,
                                primary key (option_package_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

create table options (
                         option_id bigint not null auto_increment,
                         badge_name varchar(255),
                         choose_rate double precision,
                         name varchar(255),
                         price bigint not null,
                         summary varchar(255),
                         description varchar(255),
                         img_url varchar(255),
                         primary key (option_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

create table option_tag (
                            option_tag_id bigint not null auto_increment,
                            position_x double precision not null,
                            position_y double precision not null,
                            option_id bigint,
                            tag_id bigint,
                            primary key (option_tag_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

create table packages (
                          package_id bigint not null auto_increment,
                          badge_name varchar(255),
                          choose_rate double precision,
                          name varchar(255),
                          price bigint not null,
                          summary varchar(255),
                          primary key (package_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

create table package_tag (
                             package_tag_id bigint not null auto_increment,
                             package_id bigint,
                             tag_id bigint,
                             primary key (package_tag_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

create table tags (
                      tag_id bigint not null auto_increment,
                      img_url varchar(255),
                      name varchar(255),
                      primary key (tag_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

create table trim_color_combination (
                                        trim_color_combination_id bigint not null auto_increment,
                                        color_combination_id bigint,
                                        trim_id bigint,
                                        primary key (trim_color_combination_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

create table trim_exterior_color (
                                     trim_exterior_color_id bigint not null auto_increment,
                                     exterior_color_id bigint,
                                     trim_id bigint,
                                     primary key (trim_exterior_color_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

create table trim_interior_color (
                                     trim_interior_color_id bigint not null auto_increment,
                                     interior_color_id bigint,
                                     trim_id bigint,
                                     primary key (trim_interior_color_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

create table trims (
                       trim_id bigint not null auto_increment,
                       cluster_size double precision not null,
                       description varchar(255),
                       img_url varchar(255),
                       name varchar(255),
                       navigation_size double precision not null,
                       seat_name varchar(255),
                       summary varchar(255),
                       wheel_name varchar(255),
                       wheel_size double precision not null,
                       car_id bigint,
                       primary key (trim_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

create table trim_to_exterior (
                                  trim_to_exterior_color_id bigint not null auto_increment,
                                  exterior_color_id bigint,
                                  trim_id bigint,
                                  primary key (trim_to_exterior_color_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

create table trim_to_interior (
                                  trim_to_interior_color_id bigint not null auto_increment,
                                  interior_color_id bigint,
                                  trim_id bigint,
                                  primary key (trim_to_interior_color_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
