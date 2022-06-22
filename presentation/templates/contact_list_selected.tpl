{* contact_tpl_selected.tpl *}
{if $obj->mUpdateContactInfo}
    <p>Contact updated</p>
{/if}
<form class="contact_form" action="" method="POST">
    <ul>
        <li>
            <h2>Контактная информация: 
                {if $obj->mContactBrief[$smarty.get.ContactId].contact_name neq NULL}
                {$obj->mContactBrief[$smarty.get.ContactId].contact_name}
                {else}
                    <span>Имя отсутствует</span>
                {/if}
            </h2>
            <span class="required_notification">* Поля, обязательные к заполнению</span>
        </li>

        <li>
            <label for="contact_name">Имя:</label>
            <input autocomplete="contact_name" name="contact_name" type="text" 
                   value="{$obj->mContactBrief[$smarty.get.ContactId].contact_name}"
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
                   value="{$obj->mContactBrief[$smarty.get.ContactId].contact_email}"
                    required>
            <span class="form_hint">Пример: "your_name@email.com"</span>
            <span>{$obj->mContactEmailError}</span>
        </li>

        <li>
            <label for="contact_folder">Почтовая папка:</label>
            <input name="contact_foldername" type="text"
                   value="{$obj->mContactBrief[$smarty.get.ContactId].folder_name}"
                   required>
            <span class="form_hint">Пример: "Текст"</span>
            <span >{$obj->mContactFolderError}</span>
        </li>
        <li>
            <button class="submit" type="submit" name="update_contact" value="Send">Обновить</button>
        </li>    
    </ul>
</form>
