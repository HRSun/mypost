<?php
session_start();
//print_r("Welcome to MyPost.xy");
require_once 'include/config.php';
require_once BUSINESS_DIR.'error_handler.php';

ErrorHandler::SetHandler();
require_once PRESENTATION_DIR.'application.php';
require_once PRESENTATION_DIR.'link.php';
//require_once PRESENTATION_DIR.'link.php';
require_once BUSINESS_DIR.'database_handler.php';
require_once BUSINESS_DIR.'mailbox.php';
require_once BUSINESS_DIR.'mail_user.php';
require_once BUSINESS_DIR.'mail_file.php';
require_once BUSINESS_DIR.'mail_contacts.php';

//Коррекция URL
//Link::CheckRequest();
//require_once ('inexistent_file.php');

$application=new Application();
//$application->testInstall();
//print_r("Welcome to MyPost.xy");
$application->display('mail_front.tpl');

DatabaseHandler::Close();
?>