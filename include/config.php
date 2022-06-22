<?php 
define('SITE_ROOT', dirname(dirname(__FILE__)));
define('PRESENTATION_DIR', SITE_ROOT.'/presentation/');
define('BUSINESS_DIR', SITE_ROOT.'/business/');

define('SMARTY_DIR', SITE_ROOT.'/libs/smarty/');
define('TEMPLATE_DIR', PRESENTATION_DIR.'templates');
define('COMPILE_DIR', PRESENTATION_DIR.'templates_c');
define('CONFIG_DIR', SITE_ROOT.'/include/configs');

define('DB_PERSISTENCY', 'true');
define('DB_SERVER', 'localhost');
//define('DB_USERNAME', 'mypost');
//define('DB_PASSWORD', '1234');
//define('DB_DATABASE', 'mypost');
define('DB_USERNAME', 'hmailserver');
define('DB_PASSWORD', '123');
define('DB_DATABASE', 'hmailserver');
define('PDO_DSN', 'mysql:host='.DB_SERVER.';dbname='.DB_DATABASE);

define('IS_WARNING_FATAL', TRUE);
define('DEBUGGING', TRUE);
define('ERROR_TYPES', E_ALL);

define('SEND_ERROR_MAIL', FALSE);
define('ADMIN_ERROR_MAIL', 'administrator@example.com');
define('SENDMAIL_FROM', 'Errors@example.com');
//ini_set('sendmail_from', SENDMAIL_FROM);

define('LOG_ERRORS', FALSE);
define('LOG_ERRORS_FILE' , SITE_ROOT.'\errors_log.txt');
//print_r(LOG_ERRORS_FILE);
//If DEBUGGING=FALSE show this error on site
define('SITE_GENERIC_ERROR_MESSAGE', '<h1>MyPost error!</h1>');
define('HTTP_SERVER_PORT', '80');
define('VIRTUAL_LOCATION', '');
//define('VIRTUAL_LOCATION', '/mypost/');

define ('MAIL_FOLDER', SITE_ROOT.'/hmail/Data/'.$_SERVER['SERVER_NAME']);
?>

