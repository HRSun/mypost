<?php
/* Smarty version 4.1.0, created on 2022-06-07 15:59:53
  from 'M:\www\mypost\presentation\templates\new_email.tpl' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '4.1.0',
  'unifunc' => 'content_629f4bc9017792_95158861',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    'de59deefcd314d303d81a86c4eccb52e20acb14e' => 
    array (
      0 => 'M:\\www\\mypost\\presentation\\templates\\new_email.tpl',
      1 => 1654606789,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
    'file:mailbox_list_list.tpl' => 1,
  ),
),false)) {
function content_629f4bc9017792_95158861 (Smarty_Internal_Template $_smarty_tpl) {
$_smarty_tpl->_checkPlugins(array(0=>array('file'=>'M:\\www\\mypost\\presentation\\smarty_plugins\\function.load_presentation_object.php','function'=>'smarty_function_load_presentation_object',),));
echo smarty_function_load_presentation_object(array('filename'=>"new_email",'classname'=>"newemail",'assign'=>"obj"),$_smarty_tpl);?>

<?php $_smarty_tpl->_subTemplateRender("file:mailbox_list_list.tpl", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array(), 0, false);
?> <div id="content">
    <form class="email_form" action="" method="post" name="email_form">
        <ul>
            <li>
                <h2>Отправка письма</h2>
                <span class="required_notification">* Поля, обязательные к заполнению</span>
            </li>

            <li>
                <label for="email_to">Адрес:</label>
                <input name="email_to" type="email" required value="<?php echo $_smarty_tpl->tpl_vars['obj']->value->mReply['from'];?>
">
                <span class="form_hint">Корректный формат: "your_name@email.com"</span>
            </li>
            <li>
                <label for="email_subject">Тема:</label>
                <input name="email_subject" type="text" required value="<?php echo $_smarty_tpl->tpl_vars['obj']->value->mReply['subject'];?>
">
                <span class="form_hint">Корректный формат: "Some subject"</span>
            </li>
            <li>
                <label for="email_message">Сообщение:</label>
                <textarea name="email_message" cols="40" rows="12" required><?php echo $_smarty_tpl->tpl_vars['obj']->value->mReply['text'];?>
</textarea>
            </li>

            <li>
                <button class="email_submit" type="submit" name="email_send">Отправить письмо</button>
            </li>
        </ul>
    </form>
</div><?php }
}
