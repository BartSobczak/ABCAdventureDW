insert into ABC_AdventureDW.dbo.Kindergarten(name, city, district, insertion, deactivation, avg_teacher_age)
select 
    k.name, 
    c.name, 
    d.name, 
    GETDATE() as insertion, 
    NULL as deactivation, 
    NULL as avg_teacher_age
from 
    ABC_AdventureDB.dbo.kindergartens k
join 
    ABC_AdventureDB.dbo.districts d on k.district_id = d.id
join
    ABC_AdventureDB.dbo.cities c on d.city_id = c.id
where not exists (
    select 1
    from ABC_AdventureDW.dbo.Kindergarten
    where id_kindergarten = k.id
);