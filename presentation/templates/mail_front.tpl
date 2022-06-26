{* mail_front.tpl *}
{load_presentation_object filename="mail_front" classname="mailfront" assign="obj"}
<html>
    <head>
        <link type="text/css" rel="stylesheet" href="styles/reset-modal.css" />
        <link type="text/css" rel="stylesheet" href="styles/style-modal.css" />
        <link type="text/css" rel="stylesheet" href="styles/styles.css" />        
        <script src="source/modernizr.js"></script> <!-- Modernizr -->
    </head>
    <body>
        <div id="header">
            {if $smarty.session.auth_id}
            <!-- Place button for Email, Contacts, New Email-->
            {section name=i loop=$obj->mPageId}
                {assign var=selected value=""}
                {if $obj->mSelectedPageId==$obj->mPageId[i].page_id}
                    {assign var=selected value="active"}
                    {assign var=template value="{$obj->mPageId[i].page_template}"}
                {/if}                
                <a  href="{$obj->mPageId[i].link_to_page}">
                    
                    <div class="{$obj->mPageId[i].page_class} {$selected}">
                        {$obj->mPageId[i].page_name}    
                    </div>
                </a>            
            {/section}
            {/if}
            {*{include file=$obj->mLoginOrLoggedCell}*}
            <div  class="login_form">                
                <p class='welcome_to_my_post'>Welcome to MyPost
                {if $obj->mLoginError}
                    <br>
                    <span class='LoginError'>{$obj->mLoginError} for {$obj->mEmail}</span>
                {elseif $obj->mAccountExisted neq 0}
                    <br>
                    <span class='LoginError'>{$obj->mAccountExisted}</span>
                {/if}
                {if $smarty.session.auth_id}
                    <br>{$smarty.session.user_email}</p>
                {/if}
                
                {if !$smarty.session.auth_id}
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
                {/if}
                {if $smarty.session.auth_id}
                    <nav class="main-nav">
                        <ul><!-- inser more links here -->
                            <li>
                                <form  method="post" action="">                    
                                <input  class="cd-signoff" type="submit" name="Logoff" value="Выйти">                   
                                </form>
                            </li>
                        </ul>
                    </nav>
                {/if}
            </div>
        </div>
        {if !$smarty.session.auth_id}
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
        {/if}
        
             

        {if $smarty.session.auth_id}
            
            {include file={$template}}
            
        {/if}
        
        {if !$smarty.session.auth_id}
            {if $obj->mBackground eq "webm"}
                <div class="video_back">
                    <video width="1200" height="600" autoplay="autoplay" loop="loop">
                        <source src="images/back_logoff/RobShields-cyberpunk-neon-daemons.webm" type='video/webm; codecs="vp8, vorbis"'>
                    </video>
                </div>
            {else}
            <div class="image_back">
                <img  src="{$obj->mBackground}">
            </div>
            {/if}            
        {/if}
        <div id="footer">&copy; MyPost Email Service</div>
        <script src="source/jquery.min.js"></script>
        <script src="source/main.js"></script> <!-- Gem jQuery -->  
    </body>
</html>