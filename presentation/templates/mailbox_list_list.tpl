{* mailbox_list_list.tpl *}
{load_presentation_object filename="mailbox_list_list" classname="mailboxlistlist" assign="obj"}
<div id="sidebar">
<div class="folders">
    <p class="folders-title">Почтовые папки</p>
    <ul class="treeline">
        <li>
        {section name=i loop=$obj->mMailboxes}
            {assign var =selected value=""}
            {if ($obj->mSelectedMailbox==$obj->mMailboxes[i].contact_id)}
                {assign var=link_to_mailbox value=$obj->mMailboxes[i].link_to_mailbox}
                {assign var=selected value="class=\"selected\""}
            {/if}            
            {if ($obj->mMailboxes[i].folder_name eq "INBOX")}                
                    <a {$selected}  href="{$obj->mMailboxes[i].link_to_mailbox}">
                       {$obj->mMailboxes[i].folder_name|upper}
                    </a>
            {/if}
            {if ($obj->mMailboxes[i].contact_id neq "0") && ($obj->mMailboxes[i].contact_id neq "99999")}
                {if $smarty.section.i.index < 2}<ul>{/if}
                    <li {$selected}>                
                        <a  href="{$obj->mMailboxes[i].link_to_mailbox}"
                            
                            {if strlen($obj->mMailboxes[i].contact_name)!=0}
                                       data-tooltip="{$obj->mMailboxes[i].contact_name}">
                            {else}
                                data-tooltip="{$obj->mMailboxes[i].contact_email}">
                            {/if}
                            {$obj->mMailboxes[i].folder_name}                           
                        </a>
                    </li>
                {if $smarty.section.i.last}</ul>{/if}
            {/if}
            
        {/section}
        </li>
        <!-- <li>
            {*assign var=last_element value=($obj->mMailboxes)|@end}
            <a href="{$last_element.link_to_mailbox}">111{$last_element.folder_name}</a>*}
        </li> -->
    </ul>   
</div>
</div>