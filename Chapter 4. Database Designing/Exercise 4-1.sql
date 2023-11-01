CREATE TABLE `students`(
    `id` INt NOT NULL AUTO_INCREMENT
    `name` VARCHAR(20) NOT NULL,
    `year` INT NOT NULL,
    `major` VARCHAR(20),
    `individual_num` INT NOT NULL,
    `phone_num` VARCHAR(11) NOT NULL,
    `address` VARCHAR(100),
    `total_credit` INT NOT NULL DEFAULT 0,
    `avg_credit` FLOAT NOT NULL DEFAULT 0.0,
    `is_attending` TINYINT(1) NOT NULL DEFAULT 1,
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
