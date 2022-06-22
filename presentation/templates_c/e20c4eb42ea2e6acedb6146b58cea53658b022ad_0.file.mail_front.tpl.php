<?php
/* Smarty version 4.1.0, created on 2022-06-02 01:48:42
  from 'M:\www\mypost\presentation\templates\mail_front.tpl' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '4.1.0',
  'unifunc' => 'content_6297ecca58ec40_12939501',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    'e20c4eb42ea2e6acedb6146b58cea53658b022ad' => 
    array (
      0 => 'M:\\www\\mypost\\presentation\\templates\\mail_front.tpl',
      1 => 1654123716,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_6297ecca58ec40_12939501 (Smarty_Internal_Template $_smarty_tpl) {
$_smarty_tpl->_checkPlugins(array(0=>array('file'=>'M:\\www\\mypost\\presentation\\smarty_plugins\\function.load_presentation_object.php','function'=>'smarty_function_load_presentation_object',),));
echo smarty_function_load_presentation_object(array('filename'=>"mail_front",'classname'=>"mailfront",'assign'=>"obj"),$_smarty_tpl);?>

<html>
    <head>
        <link type="text/css" rel="stylesheet" href="styles/reset-modal.css" />
        <link type="text/css" rel="stylesheet" href="styles/style-modal.css" />
        <link type="text/css" rel="stylesheet" href="styles/styles.css" />        
        <?php echo '<script'; ?>
 src="source/modernizr.js"><?php echo '</script'; ?>
> <!-- Modernizr -->
    </head>
    <body>
        <div id="header">
            <?php if ($_SESSION['auth_id']) {?>
            <!-- Place button for Email, Contacts, New Email-->
            <?php
$__section_i_0_loop = (is_array(@$_loop=$_smarty_tpl->tpl_vars['obj']->value->mPageId) ? count($_loop) : max(0, (int) $_loop));
$__section_i_0_total = $__section_i_0_loop;
$_smarty_tpl->tpl_vars['__smarty_section_i'] = new Smarty_Variable(array());
if ($__section_i_0_total !== 0) {
for ($__section_i_0_iteration = 1, $_smarty_tpl->tpl_vars['__smarty_section_i']->value['index'] = 0; $__section_i_0_iteration <= $__section_i_0_total; $__section_i_0_iteration++, $_smarty_tpl->tpl_vars['__smarty_section_i']->value['index']++){
?>
                <?php $_smarty_tpl->_assignInScope('selected', '');?>
                <?php if ($_smarty_tpl->tpl_vars['obj']->value->mSelectedPageId == $_smarty_tpl->tpl_vars['obj']->value->mPageId[(isset($_smarty_tpl->tpl_vars['__smarty_section_i']->value['index']) ? $_smarty_tpl->tpl_vars['__smarty_section_i']->value['index'] : null)]['page_id']) {?>
                    <?php $_smarty_tpl->_assignInScope('selected', "active");?>
                    <?php $_smarty_tpl->_assignInScope('template', ((string)$_smarty_tpl->tpl_vars['obj']->value->mPageId[(isset($_smarty_tpl->tpl_vars['__smarty_section_i']->value['index']) ? $_smarty_tpl->tpl_vars['__smarty_section_i']->value['index'] : null)]['page_template']));?>
                <?php }?>                
                <a  href="<?php echo $_smarty_tpl->tpl_vars['obj']->value->mPageId[(isset($_smarty_tpl->tpl_vars['__smarty_section_i']->value['index']) ? $_smarty_tpl->tpl_vars['__smarty_section_i']->value['index'] : null)]['link_to_page'];?>
">
                    
                    <div class="<?php echo $_smarty_tpl->tpl_vars['obj']->value->mPageId[(isset($_smarty_tpl->tpl_vars['__smarty_section_i']->value['index']) ? $_smarty_tpl->tpl_vars['__smarty_section_i']->value['index'] : null)]['page_class'];?>
 <?php echo $_smarty_tpl->tpl_vars['selected']->value;?>
">
                        <?php echo $_smarty_tpl->tpl_vars['obj']->value->mPageId[(isset($_smarty_tpl->tpl_vars['__smarty_section_i']->value['index']) ? $_smarty_tpl->tpl_vars['__smarty_section_i']->value['index'] : null)]['page_name'];?>
    
                    </div>
                </a>            
            <?php
}
}
?>
            <?php }?>
                        <div  class="login_form">                
                <p class='welcome_to_my_post'>Welcome to MyPost
                <?php if ($_smarty_tpl->tpl_vars['obj']->value->mLoginError) {?>
                    <br>
                    <span class='LoginError'><?php echo $_smarty_tpl->tpl_vars['obj']->value->mLoginError;?>
 for <?php echo $_smarty_tpl->tpl_vars['obj']->value->mEmail;?>
</span>
                <?php } elseif ($_smarty_tpl->tpl_vars['obj']->value->mAccountExisted != 0) {?>
                    <br>
                    <span class='LoginError'><?php echo $_smarty_tpl->tpl_vars['obj']->value->mAccountExisted;?>
</span>
                <?php }?>
                <?php if ($_SESSION['auth_id']) {?>
                    <br><?php echo $_SESSION['user_email'];?>
</p>
                <?php }?>
                
                <?php if (!$_SESSION['auth_id']) {?>
                    <nav class="main-nav">
                        <ul><!-- inser more links here -->
                            <li><a class="cd-signin" href="#0">Войти</a></li>	
                            <li><a class="cd-signup" href="#0">Регистрация</a></li>
                        </ul>
                    </nav>
                    <nav class="main-nav">
                        <ul><!-- inser more links here -->
                            				
                        </ul>
                    </nav>
                <?php }?>
                <?php if ($_SESSION['auth_id']) {?>
                    <nav class="main-nav">
                        <ul><!-- inser more links here -->
                            <li>
                                <form  method="post" action="">                    
                                <input  class="cd-signoff" type="submit" name="Logoff" value="Выйти">                   
                                </form>
                            </li>
                        </ul>
                    </nav>
                <?php }?>
            </div>
        </div>
        <?php if (!$_SESSION['auth_id']) {?>
	<div class="cd-user-modal"> <!-- this is the entire modal form, including the background -->
            <div class="cd-user-modal-container"> <!-- this is the container wrapper -->
		<ul class="cd-switcher">
                    <li><a href="#0">Панель входа на сайт</a>
                    <li><a href="#0">Регистрация</a></li>
                        <!--<span>(введите учетные данные выданные вашим куратором по району/округу по месту проживания в соответствии с ГОСТом Р 51141-98)</span>-->
                    </li>			
		</ul>
            <div id="cd-login">
                <form class="cd-form" method="post" action="">
                    <p class="fieldset">
                        <label class="image-replace cd-email" for="signin-email">E-mail</label>
                        <input class="full-width has-padding has-border" id="signin-email" type="text" name="email" placeholder="E-mail">
                        <span class="cd-error-message">Error message here!</span>
                    </p>
                    <p class="fieldset">
                        <label class="image-replace cd-password" for="signin-password">Password</label>
                        <input class="full-width has-padding has-border" id="signin-password" type="password" name="password"  placeholder="Password">
                        <a href="#0" class="hide-password">Show</a>
                        <span class="cd-error-message">Error message here!</span>                                                
                    </p>
                    
                    <p class="fieldset">
                        <!-- Remove in js the handler that blocks the default behavior on line 91-->
                        <input class="full-width has-padding" type="submit" name="Login" value="Войти">
                    </p>                    
                </form>
            </div>
                <div id="cd-signup"> <!-- sign up form -->
                    <form class="cd-form" method="post" action="">
                        
			<p class="fieldset">
                            <label class="image-replace cd-email" for="signup-email">E-mail</label>
                            <input class="full-width has-padding has-border" id="signup-email" name="new_account_email" type="text" placeholder="E-mail">
                            <span class="cd-error-message">Error message here!</span>
			</p>
			<p class="fieldset">
                            <label class="image-replace cd-password" for="signup-password">Password</label>
                            <input class="full-width has-padding has-border" id="signup-password" name="new_account_password" type="password"  placeholder="Password">
                            <a href="#0" class="hide-password">Show</a>
                            <span class="cd-error-message">Error message here!</span>
			</p>
			
			<p class="fieldset">
                            <input class="full-width has-padding" type="submit" name="create_account" value="Зарегистрироваться">
        		</p>
                    </form>
		<!-- <a href="#0" class="cd-close-form">Close</a> -->
		</div> <!-- cd-signup -->
            </div> <!-- cd-user-modal-container -->
	</div> <!-- cd-user-modal -->
        <?php }?>
        
             

        <?php if ($_SESSION['auth_id']) {?>
            
            <?php ob_start();
echo $_smarty_tpl->tpl_vars['template']->value;
$_prefixVariable1 = ob_get_clean();
$_smarty_tpl->_subTemplateRender($_prefixVariable1, $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array(), 0, true);
?>
            
        <?php }?>
        
        <?php if (!$_SESSION['auth_id']) {?>
            <div class="image_back">
                <img width="1200" height="600" src="images/back_logoff/back_logoff<?php echo $_smarty_tpl->tpl_vars['obj']->value->mBackground;?>
.jpg">
            </div>
        <?php }?>
        <div id="footer">&copy; MyPost Email Service</div>
        <?php echo '<script'; ?>
 src="source/jquery.min.js"><?php echo '</script'; ?>
>
        <?php echo '<script'; ?>
 src="source/main.js"><?php echo '</script'; ?>
> <!-- Gem jQuery -->  
    </body>
</html><?php }
}
