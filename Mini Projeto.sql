CREATE TABLE `user` (
  `id` INT PRIMARY KEY,
  `fullname` VARCHAR,
  `age` INT,
  `height` FLOAT,
  `weight` FLOAT,
  `goal` VARCHAR
);

CREATE TABLE `food` (
  `id` INT PRIMARY KEY,
  `name` VARCHAR,
  `type` VARCHAR,
  `nutritional_value` FLOAT,
  `nutritional_unit_type` VARCHAR
);

CREATE TABLE `snack` (
  `id` INT PRIMARY KEY,
  `type` VARCHAR,
  `description` VARCHAR,
  `time_consumed` TIME,
  `description_food` TEXT,
  `quantity` INT
);

CREATE TABLE `food_record` (
  `id` INT PRIMARY KEY,
  `user_id` INT,
  `food_id` INT,
  `consumed` FLOAT,
  `date_consumed` DATE,
  `time_consumed` TIME
);

CREATE TABLE `meal_plan` (
  `id` INT PRIMARY KEY,
  `user_id` INT,
  `snack_id` INT,
  `day` INT,
  `description` TEXT
);

ALTER TABLE `meal_plan` ADD FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

ALTER TABLE `snack` ADD FOREIGN KEY (`id`) REFERENCES `meal_plan` (`snack_id`);

ALTER TABLE `user` ADD FOREIGN KEY (`id`) REFERENCES `food_record` (`user_id`);

ALTER TABLE `food` ADD FOREIGN KEY (`id`) REFERENCES `food_record` (`food_id`);

ALTER TABLE `snack` ADD FOREIGN KEY (`description_food`) REFERENCES `food` (`id`);
