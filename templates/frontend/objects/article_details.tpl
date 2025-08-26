{**
 * templates/frontend/objects/article_details.tpl
 *
 * Copyright (c) 2014-2020 Simon Fraser University
 * Copyright (c) 2003-2020 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @brief View of an Article which displays all details about the article.
 *  Expected to be primary object on the page.
 *
 * Core components are produced manually below. Additional components can added
 * via plugins using the hooks provided:
 *
 * Templates::Article::Main
 * Templates::Article::Details
 *
 * @uses $article Article This article
 * @uses $publication Publication The publication being displayed
 * @uses $firstPublication Publication The first published version of this article
 * @uses $currentPublication Publication The most recently published version of this article
 * @uses $issue Issue The issue this article is assigned to
 * @uses $section Section The journal section this article is assigned to
 * @uses $primaryGalleys array List of article galleys that are not supplementary or dependent
 * @uses $supplementaryGalleys array List of article galleys that are supplementary
 * @uses $keywords array List of keywords assigned to this article
 * @uses $pubIdPlugins Array of pubId plugins which this article may be assigned
 * @uses $copyrightHolder array List of localized names of copyright holder
 * @uses $copyrightYear string Year of copyright
 * @uses $licenseTerms string License terms.
 * @uses $licenseUrl string URL to license. Only assigned if license should be
 *   included with published articles.
 * @uses $ccLicenseBadge string An image and text with details about the license
 *}


<section id = "archive-detail">
	<div class="container p-4 p-md-0">
		<div class="row d-block d-md-none">
			<h1>{$publication->getLocalizedFullTitle()|escape}</h1>
		</div>
		<div class="row sm-gray-text mb-5 d-block d-md-none">{translate key="article.views"}:&nbsp; <span class="text-dark">{$article->getViews()}</span></div>
		<div class="row flex-column-reverse flex-md-row">
			<div class="col-12 col-md">
				<h1 class="d-none d-md-flex">{$publication->getLocalizedFullTitle()|escape}</h1>
				<div class="sm-gray-text mb-5 d-none d-md-flex">{translate key="article.views"}:&nbsp; <span class="text-dark">{$article->getViews()}</span></div>
				<h2>
					{if $publication->getData('authors')|@count > 1}			
						{translate key="article.authors"}
					{else}
						{translate key="article.author.one"}
					{/if}
				</h2>


				{if $publication->getData('authors')}
					{foreach from=$publication->getData('authors') item=author}

						<a href="{$author->getData('orcid')|escape}">
							<div class=" row authors col-12 col-md-10 ps-0">
								<h3 class="col-10 mb-2">{$author->getFullName()|escape}</h3>
								<div class="sm-gray-text">
								{if $publication->getData('primaryContactId') == $author->getData("id") & $countAuthor >= 2}
									<p>{translate key="author.corresponding"}</p>
								{/if}
							</div>
								{if $author->getLocalizedData('biography')}
									<p class="mt-4">{$author->getLocalizedData('biography')|strip_unsafe_html}</p>
								{/if}
								{if $author->getLocalizedData('affiliation')}
									<p class="affiliation">
										{$author->getLocalizedData('affiliation')|escape}
									{* <p class="country"></p>
									{if $author->getData('rorId')}
										<a href="{$author->getData('rorId')|escape}">{$rorIdIcon}</a>
									{/if}
									</p> *}
								{/if}
								{if $author->getData('orcid')}
									<div>
										<a href="{$author->getData('orcid')|escape}" target="_blank" class="accent-color">
											{$author->getData('orcid')|escape}
										</a>
									</div>
								{/if}
								<hr>
							</div>
						</a>

					{/foreach}
				{/if}
			</div>
			<div class="col-12 col-md-6 col-lg-5 mb-4 mb-md-0 p-0">
				<div class="card mb-4 mb-md-0">
					{* <img src="img/floating A4 Book Mockup.png" class="card-img-top" alt="..."> *}
					{if $publication->getLocalizedData('coverImage') || ($issue && $issue->getLocalizedCoverImage())}
						{if $publication->getLocalizedData('coverImage')}
							{assign var="coverImage" value=$publication->getLocalizedData('coverImage')}
							<img class="card-img-top" src="{$publication->getLocalizedCoverImageUrl($article->getData('contextId'))|escape}"
								alt="{$coverImage.altText|escape|default:''}" >
						{else}
							<a href="{url page="issue" op="view" path=$issue->getBestIssueId()}" class="d-flex justify-content-center">
								<img class="card-img-top" src="{$issue->getLocalizedCoverImageUrl()|escape}"
									alt="{$issue->getLocalizedCoverImageAltText()|escape|default:''}">
							</a>
						{/if}
					{/if}

					
					<div class="card-body">
						<div class="row">
							{if $issue->getDatePublished()}
								<div class="col-6 col-sm d-flex flex-column justify-content-between">
									<div class="sm-gray-text">{translate key="submissions.published"}:</div>
									<b>{$publication->getData('datePublished')|date_format:$dateFormatShort}</b>
								</div>
							{/if}
							<div class="col pt-4 pt-sm-0 d-flex flex-column justify-content-between">
								<div class="sm-gray-text">{translate key="locale.journal.number"}</div>
								<b>№ {$issue->getNumber()|escape}</b>
							</div>
							<div class="col pt-4 pt-sm-0 d-flex flex-column justify-content-between">
								<div class="sm-gray-text">{translate key="locale.journal.volume"}</div>
								<b>{$issue->getNumber()|escape}</b>
							</div>
							<div class="col pt-4 pt-xl-0  d-flex align-items-center">
								{if $primaryGalleys}
									{foreach from=$primaryGalleys item=galley}
										{include file="frontend/objects/galley_link2.tpl" parent=$article publication=$publication galley=$galley purchaseFee=$currentJournal->getData('purchaseArticleFee') purchaseCurrency=$currentJournal->getData('currency')}
									{/foreach}
								{/if}
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="row mt-5 flex-column-reverse flex-md-row">
			<div class="col">
				<div class="col-12 col-md-10 p-0">
					{if $publication->getLocalizedData('abstract')}
						<h2>{translate key="article.abstract"}</h2>
						<p>{$publication->getLocalizedData('abstract')|strip_unsafe_html}</p>
					{/if}
				</div>
			</div>
			<div class="col-12 col-md-5">
				<div class="row">
					<ul class="nav nav-tabs" id="myTab" role="tablist">
						<li class="nav-item" role="presentation">
							<button class="nav-link active" id="info-tab" data-bs-toggle="tab" data-bs-target="#info" type="button" role="tab">
								{translate key="locale.issue.info"}
							</button>
						</li>
						<li class="nav-item" role="presentation">
							<button class="nav-link" id="sources-tab" data-bs-toggle="tab" data-bs-target="#sources" type="button" role="tab">
								{translate key="submission.citations"}
							</button>
						</li>
					</ul>
					<div class="tab-content">
						<div class="tab-pane show active h-10" id="info" role="tabpanel">
							<div class="row">
								<div class="col">
									<div class="sm-gray-text">{translate key="locale.publication.date.j"}</div>
									<div>{$publication->getData('datePublished')}</div>
								</div>
								<div class="col">
									<div class="sm-gray-text">{translate key="locale.article.page"}</div>
									<div>{$publication->getData('pages')|escape}</div>
								</div>
							</div>
							<div class="row">
								<div class="col-6">
									{assign var=doiObject value=$article->getCurrentPublication()->getData('doiObject')}
									{if $doiObject}
										{assign var="doiUrl" value=$doiObject->getData('resolvingUrl')|escape}
										{capture assign=translatedDoi}{translate key="doi.readerDisplayName"}{/capture}
										<div class="sm-gray-text">{capture assign=translatedDOI}{translate key="plugins.pubIds.doi.readerDisplayName"}{/capture}DOI</div>
										<div><a class="accent-color" href="{$doiUrl}">{$doiUrl}</a></div>
									{/if}
								</div>
								<div class="col-6">
									<div class="sm-gray-text">{translate key="locale.chapter.j"}</div>
									<div>{$section->getLocalizedTitle()}</div>
								</div>
							</div>
							<div class="row">
								<div class="col">
									<div class="sm-gray-text">{translate key="locale.license.j"}</div>
									<div><a href="https://creativecommons.org/licenses/by-nc-nd/4.0/" class="accent-color">Attribution-NonCommercial-NoDerivs 4.0 International</a></div>
								</div>
								<div class="col">
								</div>
							</div>
						</div>
						<div class="tab-pane" id="sources" role="tabpanel">
							{if $parsedCitations}
								{foreach from=$parsedCitations item="parsedCitation"}
									<p>{$parsedCitation->getCitationWithLinks()|strip_unsafe_html}
										{call_hook name="Templates::Article::Details::Reference" citation=$parsedCitation}</p>
								{/foreach}
							{else}
								{$publication->getData('citationsRaw')|escape|nl2br}
							{/if}
						</div>
					</div>
				</div>
				<div class="row d-inline">

					{if !empty($publication->getLocalizedData('keywords'))}
						<h2>{translate key="article.subject"}</h2>
						{foreach name=keywords from=$publication->getLocalizedData('keywords') item=keyword}
							<span class="badge">{$keyword|escape}</span>
						{/foreach}
					{/if}
				</div>
			</div>
		</div>

	</div>
</section>


{* // not used still  *}
{* {if $primaryGalleys}
	{foreach from=$primaryGalleys item=galley}
		{include file="frontend/objects/galley_link2.tpl" parent=$article publication=$publication galley=$galley purchaseFee=$currentJournal->getData('purchaseArticleFee') purchaseCurrency=$currentJournal->getData('currency')}
	{/foreach}
{/if}

{if $publication->getData('dateAccepted')}
	<p class="info_text accepted">
	{translate key="submissions.submitted"}:
	</p>
	<p>
		{$publication->getData('dateAccepted')}
	</p>
{/if}

{call_hook name="Templates::Article::Footer::PageFooter"} *}

