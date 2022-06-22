<?php
/* Smarty version 4.1.0, created on 2022-06-07 17:32:52
  from 'M:\www\mypost\presentation\templates\mailbox_list.tpl' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '4.1.0',
  'unifunc' => 'content_629f6194971b85_83149562',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    'e98f9c02fdef1bf8a891cc0daca96b895fdea53a' => 
    array (
      0 => 'M:\\www\\mypost\\presentation\\templates\\mailbox_list.tpl',
      1 => 1654612368,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
    'file:mailbox_list_list.tpl' => 1,
  ),
),false)) {
function content_629f6194971b85_83149562 (Smarty_Internal_Template $_smarty_tpl) {
$_smarty_tpl->_checkPlugins(array(0=>array('file'=>'M:\\www\\mypost\\presentation\\smarty_plugins\\function.load_presentation_object.php','function'=>'smarty_function_load_presentation_object',),));
echo smarty_function_load_presentation_object(array('filename'=>"mailbox_list",'classname'=>"mailboxlist",'assign'=>"obj1"),$_smarty_tpl);?>

<?php $_smarty_tpl->_subTemplateRender("file:mailbox_list_list.tpl", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array(), 2, false);
?>
<div id="content">
    <?php if ($_GET['MessageId']) {?>
        <?php if ($_GET['MailboxId'] == 0) {?>            
        <div class="message_button">
            <ul>
                <li class="create_folder">
                    <form method="post" action="">
                    <input type="submit" name="" value="Создать папку">
                    <input type="hidden" name="user_email" value="<?php echo $_smarty_tpl->tpl_vars['obj1']->value->mCurrentUserEmail['from'];?>
">
                    <input class="cfi" type="text" name="create_folder_name" value="<?php echo $_smarty_tpl->tpl_vars['obj1']->value->folderNameExist;?>
" required placeholder="">                     <?php if ((preg_match_all('/[^\s]/u',$_smarty_tpl->tpl_vars['obj1']->value->mErrorCreateFolder, $tmp)) != 0) {?>
                        <span><?php echo $_smarty_tpl->tpl_vars['obj1']->value->mErrorCreateFolder;?>
</span>
                    <?php } else { ?>
                        <?php echo $_smarty_tpl->tpl_vars['obj1']->value->mCreateFolder;?>

                    <?php }?>
                    </form>                    
                </li>
                
            </ul>
        </div>
        <?php }?>
        <div class="message">
            <div class="message_subject">
                <p>Тема: <?php echo $_smarty_tpl->tpl_vars['obj1']->value->mCurrentUserEmail['subject'];?>
</p> 
                <p>От кого: <?php echo $_smarty_tpl->tpl_vars['obj1']->value->mCurrentUserEmail['from'];?>
</p>
            </div>
            <div class="message_text">
                <pre><?php echo $_smarty_tpl->tpl_vars['obj1']->value->mCurrentUserEmail['text'];?>
</pre>
            </div>
            
            <!-- Reply message form-->
            <form class="reply" method="post" action="index.php?PageId=3">
                <!--<input type="hidden" name="reply_to" value="<?php echo $_smarty_tpl->tpl_vars['obj1']->value->mCurrentUserEmail['from'];?>
">
                <input type="hidden" name="reply_subject" value="<?php echo $_smarty_tpl->tpl_vars['obj1']->value->mCurrentUserEmail['subject'];?>
">
                <input type="hidden" name="reply_message_text" value="<?php echo $_smarty_tpl->tpl_vars['obj1']->value->mCurrentUserEmail['text'];?>
"> -->
                <input type="hidden" name="reply_message_id" value="<?php echo $_smarty_tpl->tpl_vars['obj1']->value->mCurrentUserEmail['messageId'];?>
">
                <input type="submit" name="reply_message" value="Ответить">
            </form>
        </div>
    <!--        Mailbox empty-->
    <?php } else { ?>
     <?php if (!empty($_smarty_tpl->tpl_vars['obj']->value->mUserEmailsFolder)) {?>   
    <table class="message_table">
        <thead>
        <tr>
            <td>Сообщение от</td>
            <td>Тема</td>
            <td>Размер сообщения</td>
            <td>Время</td>
        </tr>
        </thead>
        <tbody>            
            <?php
$__section_k_0_loop = (is_array(@$_loop=$_smarty_tpl->tpl_vars['obj']->value->mUserEmailsFolder) ? count($_loop) : max(0, (int) $_loop));
$__section_k_0_total = $__section_k_0_loop;
$_smarty_tpl->tpl_vars['__smarty_section_k'] = new Smarty_Variable(array());
if ($__section_k_0_total !== 0) {
for ($__section_k_0_iteration = 1, $_smarty_tpl->tpl_vars['__smarty_section_k']->value['index'] = 0; $__section_k_0_iteration <= $__section_k_0_total; $__section_k_0_iteration++, $_smarty_tpl->tpl_vars['__smarty_section_k']->value['index']++){
?>
                                <tr>
                    <td><?php echo $_smarty_tpl->tpl_vars['obj']->value->mUserEmailsFolder[(isset($_smarty_tpl->tpl_vars['__smarty_section_k']->value['index']) ? $_smarty_tpl->tpl_vars['__smarty_section_k']->value['index'] : null)]['messagefrom'];?>
</td>
                    <td>
                        <a href="<?php echo $_smarty_tpl->tpl_vars['link_to_mailbox']->value;?>
&MessageId=<?php echo $_smarty_tpl->tpl_vars['obj']->value->mUserEmailsFolder[(isset($_smarty_tpl->tpl_vars['__smarty_section_k']->value['index']) ? $_smarty_tpl->tpl_vars['__smarty_section_k']->value['index'] : null)]['messagefilename'];?>
">
                            <?php echo $_smarty_tpl->tpl_vars['obj']->value->mUserEmailsFolder[(isset($_smarty_tpl->tpl_vars['__smarty_section_k']->value['index']) ? $_smarty_tpl->tpl_vars['__smarty_section_k']->value['index'] : null)]['messagesubject'];?>

                        </a>
                    </td>
                    <td><?php echo $_smarty_tpl->tpl_vars['obj']->value->mUserEmailsFolder[(isset($_smarty_tpl->tpl_vars['__smarty_section_k']->value['index']) ? $_smarty_tpl->tpl_vars['__smarty_section_k']->value['index'] : null)]['messagesize'];?>
 byte</td>
                    <td><?php echo $_smarty_tpl->tpl_vars['obj']->value->mUserEmailsFolder[(isset($_smarty_tpl->tpl_vars['__smarty_section_k']->value['index']) ? $_smarty_tpl->tpl_vars['__smarty_section_k']->value['index'] : null)]['messagecreatetime'];?>
</td>                    
                </tr>
                            <?php
}
}
?>           
        </tbody>
    </table>
        <?php } else { ?>
            <div class="folder_empty">
                <p>Folder empty</p>
            </div>   
       <?php }?>         
    <?php }?>
</div><?php }
}
