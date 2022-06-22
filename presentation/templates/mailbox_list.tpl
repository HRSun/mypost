{* mailbox_list.tpl *}
{load_presentation_object filename="mailbox_list" classname="mailboxlist" assign="obj1"}
{include file="mailbox_list_list.tpl" scope=parent}
<div id="content">
    {if $smarty.get.MessageId}
        {if $smarty.get.MailboxId eq 0}            
        <div class="message_button">
            <ul>
                <li class="create_folder">
                    <form method="post" action="">
                    <input type="submit" name="" value="Создать папку">
                    <input type="hidden" name="user_email" value="{$obj1->mCurrentUserEmail.from}">
                    <input class="cfi" type="text" name="create_folder_name" value="{$obj1->folderNameExist}" required placeholder=""> {* {$obj->mCurrentUserEmail.from|regex_replace:'([^@]+)':''}" *}
                    {if ($obj1->mErrorCreateFolder|count_characters) neq 0}
                        <span>{$obj1->mErrorCreateFolder}</span>
                    {else}
                        {$obj1->mCreateFolder}
                    {/if}
                    </form>                    
                </li>
                
            </ul>
        </div>
        {/if}
        <div class="message">
            <div class="message_subject">
                <p>Тема: {$obj1->mCurrentUserEmail.subject}</p> 
                <p>От кого: {$obj1->mCurrentUserEmail.from}</p>
            </div>
            <div class="message_text">
                <pre>{$obj1->mCurrentUserEmail.text}</pre>
            </div>
            
            <!-- Reply message form-->
            <form class="reply" method="post" action="index.php?PageId=3">
                <!--<input type="hidden" name="reply_to" value="{$obj1->mCurrentUserEmail.from}">
                <input type="hidden" name="reply_subject" value="{$obj1->mCurrentUserEmail.subject}">
                <input type="hidden" name="reply_message_text" value="{$obj1->mCurrentUserEmail.text}"> -->
                <input type="hidden" name="reply_message_id" value="{$obj1->mCurrentUserEmail.messageId}">
                <input type="submit" name="reply_message" value="Ответить">
            </form>
        </div>
    <!--{*else if empty($obj->mUserEmailsFolder)*}
        Mailbox empty-->
    {else}
     {if !empty($obj->mUserEmailsFolder)}   
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
            {section name=k loop=$obj->mUserEmailsFolder}
                {*if $obj->mSelectedMailbox eq $obj->mUserEmailsFolder[k].contact_id*}
                <tr>
                    <td>{$obj->mUserEmailsFolder[k].messagefrom}</td>
                    <td>
                        <a href="{$link_to_mailbox}&MessageId={$obj->mUserEmailsFolder[k].messagefilename}">
                            {$obj->mUserEmailsFolder[k].messagesubject}
                        </a>
                    </td>
                    <td>{$obj->mUserEmailsFolder[k].messagesize} byte</td>
                    <td>{$obj->mUserEmailsFolder[k].messagecreatetime}</td>                    
                </tr>
                {*/if*}
            {/section}           
        </tbody>
    </table>
        {else}
            <div class="folder_empty">
                <p>Folder empty</p>
            </div>   
       {/if}         
    {/if}
</div>