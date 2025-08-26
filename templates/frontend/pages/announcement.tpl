{**
 * templates/frontend/pages/announcement.tpl
 *
 * Copyright (c) 2014-2020 Simon Fraser University
 * Copyright (c) 2003-2020 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @brief Display the page which represents a single announcement
 *
 * @uses $announcement Announcement The announcement to display
 *}
{include file="frontend/components/header.tpl" pageTitleTranslated=$announcement->getLocalizedTitle()|escape}

<div class="wrapper">
		<div class="container">
			<div class="page_article bio_articles">
				{$announcement->getLocalizedImage()}
                <div class="bio_articles_right">
                    <h2>{$announcement->getLocalizedTitle()|escape}</h2>
                    <h6>{$announcement->getLocalizedTitleSub()}</h6>
				{if (!empty({$announcement->getLocalizedTitleOrcid()}))}
                    <p class="info_text">Orcid Id</p>
					<p><a href="{$announcement->getLocalizedTitleOrcid()}">{$announcement->getLocalizedTitleOrcid()}</a></p>
				{/if}
					
                </div>
			</div>
			<div class="main">
                <div class="collegiya_detail_content">
                    {if $announcement->getLocalizedDescription()}
						{$announcement->getLocalizedDescription()|strip_unsafe_html}
					{else}
						{$announcement->getLocalizedDescriptionShort()|strip_unsafe_html}
					{/if}
                </div>
			</div>
		</div>
	</div>

{include file="frontend/components/footer.tpl"}

