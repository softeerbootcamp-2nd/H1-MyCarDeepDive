alter table custom_recommendation
    add constraint FKcxws3w7qjw7c168fiy5scmaif
        foreign key (recommendation_car_id)
            references recommendation_car (recommendation_car_id);

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