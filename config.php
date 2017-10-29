<?php
// HTTP
define('HTTP_SERVER', 'http://' . $_SERVER['SERVER_NAME'].'/');
// HTTPS
define('HTTPS_SERVER', 'http://' . $_SERVER['SERVER_NAME'].'/');
// DIR
define('DIR_APPLICATION', '/app/catalog/');
define('DIR_SYSTEM', '/app/system/');
define('DIR_LANGUAGE', '/app/catalog/language/');
define('DIR_TEMPLATE', '/app/catalog/view/theme/');
define('DIR_CONFIG', '/app/system/config/');
define('DIR_IMAGE', '/app/image/');
define('DIR_CACHE', '/app/system/storage/cache/');
define('DIR_DOWNLOAD', '/app/system/storage/download/');
define('DIR_LOGS', '/app/system/storage/logs/');
define('DIR_MODIFICATION', '/app/system/storage/modification/');
define('DIR_UPLOAD', '/app/system/storage/upload/');

// DB
define('DB_DRIVER', 'mysqli');
define('DB_HOSTNAME', 'localhost');
define('DB_USERNAME', 'root');
define('DB_PASSWORD', '');
define('DB_DATABASE', 'oc2');
define('DB_PORT', '3306');
define('DB_PREFIX', 'oc_');
