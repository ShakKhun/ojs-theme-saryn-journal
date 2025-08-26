{**
 * templates/frontend/objects/article_summary.tpl
 *
 * Copyright (c) 2014-2020 Simon Fraser University
 * Copyright (c) 2003-2020 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @brief View of an Article summary which is shown within a list of articles.
 *
 * @uses $article Article The article
 * @uses $hasAccess bool Can this user access galleys for this context? The
 *       context may be an issue or an article
 * @uses $showDatePublished bool Show the date this article was published?
 * @uses $hideGalleys bool Hide the article galleys for this article?
 * @uses $primaryGenreIds array List of file genre ids for primary file types
 *}
{assign var=publication value=$article->getCurrentPublication()}

{assign var=articlePath value=$publication->getData('urlPath')|default:$article->getId()}
{if !$heading}
	{assign var="heading" value="h2"}
{/if}

{if (!$section.hideAuthor && $publication->getData('hideAuthor') == \APP\submission\Submission::AUTHOR_TOC_DEFAULT) || $publication->getData('hideAuthor') == \APP\submission\Submission::AUTHOR_TOC_SHOW}
	{assign var="showAuthor" value=true}
{/if}


<a {if $journal}href="{url journal=$journal->getPath() page="article" op="view" path=$articlePath}"{else}href="{url page="article" op="view" path=$articlePath}"{/if} class = "AddSvgWhenHover">
	<div class="row authors col-12 ps-0">
		<h2 class="col-10">{$article->getLocalizedFullTitle()|escape}</h2>
		<div class="sm-gray-text">{translate key="article.authors"}:</div>
		<div class = "d-flex justify-content-between align-items-center">
			{if $showAuthor && $article->getPages()}
				<span>
					{$publication->getAuthorString($authorUserGroups)|escape}
				</span>
				{elseif $showAuthor}
				<span id="comma">{* $article->getAuthorString()|escape *}</span>
				{elseif $article->getPages()}
					{$article->getPages()|escape}
			{/if}
			<svg width="8" height="12" viewBox="0 0 8 12" fill="none" xmlns="http://www.w3.org/2000/svg">
				<path d="M6.8297 5.29001L2.5897 1.05001C2.49674 0.956281 2.38613 0.881887 2.26428 0.831118C2.14242 0.780349 2.01171 0.754211 1.8797 0.754211C1.74769 0.754211 1.61698 0.780349 1.49512 0.831118C1.37326 0.881887 1.26266 0.956281 1.1697 1.05001C0.983448 1.23737 0.878906 1.49082 0.878906 1.75501C0.878906 2.0192 0.983448 2.27265 1.1697 2.46001L4.7097 6.00001L1.1697 9.54001C0.983448 9.72737 0.878906 9.98082 0.878906 10.245C0.878906 10.5092 0.983448 10.7626 1.1697 10.95C1.26314 11.0427 1.37395 11.116 1.49579 11.1658C1.61763 11.2155 1.74809 11.2408 1.8797 11.24C2.01131 11.2408 2.14177 11.2155 2.26361 11.1658C2.38544 11.116 2.49626 11.0427 2.5897 10.95L6.8297 6.71001C6.92343 6.61705 6.99782 6.50645 7.04859 6.38459C7.09936 6.26273 7.1255 6.13202 7.1255 6.00001C7.1255 5.868 7.09936 5.73729 7.04859 5.61543C6.99782 5.49357 6.92343 5.38297 6.8297 5.29001Z" fill="#008283"/>
			</svg>
		</div >
		<hr>
	</div>
</a>


{* <div class="issue_block">
	{if $showAuthor && $article->getPages()}
		<p>
			{$publication->getAuthorString($authorUserGroups)|escape}
		</p>
	{elseif $showAuthor}
		<p id="comma">this was commented >>>> $article->getAuthorString()|escape </p>
	{elseif $article->getPages()}
		{$article->getPages()|escape}
	{/if}
	<a {if $journal}href="{url journal=$journal->getPath() page="article" op="view" path=$articlePath}"{else}href="{url page="article" op="view" path=$articlePath}"{/if}>
		<h4>{$article->getLocalizedFullTitle()|escape}</h4>
	</a>
</div> *}
