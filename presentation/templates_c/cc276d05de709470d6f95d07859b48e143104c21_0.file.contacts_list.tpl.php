<?php
/* Smarty version 4.1.0, created on 2022-06-01 22:18:48
  from 'M:\www\mypost\presentation\templates\contacts_list.tpl' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '4.1.0',
  'unifunc' => 'content_6297bb9819e5d6_85098090',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    'cc276d05de709470d6f95d07859b48e143104c21' => 
    array (
      0 => 'M:\\www\\mypost\\presentation\\templates\\contacts_list.tpl',
      1 => 1654111124,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_6297bb9819e5d6_85098090 (Smarty_Internal_Template $_smarty_tpl) {
$_smarty_tpl->_checkPlugins(array(0=>array('file'=>'M:\\www\\mypost\\presentation\\smarty_plugins\\function.load_presentation_object.php','function'=>'smarty_function_load_presentation_object',),));
echo smarty_function_load_presentation_object(array('filename'=>"contacts_list",'classname'=>"ContactsList",'assign'=>"obj"),$_smarty_tpl);?>

<div id="sidebar">
    <ul class="contacts">
        <?php
$_from = $_smarty_tpl->smarty->ext->_foreach->init($_smarty_tpl, $_smarty_tpl->tpl_vars['obj']->value->mContactBrief, 'contact');
$_smarty_tpl->tpl_vars['contact']->do_else = true;
if ($_from !== null) foreach ($_from as $_smarty_tpl->tpl_vars['contact']->value) {
$_smarty_tpl->tpl_vars['contact']->do_else = false;
?>
            <?php $_smarty_tpl->_assignInScope('selected', '');?>
            <?php if ($_smarty_tpl->tpl_vars['obj']->value->mCurrentContactId == $_smarty_tpl->tpl_vars['contact']->value['contact_id']) {?>
                <?php $_smarty_tpl->_assignInScope('selected', "active");?>
            <?php }?>
            <li class="<?php echo $_smarty_tpl->tpl_vars['selected']->value;?>
">
                <input hidden="" name="contact_id" value="<?php echo $_smarty_tpl->tpl_vars['contact']->value;?>
">                
                                   
                <a class="contact_link " href="<?php echo $_smarty_tpl->tpl_vars['contact']->value['contact_link'];?>
">
                    <?php if (strlen($_smarty_tpl->tpl_vars['contact']->value['contact_name']) != 0) {?>
                    <p class="contact_name">Имя: <?php echo $_smarty_tpl->tpl_vars['contact']->value['contact_name'];?>
</p>
                <?php } else { ?>
                    <p class="contact_unavailable">Имя: <?php echo $_smarty_tpl->tpl_vars['contact']->value['contact_email'];?>
</p>
                <?php }?> 
                <span>Email: <?php echo $_smarty_tpl->tpl_vars['contact']->value['contact_email'];?>
</span>
                </a>
            </li>
            
        <?php
}
$_smarty_tpl->smarty->ext->_foreach->restore($_smarty_tpl, 1);?>
    </ul>        
</div>
<div id="content">
    
        <?php $_smarty_tpl->_subTemplateRender($_smarty_tpl->tpl_vars['obj']->value->mContactTemplate, $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array(), 2, true);
?>
   
</div><?php }
}
