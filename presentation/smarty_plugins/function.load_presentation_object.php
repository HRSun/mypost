<?php 
function smarty_function_load_presentation_object($params, Smarty_Internal_Template $template)
{
    //print_r($params);
    //print_r($template);
    require_once PRESENTATION_DIR.$params['filename'].'.php';
    
    if($params['classname'])
        $className=$params['classname'];
    else
        $className=str_replace(' ', '', ucwords(str_replace('_', ' ', $params['filename'])));
    
    $obj=new $className();
    
    if(method_exists($obj, 'init'))
    {
        $obj->init();
    }
    
//    echo "<pre>\nFrom init:";
//    var_dump($obj);
//    echo "\nEnd init:</pre>";
    
    $template->assign($params['assign'], $obj);
}
?>

