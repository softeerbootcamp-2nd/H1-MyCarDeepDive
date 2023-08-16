alter table car_body
    add constraint FK1wyxkittqa5j359ngnwwp1r3c
        foreign key (body_id)
            references body(body_id);

alter table car_body
    add constraint FKq2847h05rc7nc0q9gc2q8kjt4
        foreign key (car_id)
            references car (car_id);

alter table car_driving_system
    add constraint FK6m10crb13en5k9q1s1dfwdumq
        foreign key (car_id)
            references car (car_id);

alter table car_driving_system
    add constraint FKjldo4rav14f90mmwesdi8hxcp
        foreign key (driving_system_id)
            references driving_system (driving_system_id);

alter table car_engine
    add constraint FKb9vaiqc6cpf1xu984lwn780m1
        foreign key (car_id)
            references car (car_id);

alter table car_engine
    add constraint FK4gjdlyhijqqkulmkmax5ym8u5
        foreign key (engine_id)
            references engine (engine_id);

alter table car_spec
    add constraint FKddgxxrhbpes9g0jndgqkyyjkt
        foreign key (body_id)
            references body (body_id);

alter table car_spec
    add constraint FK3c06voxkq5d0w4qv0g0r1o8hm
        foreign key (car_id)
            references car (car_id);

alter table car_spec
    add constraint FKxabvscrp68e0jpv1pfty5yw8
        foreign key (driving_system_id)
            references driving_system (driving_system_id);

alter table car_spec
    add constraint FK3kbyd6p7i28du26ps3xnnh9yb
        foreign key (engine_id)
            references engine (engine_id);

alter table car_spec
    add constraint FK1ubdod6pn4n7usyo7uexy89al
        foreign key (trim_id)
            references trims (trim_id);

alter table car_spec_options
    add constraint FKbbf392ix5k6fu8b960ru3many
        foreign key (car_spec_id)
            references car_spec (car_spec_id);

alter table car_spec_options
    add constraint FK7wlp0kav36aejcm8vigc2ofcl
        foreign key (option_id)
            references options (option_id);

alter table car_spec_package
    add constraint FK4wsj9m8jar3dqeqfnt7v693dc
        foreign key (car_spec_id)
            references car_spec (car_spec_id);

alter table car_spec_package
    add constraint FK9dxt8h8t8l09yqij254lll9n7
        foreign key (package_id)
            references packages (package_id);

alter table color_combination
    add constraint FK8w9we7vnpd8d9i6b4st2m0sry
        foreign key (exterior_color_id)
            references exterior_color (exterior_color_id);

alter table color_combination
    add constraint FK1mg521avn5frv049ovqp1m9ga
        foreign key (interior_color_id)
            references interior_color (interior_color_id);

alter table option_package
    add constraint FKqdpx1i1at4libm7vpe53pcl94
        foreign key (option_id)
            references options (option_id);

alter table option_package
    add constraint FKpmlrou13kk9dmcwi19lep1rhf
        foreign key (package_id)
            references packages (package_id);

alter table option_tag
    add constraint FK9eycyngkyterc2b3iiu08p9ac
        foreign key (option_id)
            references options (option_id);

alter table option_tag
    add constraint FK1y13k1m8snp9e1sw7mrgwbh6u
        foreign key (tag_id)
            references tags (tag_id);

alter table package_tag
    add constraint FK3kc3dut4qjbby7qywnr5wphil
        foreign key (package_id)
            references packages (package_id);

alter table package_tag
    add constraint FKqp0sea78gba556mmrxbjuq0ip
        foreign key (tag_id)
            references tags (tag_id);

alter table trim_color_combination
    add constraint FKsb6bq5d17a1mh2j6b75fbmtn4
        foreign key (color_combination_id)
            references color_combination (color_combination_id);

alter table trim_color_combination
    add constraint FKnkuwp7eppnbokc8sw605b2jih
        foreign key (trim_id)
            references trims (trim_id);

alter table trim_exterior_color
    add constraint FK25hlmn6byeuhljcrut6c6vwh3
        foreign key (exterior_color_id)
            references exterior_color (exterior_color_id);

alter table trim_exterior_color
    add constraint FK8dyda6rlfvs3ehumt5a0i3nt6
        foreign key (trim_id)
            references trims (trim_id);

alter table trim_interior_color
    add constraint FK31e8pt5sls6wdsm3v80rgvd1x
        foreign key (interior_color_id)
            references interior_color (interior_color_id);

alter table trim_interior_color
    add constraint FKhk8pb81bncg7e64676j5fho8e
        foreign key (trim_id)
            references trims (trim_id);

alter table trims
    add constraint FKau76ee5k62l50jdsvpvo3utnn
        foreign key (car_id)
            references car (car_id);

alter table trim_to_exterior
    add constraint FK3bx55txy5ik09w22g5xmmcclf
        foreign key (exterior_color_id)
            references exterior_color (exterior_color_id);

alter table trim_to_exterior
    add constraint FK3k9rfb07r7knv32o9s44j8w2v
        foreign key (trim_id)
            references trims (trim_id);


alter table trim_to_interior
    add constraint FK8lhwpbso6uoslxdeytuor47x3
        foreign key (interior_color_id)
            references interior_color (interior_color_id);

alter table trim_to_interior
    add constraint FKedlvuhs4v18urai43lf9dbssx
        foreign key (trim_id)
            references trims (trim_id);