{* login.tpl *}
{load_presentation_object filename="login" classname="login" assign="obj"}
<div class="login_form">
    <form method="post" action="{$obj->mLinkToLogin}">                    
        <span style="display:inline-block;width:80px;text-align:left;">Логин:</span>
        <input type="text" name="login" value=""/>
        <br>
        <span style="display:inline-block;width:80px;text-align:left;">Пароль:</span>
        <input type="password" name="password"/>
        <br>
        <input type="submit" name="Login" value="Войти"/>                    
        <input type="submit" name="UnLogin" value="Выйти"/>
    </form>
</div>