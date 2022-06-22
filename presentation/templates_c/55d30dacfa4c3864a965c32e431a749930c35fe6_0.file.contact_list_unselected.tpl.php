<?php
/* Smarty version 4.1.0, created on 2022-05-29 19:23:32
  from 'M:\www\mypost\presentation\templates\contact_list_unselected.tpl' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '4.1.0',
  'unifunc' => 'content_62939e04826571_03370429',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '55d30dacfa4c3864a965c32e431a749930c35fe6' => 
    array (
      0 => 'M:\\www\\mypost\\presentation\\templates\\contact_list_unselected.tpl',
      1 => 1653841410,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_62939e04826571_03370429 (Smarty_Internal_Template $_smarty_tpl) {
?><div class="contacts_none">
    <p>Welcome</p>
    <p>MyPost</p>
    <p>Address Book</p>
    <p style="color:red; font-size:16px;"><?php echo $_smarty_tpl->tpl_vars['obj']->value->contactIdInvalid;?>
</p>
</div><?php }
}
