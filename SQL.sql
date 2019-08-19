CREATE TABLE `pages` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `page` varchar(30) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE(`page`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `menus` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `menu` varchar(30) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE(`menu`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `menu_pages` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `menu_id` tinyint(3) unsigned NOT NULL,
  `page_id` tinyint(3) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `menu_page` UNIQUE (`menu_id`, `page_id`),
  CONSTRAINT `FK_menu_id` FOREIGN KEY (`menu_id`)
    REFERENCES `menus` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `FK_page_id` FOREIGN KEY (`page_id`)
    REFERENCES `pages` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `pages` (`id`, `page`, `created_at`, `updated_at`, `deleted_at`) VALUES (NULL, 'home', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, NULL), (NULL, 'products', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, NULL), (NULL, 'about us', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, NULL), (NULL, 'services', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, NULL), (NULL, 'contact us', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, NULL);
INSERT INTO `menu_pages` (`id`, `menu_id`, `page_id`, `created_at`, `updated_at`, `deleted_at`) VALUES (NULL, '1', '1', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, NULL), (NULL, '1', '2', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, NULL), (NULL, '1', '3', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, NULL), (NULL, '1', '4', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, NULL), (NULL, '1', '5', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, NULL);
SELECT pages.page
FROM menus
LEFT JOIN menu_pages
ON menus.id=menu_pages.menu_id
LEFT JOIN pages
ON menu_pages.page_id=pages.id
WHERE menus.menu = 'header_menu';

CREATE TABLE `product_manufacturers` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `product_manufacturer` varchar(30) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE(`product_manufacturer`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `product_models` ( `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT, `product_model` varchar(30) NOT NULL, `created_at` timestamp NOT NULL DEFAULT current_timestamp(), `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(), `deleted_at` timestamp NULL DEFAULT NULL, PRIMARY KEY (`id`), UNIQUE(`product_model`) ) ENGINE=InnoDB DEFAULT CHARSET=utf8

INSERT INTO `product_models` (`id`, `product_model`, `created_at`, `updated_at`, `deleted_at`) VALUES (NULL, '8518a', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, NULL), (NULL, '4508lp', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, NULL), (NULL, '7516ac', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, NULL), (NULL, '7506ac', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, NULL), (NULL, '6518a', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, NULL), (NULL, '6506ac', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, NULL), (NULL, '5516ac', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, NULL), (NULL, '5506ac', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, NULL), (NULL, '4518a', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, NULL), (NULL, '3515ac', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, NULL), (NULL, '3015ac', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, NULL), (NULL, '2802am', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, NULL), (NULL, '2803am', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, NULL), (NULL, '2309am', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, NULL), (NULL, '2010ac', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, NULL), (NULL, '2510ac', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, NULL), (NULL, 'fc347cs', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, NULL), (NULL, '2802af', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, NULL), (NULL, '8508a', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, NULL), (NULL, '5518a', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, NULL), (NULL, '3518ac', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, NULL);

CREATE TABLE `product_manufacturer_models` ( `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT, `manufacturer_id` tinyint(3) unsigned NOT NULL, `model_id` tinyint(3) unsigned NOT NULL, `created_at` timestamp NOT NULL DEFAULT current_timestamp(), `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(), `deleted_at` timestamp NULL DEFAULT NULL, PRIMARY KEY (`id`), CONSTRAINT `manufacturer_model` UNIQUE (`manufacturer_id`, `model_id`), CONSTRAINT `FK_manufacturer_id` FOREIGN KEY (`manufacturer_id`) REFERENCES `product_manufacturers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE, CONSTRAINT `FK_model_id` FOREIGN KEY (`model_id`) REFERENCES `product_models` (`id`) ON DELETE CASCADE ON UPDATE CASCADE ) ENGINE=InnoDB DEFAULT CHARSET=utf8

INSERT INTO `product_manufacturer_models` (`id`, `manufacturer_id`, `model_id`, `created_at`, `updated_at`, `deleted_at`) VALUES (NULL, '6', '1', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, NULL), (NULL, '6', '2', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, NULL), (NULL, '6', '3', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, NULL), (NULL, '6', '4', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, NULL), (NULL, '6', '5', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, NULL), (NULL, '6', '6', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, NULL), (NULL, '6', '7', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, NULL), (NULL, '6', '8', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, NULL), (NULL, '6', '9', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, NULL), (NULL, '6', '10', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, NULL), (NULL, '6', '11', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, NULL), (NULL, '6', '12', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, NULL), (NULL, '6', '13', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, NULL), (NULL, '6', '14', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, NULL), (NULL, '6', '15', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, NULL), (NULL, '6', '16', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, NULL), (NULL, '6', '17', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, NULL), (NULL, '6', '18', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, NULL), (NULL, '6', '19', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, NULL), (NULL, '6', '20', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, NULL), (NULL, '6', '21', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, NULL);

CREATE TABLE `product_categories` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `product_category` varchar(30) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE(`product_category`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `product_categories` (`id`, `product_category`, `created_at`, `updated_at`, `deleted_at`) VALUES (NULL, 'mfps', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, NULL), (NULL, 'computers', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, NULL), (NULL, 'printers', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, NULL), (NULL, 'software', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, NULL);

CREATE TABLE `product_category_models` ( `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT, `product_category_id` tinyint(3) unsigned NOT NULL, `product_model_id` tinyint(3) unsigned NOT NULL, `created_at` timestamp NOT NULL DEFAULT current_timestamp(), `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(), `deleted_at` timestamp NULL DEFAULT NULL, PRIMARY KEY (`id`), CONSTRAINT `product_category_model` UNIQUE (`product_category_id`, `product_model_id`), CONSTRAINT `FK_product_category_id` FOREIGN KEY (`product_category_id`) REFERENCES `product_categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE, CONSTRAINT `FK_product_model_id` FOREIGN KEY (`product_model_id`) REFERENCES `product_models` (`id`) ON DELETE CASCADE ON UPDATE CASCADE ) ENGINE=InnoDB DEFAULT CHARSET=utf8

INSERT INTO `product_category_models` (`id`, `product_category_id`, `product_model_id`, `created_at`, `updated_at`, `deleted_at`) VALUES (NULL, '1', '1', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, NULL), (NULL, '1', '2', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, NULL), (NULL, '1', '3', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, NULL), (NULL, '1', '4', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, NULL), (NULL, '1', '5', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, NULL), (NULL, '1', '6', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, NULL), (NULL, '1', '7', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, NULL), (NULL, '1', '8', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, NULL), (NULL, '1', '9', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, NULL), (NULL, '1', '10', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, NULL), (NULL, '1', '11', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, NULL), (NULL, '1', '12', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, NULL), (NULL, '1', '13', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, NULL), (NULL, '1', '14', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, NULL), (NULL, '1', '15', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, NULL), (NULL, '1', '16', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, NULL), (NULL, '1', '17', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, NULL), (NULL, '1', '18', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, NULL), (NULL, '1', '19', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, NULL), (NULL, '1', '20', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, NULL), (NULL, '1', '21', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, NULL);

CREATE TABLE `page_parents` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `page_id` tinyint(3) unsigned NOT NULL,
  `page_parent_id` tinyint(3) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `page_parent` UNIQUE (`page_id`, `page_parent_id`),
  CONSTRAINT `FK_child_page_id` FOREIGN KEY (`page_id`)
    REFERENCES `pages` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `FK_page_parent_id` FOREIGN KEY (`page_parent_id`)
    REFERENCES `pages` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `pages` (`id`, `page`, `created_at`, `updated_at`, `deleted_at`) VALUES (NULL, 'mfps', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, NULL), (NULL, 'computers', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, NULL), (NULL, 'software', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, NULL), (NULL, 'printers', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, NULL);

INSERT INTO `page_parents` (`id`, `page_id`, `page_parent_id`, `created_at`, `updated_at`, `deleted_at`) VALUES (NULL, '6', '2', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, NULL), (NULL, '7', '2', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, NULL), (NULL, '9', '2', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, NULL), (NULL, '8', '2', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, NULL);
