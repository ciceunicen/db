CREATE DATABASE cice_db;
USE cice_db;

CREATE TABLE `user` (
  `id` Long PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `email` varchar(255) UNIQUE NOT NULL,
  `password` varchar(255) NOT NULL,
  `name` varchar(100) NOT NULL,
  `surname` varchar(100) NOT NULL,
  `role` int
);

CREATE TABLE `role` (
  `id` Long PRIMARY KEY NOT NULL,
  `type` varchar(100)
);

CREATE TABLE `entrepreneur` (
  `id` Long PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `surname` varchar(20) NOT NULL,
  `email` varchar(45) UNIQUE NOT NULL,
  `cuilCuit` Long,
  `phone` int,
  `howIMeetCice` varchar(60),
  `isPF` boolean
);

CREATE TABLE `project` (
  `id` Long PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `title` varchar(20),
  `description` varchar(60),
  `category` Long,
  `projectManager` Long,
  `file` Long,
  `assistance` Long,
  `need` Long,
  `state` Long,
  `referrer` Long
);

CREATE TABLE `file` (
  `id` Long PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `file` varchar(255) NOT NULL,
  `type` varchar(255)
);

CREATE TABLE `need` (
  `id` Long PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `needType` varchar(20),
  `isDefault` boolean
);

CREATE TABLE `state` (
  `id` Long PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `stateType` varchar(20)
);

CREATE TABLE `assistance` (
  `id` Long PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `type` varchar(20),
  `isDefault` boolean
);

CREATE TABLE `meeting` (
  `id` Long PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `date` date,
  `time` time,
  `project_fk` Long,
  `referrer_fk_user` Long,
  `evaluator_fk_user` Long
);

CREATE TABLE `entrepreneur_team` (
  `id_project` Long,
  `id_entrepreneur` Long
);

CREATE TABLE `category` (
  `id` Long PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `description` varchar(50) NOT NULL
);

ALTER TABLE `user` ADD FOREIGN KEY (`role`) REFERENCES `role` (`id`);

ALTER TABLE `category` ADD FOREIGN KEY (`id`) REFERENCES `project` (`category`);

CREATE TABLE `entrepreneur_project` (
  `entrepreneur_id` Long,
  `project_projectManager` Long,
  PRIMARY KEY (`entrepreneur_id`, `project_projectManager`)
);

ALTER TABLE `entrepreneur_project` ADD FOREIGN KEY (`entrepreneur_id`) REFERENCES `entrepreneur` (`id`);

ALTER TABLE `entrepreneur_project` ADD FOREIGN KEY (`project_projectManager`) REFERENCES `project` (`projectManager`);


ALTER TABLE `file` ADD FOREIGN KEY (`id`) REFERENCES `project` (`file`);

CREATE TABLE `assistance_project` (
  `assistance_id` Long,
  `project_assistance` Long,
  PRIMARY KEY (`assistance_id`, `project_assistance`)
);

ALTER TABLE `assistance_project` ADD FOREIGN KEY (`assistance_id`) REFERENCES `assistance` (`id`);

ALTER TABLE `assistance_project` ADD FOREIGN KEY (`project_assistance`) REFERENCES `project` (`assistance`);


CREATE TABLE `need_project` (
  `need_id` Long,
  `project_need` Long,
  PRIMARY KEY (`need_id`, `project_need`)
);

ALTER TABLE `need_project` ADD FOREIGN KEY (`need_id`) REFERENCES `need` (`id`);

ALTER TABLE `need_project` ADD FOREIGN KEY (`project_need`) REFERENCES `project` (`need`);


ALTER TABLE `project` ADD FOREIGN KEY (`state`) REFERENCES `state` (`id`);

ALTER TABLE `meeting` ADD FOREIGN KEY (`project_fk`) REFERENCES `project` (`id`);

ALTER TABLE `entrepreneur_team` ADD FOREIGN KEY (`id_project`) REFERENCES `project` (`id`);

ALTER TABLE `entrepreneur_team` ADD FOREIGN KEY (`id_entrepreneur`) REFERENCES `entrepreneur` (`id`);
