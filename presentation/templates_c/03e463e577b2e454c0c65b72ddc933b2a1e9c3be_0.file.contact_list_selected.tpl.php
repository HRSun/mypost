<?php
/* Smarty version 4.1.0, created on 2022-06-06 12:23:22
  from 'M:\www\mypost\presentation\templates\contact_list_selected.tpl' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '4.1.0',
  'unifunc' => 'content_629dc78ae08b12_45826422',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '03e463e577b2e454c0c65b72ddc933b2a1e9c3be' => 
    array (
      0 => 'M:\\www\\mypost\\presentation\\templates\\contact_list_selected.tpl',
      1 => 1654507398,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_629dc78ae08b12_45826422 (Smarty_Internal_Template $_smarty_tpl) {
if ($_smarty_tpl->tpl_vars['obj']->value->mUpdateContactInfo) {?>
    <p>Contact updated</p>
<?php }?>
<form class="contact_form" action="" method="POST">
    <ul>
        <li>
            <h2>Контактная информация: 
                <?php if ($_smarty_tpl->tpl_vars['obj']->value->mContactBrief[$_GET['ContactId']]['contact_name'] != NULL) {?>
                <?php echo $_smarty_tpl->tpl_vars['obj']->value->mContactBrief[$_GET['ContactId']]['contact_name'];?>

                <?php } else { ?>
                    <span>Имя отсутствует</span>
                <?php }?>
            </h2>
            <span class="required_notification">* Поля, обязательные к заполнению</span>
        </li>

        <li>
            <label for="contact_name">Имя:</label>
            <input autocomplete="contact_name" name="contact_name" type="text" 
                   value="<?php echo $_smarty_tpl->tpl_vars['obj']->value->mContactBrief[$_GET['ContactId']]['contact_name'];?>
"
                   >
        </li>

        <!-- 
        <p>
            <label for="contact_lastname">Last Name:</label>
            <input name="contact_lastname" type="text">
        </p>
        -->
        <li>
            <label for="contact_email">Email:</label>
            <input name="contact_email" type="email"
                   value="<?php echo $_smarty_tpl->tpl_vars['obj']->value->mContactBrief[$_GET['ContactId']]['contact_email'];?>
"
                    required>
            <span class="form_hint">Пример: "your_name@email.com"</span>
            <span><?php echo $_smarty_tpl->tpl_vars['obj']->value->mContactEmailError;?>
</span>
        </li>

        <li>
            <label for="contact_folder">Почтовая папка:</label>
            <input name="contact_foldername" type="text"
                   value="<?php echo $_smarty_tpl->tpl_vars['obj']->value->mContactBrief[$_GET['ContactId']]['folder_name'];?>
"
                   required>
            <span class="form_hint">Пример: "Текст"</span>
            <span ><?php echo $_smarty_tpl->tpl_vars['obj']->value->mContactFolderError;?>
</span>
        </li>
        <li>
            <button class="submit" type="submit" name="update_contact" value="Send">Обновить</button>
        </li>    
    </ul>
</form>
<?php }
}
