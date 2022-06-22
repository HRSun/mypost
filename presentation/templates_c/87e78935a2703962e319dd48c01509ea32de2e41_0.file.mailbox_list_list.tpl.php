<?php
/* Smarty version 4.1.0, created on 2022-06-06 03:47:11
  from 'M:\www\mypost\presentation\templates\mailbox_list_list.tpl' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '4.1.0',
  'unifunc' => 'content_629d4e8f7d3ff2_14576482',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '87e78935a2703962e319dd48c01509ea32de2e41' => 
    array (
      0 => 'M:\\www\\mypost\\presentation\\templates\\mailbox_list_list.tpl',
      1 => 1654476226,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_629d4e8f7d3ff2_14576482 (Smarty_Internal_Template $_smarty_tpl) {
$_smarty_tpl->_checkPlugins(array(0=>array('file'=>'M:\\www\\mypost\\presentation\\smarty_plugins\\function.load_presentation_object.php','function'=>'smarty_function_load_presentation_object',),));
echo smarty_function_load_presentation_object(array('filename'=>"mailbox_list_list",'classname'=>"mailboxlistlist",'assign'=>"obj"),$_smarty_tpl);?>

<div id="sidebar">
<div class="folders">
    <p class="folders-title">Почтовые папки</p>
    <ul class="treeline">
        <li>
        <?php
$__section_i_1_loop = (is_array(@$_loop=$_smarty_tpl->tpl_vars['obj']->value->mMailboxes) ? count($_loop) : max(0, (int) $_loop));
$__section_i_1_total = $__section_i_1_loop;
$_smarty_tpl->tpl_vars['__smarty_section_i'] = new Smarty_Variable(array());
if ($__section_i_1_total !== 0) {
for ($__section_i_1_iteration = 1, $_smarty_tpl->tpl_vars['__smarty_section_i']->value['index'] = 0; $__section_i_1_iteration <= $__section_i_1_total; $__section_i_1_iteration++, $_smarty_tpl->tpl_vars['__smarty_section_i']->value['index']++){
$_smarty_tpl->tpl_vars['__smarty_section_i']->value['last'] = ($__section_i_1_iteration === $__section_i_1_total);
?>
            <?php $_smarty_tpl->_assignInScope('selected', '');?>
            <?php if (($_smarty_tpl->tpl_vars['obj']->value->mSelectedMailbox == $_smarty_tpl->tpl_vars['obj']->value->mMailboxes[(isset($_smarty_tpl->tpl_vars['__smarty_section_i']->value['index']) ? $_smarty_tpl->tpl_vars['__smarty_section_i']->value['index'] : null)]['contact_id'])) {?>
                <?php $_smarty_tpl->_assignInScope('link_to_mailbox', $_smarty_tpl->tpl_vars['obj']->value->mMailboxes[(isset($_smarty_tpl->tpl_vars['__smarty_section_i']->value['index']) ? $_smarty_tpl->tpl_vars['__smarty_section_i']->value['index'] : null)]['link_to_mailbox']);?>
                <?php $_smarty_tpl->_assignInScope('selected', "class=\"selected\"");?>
            <?php }?>            
            <?php if (($_smarty_tpl->tpl_vars['obj']->value->mMailboxes[(isset($_smarty_tpl->tpl_vars['__smarty_section_i']->value['index']) ? $_smarty_tpl->tpl_vars['__smarty_section_i']->value['index'] : null)]['folder_name'] == "INBOX")) {?>                
                    <a <?php echo $_smarty_tpl->tpl_vars['selected']->value;?>
  href="<?php echo $_smarty_tpl->tpl_vars['obj']->value->mMailboxes[(isset($_smarty_tpl->tpl_vars['__smarty_section_i']->value['index']) ? $_smarty_tpl->tpl_vars['__smarty_section_i']->value['index'] : null)]['link_to_mailbox'];?>
">
                       <?php echo mb_strtoupper($_smarty_tpl->tpl_vars['obj']->value->mMailboxes[(isset($_smarty_tpl->tpl_vars['__smarty_section_i']->value['index']) ? $_smarty_tpl->tpl_vars['__smarty_section_i']->value['index'] : null)]['folder_name'], 'UTF-8');?>

                    </a>
            <?php }?>
            <?php if (($_smarty_tpl->tpl_vars['obj']->value->mMailboxes[(isset($_smarty_tpl->tpl_vars['__smarty_section_i']->value['index']) ? $_smarty_tpl->tpl_vars['__smarty_section_i']->value['index'] : null)]['contact_id'] != "0") && ($_smarty_tpl->tpl_vars['obj']->value->mMailboxes[(isset($_smarty_tpl->tpl_vars['__smarty_section_i']->value['index']) ? $_smarty_tpl->tpl_vars['__smarty_section_i']->value['index'] : null)]['contact_id'] != "99999")) {?>
                <?php if ((isset($_smarty_tpl->tpl_vars['__smarty_section_i']->value['index']) ? $_smarty_tpl->tpl_vars['__smarty_section_i']->value['index'] : null) < 2) {?><ul><?php }?>
                    <li <?php echo $_smarty_tpl->tpl_vars['selected']->value;?>
>                
                        <a  href="<?php echo $_smarty_tpl->tpl_vars['obj']->value->mMailboxes[(isset($_smarty_tpl->tpl_vars['__smarty_section_i']->value['index']) ? $_smarty_tpl->tpl_vars['__smarty_section_i']->value['index'] : null)]['link_to_mailbox'];?>
"
                            
                            <?php if (strlen($_smarty_tpl->tpl_vars['obj']->value->mMailboxes[(isset($_smarty_tpl->tpl_vars['__smarty_section_i']->value['index']) ? $_smarty_tpl->tpl_vars['__smarty_section_i']->value['index'] : null)]['contact_name']) != 0) {?>
                                       data-tooltip="<?php echo $_smarty_tpl->tpl_vars['obj']->value->mMailboxes[(isset($_smarty_tpl->tpl_vars['__smarty_section_i']->value['index']) ? $_smarty_tpl->tpl_vars['__smarty_section_i']->value['index'] : null)]['contact_name'];?>
">
                            <?php } else { ?>
                                data-tooltip="<?php echo $_smarty_tpl->tpl_vars['obj']->value->mMailboxes[(isset($_smarty_tpl->tpl_vars['__smarty_section_i']->value['index']) ? $_smarty_tpl->tpl_vars['__smarty_section_i']->value['index'] : null)]['contact_email'];?>
">
                            <?php }?>
                            <?php echo $_smarty_tpl->tpl_vars['obj']->value->mMailboxes[(isset($_smarty_tpl->tpl_vars['__smarty_section_i']->value['index']) ? $_smarty_tpl->tpl_vars['__smarty_section_i']->value['index'] : null)]['folder_name'];?>
                           
                        </a>
                    </li>
                <?php if ((isset($_smarty_tpl->tpl_vars['__smarty_section_i']->value['last']) ? $_smarty_tpl->tpl_vars['__smarty_section_i']->value['last'] : null)) {?></ul><?php }?>
            <?php }?>
            
        <?php
}
}
?>
        </li>
        <!-- <li>
                    </li> -->
    </ul>   
</div>
</div><?php }
}
