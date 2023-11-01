CREATE TABLE `users`(
    `id` INT NOT NULL AUTO_INCREMENT,
    `user_id` VARCHAR(10) NOT NULL,
    `user_pw` VARCHAR(10) NOT NULL,
    `user_nickname` VARCHAR(20) NOT NULL,
    `profile_photo` VARCHAR(50) NOT NULL,
    `profile_message` VARCHAR(100) NOT NULL,
    `is_left` TINYINT(1) NOT NULL DEFAULT 0,
    `assign_date` DATETIME NOT NULL,
    PRIMARY KEY (`id`),
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `channels`(
    `id` INT NOT NULL AUTO_INCREMENT,
    `user_nickname` VARCHAR(20) NOT NULL,
    `channel_creater` INT NOT NULL,
    `channel_link` VARCHAR(50) NOT NULL,
    `max_num` INT NOT NULL,
    `is_left` TINYINT(1) NOT NULL DEFAULT 0,
    `create_channel_date` DATETIME NOT NULL,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`channel_creater`) REFERENCES `users`(`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `chats`(
    `id` INT NOT NULL AUTO_INCREMENT,
    `message` TEXT NOT NULL,
    `chatting_creater` INT NOT NULL,
    `chatting_channel` INT NOT NULL,
    `create_chatting_date` DATETIME NOT NULL,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`chatting_creater`) REFERENCES `users`(`id`) ON DELETE CASCADE,
    FOREIGN KEY (`chatting_channel`) REFERENCES `channels`(`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `follows`(
    `id` INT NOT NULL AUTO_INCREMENT,
    `follower` INT NOT NULL,
    `followee` INT NOT NULL,
    `follow_date` DATETIME NOT NULL,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`follower`) REFERENCES `users`(`id`) ON DELETE CASCADE,
    FOREIGN KEY (`followee`) REFERENCES `users`(`id`) ON DELETE CASCADE
    ON DELETE CASCATE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `blocks`(
    `id` INT NOT NULL AUTO_INCREMENT,
    `user_blocking` INT NOT NULL,
    `user_blocked` INT NOT NULL,
    `block_date` DATETIME NOT NULL,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`user_blocking`) REFERENCES `users`(`id`) ON DELETE CASCADE,
    FOREIGN KEY (`user_blocked`) REFERENCES `users`(`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;