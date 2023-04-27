USE cice_db;

INSERT INTO need(needType,isDefault)
VALUES ("Capacitación",true),
       ("Asistencia Técnica",true),
       ("Networking",true),
       ("Financiamiento",true);

INSERT INTO assistance(type,isDefault)
VALUES ("Técnica",true),
       ("Aplicación de lineas de financiamiento",true),
       ("Presentación a convocatoria",true);

INSERT INTO state(stateType)
VALUES ("Idea negocio"),
       ("Puesta en marcha"),
       ("Formulación de puesta en marcha"),
       ("Consolidación - Expansión"),
       ("Especificación");

INSERT INTO category(name,description)
VALUES ("agroindustria","Subserie de actividades de manufacturación mediante las cuales se elaboran materias primas y productos intermedios derivados del sector agrícola"),
       ("gastronomia","disciplina que estudia la relación entre la cultura y la comida durante un período de tiempo determinado"),
       ("ganaderia maritima","cria y cuidado de animales marítimos para su posterior explotación");

INSERT INTO role(type)
VALUES ("Super-Admin"),
       ("Admin"),
       ("Entrepreneur"),
       ("Default");

INSERT INTO user(email, password, name, surname, role)
VALUES ("luffyDM@gmail.com","pirateking","Luffy D.","Monkey", 1),
       ("zorito@gmail.com","santoryu","Zoro","Roronoa", 2),
       ("sanji@gmail.com","allblue","Sanji","Vinsmoke", 2);

INSERT INTO entrepreneur(name,surname,email,cuilCuit,phone,howIMeetCice,isPF)
VALUES ("Nami","Bellmere","dobouroneko@gmail.com",64642626855,465456213,"por la app",true),
       ("Usopp","Sogeking","sogeking@gmail.com",64642865855,466556213,"por la app",true),
       ("Chopper","Tony Tony","sakuras@gmail.com",74112626855,465456213,"por la app",false);

INSERT INTO project(title,description,category,projectManager,file,assitance,need,state,referrer)
VALUES ("baratie","restaurante maritimo",2,2,null,1,4,2,null),
       ("going merry","cria de salmones",3,1,null,3,2,1,null);

INSERT INTO meeting(date,time,project_fk,referrer_fk_user,evaluator_fk_user)
Values (2023-05-04,09:00:00,1,2,3),
       (2023-06-23,10:30:00,2,1,2),
       (2023-08-10,14:00:00,2,2,2);
