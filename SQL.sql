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
