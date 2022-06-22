<?php
/* Smarty version 4.1.0, created on 2022-05-19 11:28:49
  from 'M:\www\mypost\presentation\templates\login.tpl' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '4.1.0',
  'unifunc' => 'content_6285ffc1e01b92_75736661',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '44b9e35071264ef69fe9b8d3243d593245fc85df' => 
    array (
      0 => 'M:\\www\\mypost\\presentation\\templates\\login.tpl',
      1 => 1652948924,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_6285ffc1e01b92_75736661 (Smarty_Internal_Template $_smarty_tpl) {
$_smarty_tpl->_checkPlugins(array(0=>array('file'=>'M:\\www\\mypost\\presentation\\smarty_plugins\\function.load_presentation_object.php','function'=>'smarty_function_load_presentation_object',),));
echo smarty_function_load_presentation_object(array('filename'=>"login",'classname'=>"login",'assign'=>"obj"),$_smarty_tpl);?>

<div class="login_form">
    <form method="post" action="<?php echo $_smarty_tpl->tpl_vars['obj']->value->mLinkToLogin;?>
">                    
        <span style="display:inline-block;width:80px;text-align:left;">Логин:</span>
        <input type="text" name="login" value=""/>
        <br>
        <span style="display:inline-block;width:80px;text-align:left;">Пароль:</span>
        <input type="password" name="password"/>
        <br>
        <input type="submit" name="Login" value="Войти"/>                    
        <input type="submit" name="UnLogin" value="Выйти"/>
    </form>
</div><?php }
}
