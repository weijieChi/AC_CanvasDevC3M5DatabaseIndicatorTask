-- 建立資料庫
CREATE DATABASE `simpleTweeter`
CHARACTER SET utf8mb4
COLLATE utf8mb4_unicode_ci;
-- 使用者列表
CREATE TABLE `simpleTweeter`.`users` (
  `id` INT(10) unsigned NOT NULL AUTO_INCREMENT UNIQUE PRIMARY KEY, -- 另一種 PRIMARY KEY 設定方法
  `account` VARCHAR(200) NOT NULL UNIQUE,
  `password` VARCHAR(200) NOT NULL UNIQUE,
  `name` VARCHAR(200) NOT NULL,
  `birthdaty` DATE,
  `email` VARCHAR(200) NOT NULL UNIQUE,
  `avatar` VARCHAR(200),
  `cover` VARCHAR(200),
  `registerTime` TIMESTAMP NOT NULL
  --  64 位元的作業系統，64 位元的 mysql server ，然後版本要在 8.0.28 以上 timestamp 就自動是 64bit
);
-- 使用者跟隨列表
CREATE TABLE `simpleTweeter`.`followings` (
`id` INT(10) unsigned NOT NULL AUTO_INCREMENT UNIQUE,
`user_id` INT(10) unsigned NOT NULL,
`followingUser_id` INT(10) unsigned NOT NULL,
`followingTime` TIMESTAMP NOT NULL,
PRIMARY KEY(`id`),
FOREIGN KEY(`user_id`) REFERENCES `users`(`id`)
  ON UPDATE CASCADE
  ON DELETE CASCADE,
FOREIGN KEY(`followingUser_id`) REFERENCES `users`(`id`)
  ON UPDATE CASCADE
  ON DELETE CASCADE
);
-- 推文列表
CREATE TABLE `simpleTweeter`.`tweets` (
`id` INT(10) unsigned NOT NULL AUTO_INCREMENT UNIQUE,
`user_id` INT(10) unsigned NOT NULL,
`content` TEXT NOT NULL,
`postingTime` timestamp NOT NULL,
PRIMARY KEY(`id`),
FOREIGN KEY(`user_id`) REFERENCES `users`(`id`)
  ON UPDATE CASCADE
  ON DELETE CASCADE
);
-- 回應列表
CREATE TABLE `simpleTweeter`.`comments` (
`id` INT(10) unsigned NOT NULL AUTO_INCREMENT UNIQUE,
`user_id` INT(10) unsigned NOT NULL,
`tweet_id` INT(10) unsigned NOT NULL,
`content` TEXT NOT NULL,
`commtetTime` timestamp NOT NULL,
PRIMARY KEY(`id`),
FOREIGN KEY(`user_id`) REFERENCES `users`(`id`)
  ON UPDATE CASCADE
  ON DELETE CASCADE,
FOREIGN KEY(`tweet_id`) REFERENCES `tweets`(`id`)
  ON UPDATE CASCADE
  ON DELETE CASCADE
);
-- LIKE 列表
CREATE TABLE `simpleTweeter`.`likes` (
`id` INT(10) unsigned NOT NULL AUTO_INCREMENT UNIQUE,
`user_id` INT(10) unsigned NOT NULL,
`tweet_id` INT(10) unsigned NOT NULL,
`isLike` BOOLEAN NOT NULL,
`likeTime` TIMESTAMP NOT NULL,
PRIMARY KEY(`id`),
FOREIGN KEY(`user_id`) REFERENCES `users`(`id`)
  ON UPDATE CASCADE
  ON DELETE CASCADE,
FOREIGN KEY(`tweet_id`) REFERENCES `tweets`(`id`)
  ON UPDATE CASCADE
  ON DELETE CASCADE
);
-- 系統管理者列表
CREATE TABLE `simpleTweeter`.`administrators` (
`id` INT(10) unsigned NOT NULL AUTO_INCREMENT UNIQUE PRIMARY KEY, -- 另一種 PRIMARY KEY 設定方法
`account` VARCHAR(200) NOT NULL UNIQUE,
`password` VARCHAR(200) NOT NULL,
`email` VARCHAR(200) NOT NULL UNIQUE
);