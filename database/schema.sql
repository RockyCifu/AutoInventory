CREATE DATABASE IF NOT EXISTS auto_inventory;

USE auto_inventory;

DROP TABLE IF EXISTS vehicles, models, makes;

CREATE TABLE makes (
  id INT NOT NULL AUTO_INCREMENT,
  make_name VARCHAR(45) NOT NULL,
  PRIMARY KEY (id),
  UNIQUE INDEX make_name_UNIQUE (make_name ASC) VISIBLE);

CREATE TABLE models (
  id INT NOT NULL AUTO_INCREMENT,
  model_name VARCHAR(45) NOT NULL,
  make_id INT NOT NULL,
  PRIMARY KEY (id),
  UNIQUE INDEX model_name_UNIQUE (model_name ASC) VISIBLE,
  INDEX make_id_idx (make_id ASC) VISIBLE,
  CONSTRAINT make_id
    FOREIGN KEY (make_id)
    REFERENCES makes (id)
    ON DELETE CASCADE);

CREATE TABLE vehicles (
  id INT NOT NULL AUTO_INCREMENT,
  VIN VARCHAR(255) NOT NULL,
  model_id INT NOT NULL,
  PRIMARY KEY (id),
  INDEX model_id_idx (model_id ASC) VISIBLE,
  CONSTRAINT model_id
    FOREIGN KEY (model_id)
    REFERENCES models (id)
    ON DELETE CASCADE);