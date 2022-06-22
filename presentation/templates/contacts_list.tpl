{* contacts_list.tpl *}
{load_presentation_object filename="contacts_list" classname="ContactsList" assign="obj"}
<div id="sidebar">
    <ul class="contacts">
        {foreach $obj->mContactBrief as $contact}
            {assign var=selected value=""}
            {if $obj->mCurrentContactId==$contact.contact_id}
                {assign var=selected value="active"}
            {/if}
            <li class="{$selected}">
                <input hidden="" name="contact_id" value="{$contact}">                
                                   
                <a class="contact_link " href="{$contact.contact_link}">
                    {if strlen($contact.contact_name) !=0}
                    <p class="contact_name">Имя: {$contact.contact_name}</p>
                {else}
                    <p class="contact_unavailable">Имя: {$contact.contact_email}</p>
                {/if} 
                <span>Email: {$contact.contact_email}</span>
                </a>
            </li>
            
        {/foreach}
    </ul>        
</div>
<div id="content">
    
        {include file=$obj->mContactTemplate scope=parent}
   
</div>