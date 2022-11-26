create table Car
(
    id      serial primary key,
    model   varchar(32),
    year    int,
    details text
);

insert into Car (model, "year", details)
values ('bmw m8', 2021, 'details'),
       ('bmw m5 cs', 2022, 'details'),
       ('lexus lfa', 2012, 'details');
