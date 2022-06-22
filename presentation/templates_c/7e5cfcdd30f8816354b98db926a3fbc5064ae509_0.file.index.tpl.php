<?php
/* Smarty version 4.1.0, created on 2022-05-14 04:04:39
  from 'M:\www\mypost\presentation\templates\index.tpl' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '4.1.0',
  'unifunc' => 'content_627f0027641526_02195168',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '7e5cfcdd30f8816354b98db926a3fbc5064ae509' => 
    array (
      0 => 'M:\\www\\mypost\\presentation\\templates\\index.tpl',
      1 => 1652489905,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
    'file:mailbox_list.tpl' => 1,
  ),
),false)) {
function content_627f0027641526_02195168 (Smarty_Internal_Template $_smarty_tpl) {
?><html>
    <head>
        <link type="text/css" rel="stylesheet" href="styles/styles.css" />
    </head>
    <body>
        <div id="header">
            <a href=""><div class="button_email_active">Почта</div></a>
            <a href=""><div class="button_contacts">Контакты</div></a>
            <a href=""><div class="button_email_new">Новое письмо</div></a>
        </div>
        
        <div id="sidebar">
            <?php $_smarty_tpl->_subTemplateRender("file:mailbox_list.tpl", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array(), 0, false);
?>    
        </div>
        <div id="content">
            <h2>Алтарь демона </h2>
            <p>Утром, при ярком солнечном свете, всё выглядело совсем не так и мрачно, как 
                планировалось, а даже наоборот. От свечей остались одни потёки, «кровь» 
                смотрелась как краска, а перья почти целиком разлетелись от ветра. Хорошо 
                сохранились только рисунки мелом, но и они были скорее прикольные, чем злые и загадочные. 
                Дети с неподдельным интересом разглядывали изображения, но без тени тех чувств, которые 
                испытали взрослые ночью при луне.</p>
            <p>Тем не менее, оказался один человек, на которого работа произвела большое 
                впечатление, — сторож лагеря. Днём он подошёл к автору «алтаря».</p>
            <p>— Ваша работа? - начал сторож, кивая в сторону площади.<br />
                — А что такое? <br />
                — Ну, как же... Тут кровь..., перья птицы мёртвой..., знаки какие-то страшные нарисованы..., 
                а у вас всё же дети маленькие, они испугаться могут...</p>
        </div>
        <div id="footer">&copy; MyPost Email Service</div>
    </body>
</html><?php }
}
