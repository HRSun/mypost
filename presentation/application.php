<?php 
require_once SMARTY_DIR . 'Smarty.class.php';

class Application extends Smarty {

    public function __construct() {
        parent::__construct();
//        $this->template_dir = TEMPLATE_DIR;
//        $this->compile_dir = COMPILE_DIR;
//        $this->config_dir = CONFIG_DIR;
        //$this->plugins_dir[0] = SMARTY_DIR.'plugins';         
        //$this->plugins_dir[1] = PRESENTATION_DIR.'smarty_plugins';
        //$this->setPluginsDir(array(SMARTY_DIR .'plugins',PRESENTATION_DIR . 'smarty_plugins'));
        $this->setTemplateDir(TEMPLATE_DIR);
        $this->setCompileDir(COMPILE_DIR);
        $this->setConfigDir(CONFIG_DIR);
        $this->setPluginsDir(SMARTY_DIR . 'plugins');//'./libs/smarty/plugins');
        $this->addPluginsDir(PRESENTATION_DIR . 'smarty_plugins');//'./presentation/smarty_plugins');
        //$this->error_reporting = E_ALL & ~E_NOTICE;
        //$this->muteExpectedErrors();
    }
}
?>

