{**
 * templates/frontend/objects/announcement_summary.tpl
 *
 * Copyright (c) 2014-2020 Simon Fraser University
 * Copyright (c) 2003-2020 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @brief Display a summary view of an announcement
 *
 * @uses $announcement Announcement The announcement to display
 * @uses $heading string HTML heading element, default: h2
 *}
{if !$heading}
	{assign var="heading" value="h2"}
{/if}

<div class="main">
		<div class="collegiya">
			<div class="block_collegiya">
				<a href="{url router=$smarty.const.ROUTE_PAGE page="announcement" op="view" path=$announcement.Id}">
					{$announcement.Title}
				</a>
				<a style="display: contents;" href="{url router=$smarty.const.ROUTE_PAGE page="announcement" op="view" path=$announcement.Id}">
					{$announcement.DescriptionShort}
				</a>
			</div>
		</div>
	</div>
