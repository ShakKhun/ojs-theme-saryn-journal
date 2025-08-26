{**
 * templates/frontend/pages/announcements.tpl
 *
 * Copyright (c) 2014-2020 Simon Fraser University
 * Copyright (c) 2003-2020 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @brief Display the page to view a journal's or press's description, contact
 *  details, policies and more.
 *
 * @uses $currentContext Journal|Press The current journal or press
 *}
{include file="frontend/components/header.tpl" pageTitle="announcement.announcements"}
<div class="wrapper">
	<div class="container">
		<div class="page_article collegiya_page">
			<div class="page_description">
				<h2>{translate key="announcement.announcements"}</h2>
			</div>
		</div>
		{$announcementsIntroduction|strip_unsafe_html}
		{include file="frontend/components/editLink.tpl" page="management" op="settings" path="announcements" anchor="announcements" sectionTitleKey="announcement.announcements"}

		<div class="page_article announcements">
			<div class="page_description_bottom">
				<h4>{translate key="locale.editorial.board.sovet"}</h4>
			</div>
		</div>
		
		{foreach from=$announcements key=k item=announcement}
			
			{$array.$k['SortEditor'] = $announcement->getLocalizedSortEditor() }
			{$array.$k['Id'] = $announcement->getId()}
			{$array.$k['Title'] = $announcement->getLocalizedTitle()|escape}
			{$array.$k['DescriptionShort'] = $announcement->getLocalizedDescriptionShort()|strip_unsafe_html}
			{$array.$k['TypeId'] = $announcement->getTypeId()}
		{/foreach}

		<!--{asort($array)}-->
		{foreach from=$array item=announcement}
		{* {$announcement.SortEditor} *}
		{if ($announcement.TypeId == 3)}
			{include file="frontend/objects/announcement_summary_2.tpl"}
			{/if}
		{/foreach}
		<div class="page_article collegiya_page">
				<div class="page_description_bottom">
						<h4>{translate key="locale.editorial.board.colleagues"}</h4>
					</div>
				</div>
		{foreach from=$array item=announcement}
			{if ($announcement.TypeId == 2)}
				
				{include file="frontend/objects/announcement_summary_2.tpl"}
				
			{/if}
		{/foreach}		
	</div>
</div>

{include file="frontend/components/footer.tpl"}
