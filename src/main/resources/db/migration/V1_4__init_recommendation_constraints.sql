alter table recommendation
    add constraint FKn0e6rd6v3hk3rdwsbdubsn4sc
        foreign key (recommendation_car_id)
            references recommendation_car (recommendation_car_id);

alter table recommendation_car
    add constraint FKnmf9opye7setr3c5ys6ctbclb
        foreign key (car_spec_id)
            references car_spec (car_spec_id);

alter table recommendation_car
    add constraint FK90daf824500b8awy6nm43tlq7
        foreign key (exterior_color_id)
            references exterior_color (exterior_color_id);

alter table recommendation_car
    add constraint FK5uw11djwb7k4wf1ecxn7fysl2
        foreign key (interior_color_id)
            references interior_color (interior_color_id);

alter table recommendation_car_option
    add constraint FKphmf9ju55u52fvbec7ynl5d4f
        foreign key (option_id)
            references options (option_id);

alter table recommendation_car_option
    add constraint FKjs9h780g74vhmvnv5nwqt43o5
        foreign key (recommendation_car_id)
            references recommendation_car (recommendation_car_id);

alter table recommendation_car_package
    add constraint FK2872o165dbdn62r21pwtropkr
        foreign key (package_id)
            references packages (package_id);

alter table recommendation_car_package
    add constraint FKdgdv4pki7jc3ftb022y9meis4
        foreign key (recommendation_car_id)
            references recommendation_car (recommendation_car_id);

alter table custom_recommendation_car
    add constraint FK3tlfq645jdrhuvbxvvbe5g0gm
        foreign key (custom_recommendation_id)
            references custom_recommendation (custom_recommendation_id);

alter table custom_recommendation_car
    add constraint FK9rdmqri98d2gggvgf0omd2noi
        foreign key (recommendation_car_id)
            references recommendation_car (recommendation_car_id);