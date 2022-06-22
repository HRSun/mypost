{* new_email.tpl *}
{load_presentation_object filename="new_email" classname="newemail" assign="obj"}
{include file="mailbox_list_list.tpl"} {*scope=parent*}
<div id="content">
    <form class="email_form" action="" method="post" name="email_form">
        <ul>
            <li>
                <h2>Отправка письма</h2>
                <span class="required_notification">* Поля, обязательные к заполнению</span>
            </li>

            <li>
                <label for="email_to">Адрес:</label>
                <input name="email_to" type="email" required value="{$obj->mReply.from}">
                <span class="form_hint">Корректный формат: "your_name@email.com"</span>
            </li>
            <li>
                <label for="email_subject">Тема:</label>
                <input name="email_subject" type="text" required value="{$obj->mReply.subject}">
                <span class="form_hint">Корректный формат: "Some subject"</span>
            </li>
            <li>
                <label for="email_message">Сообщение:</label>
                <textarea name="email_message" cols="40" rows="12" required>{$obj->mReply.text}</textarea>
            </li>

            <li>
                <button class="email_submit" type="submit" name="email_send">Отправить письмо</button>
            </li>
        </ul>
    </form>
</div>