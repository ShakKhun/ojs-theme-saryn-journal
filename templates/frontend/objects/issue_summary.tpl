{**
 * templates/frontend/objects/issue_summary.tpl
 *
 * Copyright (c) 2014-2020 Simon Fraser University
 * Copyright (c) 2003-2020 John Willinsky
 * Distributed under the GNU GPL v3. For full terms see the file docs/COPYING.
 *
 * @brief View of an Issue which displays a summary for use in lists
 *
 * @uses $issue Issue The issue
 *}
{if $issue->getShowTitle()}
{assign var=issueTitle value=$issue->getLocalizedTitle()}
{/if}
{assign var=issueSeries value=$issue->getIssueSeries()}
{assign var=issueCover value=$issue->getLocalizedCoverImageUrl()}


{if $issueTitle}
	<div class="col-12 col-md-6 col-lg-6 col-xl-3">
		<a href="{url op="view" path=$issue->getBestIssueId()}">
			<div class="card">
				<img src="{$issueCover|escape}" class="card-img-top" alt="{$issue->getLocalizedCoverImageAltText()|escape|default:''}">
				<div class="card-body">
					<h3 class="card-title">
						{if $issueTitle && $issueSeries}
								{$issueSeries|escape}
						{/if}
					</h3>
				</div>
			</div>
		</a>
	</div>
{/if}

<!-- .obj_issue_summary -->
