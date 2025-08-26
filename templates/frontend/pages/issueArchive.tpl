{**
 * templates/frontend/pages/issueArchive.tpl
 *
 * Copyright (c) 2014-2020 Simon Fraser University
 * Copyright (c) 2003-2020 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @brief Display a list of recent issues.
 *
 * @uses $issues Array Collection of issues to display
 * @uses $prevPage int The previous page number
 * @uses $nextPage int The next page number
 * @uses $showingStart int The number of the first item on this page
 * @uses $showingEnd int The number of the last item on this page
 * @uses $total int Count of all published monographs
 *}
{capture assign="pageTitle"}
	{if $prevPage}
		{translate key="archive.archivesPageNumber" pageNumber=$prevPage+1}
	{else}
		{translate key="archive.archives"}
	{/if}
{/capture}
{include file="frontend/components/header.tpl" pageTitleTranslated=$pageTitle}


<div class="wrapper">
	<section id="archive">
		<div class="container">
			<div class="row">
                <h1>{$pageTitle|escape}</h1>
            </div>

			{* No issues have been published *}
			{if empty($issues)}
				<p>{translate key="current.noCurrentIssueDesc"}</p>
			{else}

				<div class="row">
					{foreach from=$issues item="issue"}
						{if $issue->getYear() != $lastYear}
							<div class="row">
								<h2>{$issue->getYear()}</</h2>
							</div>
						{/if}
							{assign var=lastYear value=$issue->getYear()}
							{include file="frontend/objects/issue_summary.tpl"}
					{/foreach}
				</div>
			{/if}

			{$context = Application::get()->getRequest()->getContext()}
			{$archiveDesc = $context->getLocalizedData('archiveDesc')}
			{$archiveDesc}


            
		</div>
	</section>
</div>


{include file="frontend/components/footer.tpl"}
