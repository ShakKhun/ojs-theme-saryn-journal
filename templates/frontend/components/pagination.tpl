{**
 * templates/frontend/components/pagination.tpl
 *
 * Copyright (c) 2014-2020 Simon Fraser University
 * Copyright (c) 2003-2020 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @brief Common template for displaying pagination
 *
 * @uses $prevUrl string URL to the previous page
 * @uses $nextUrl string URL to the next page
 * @uses $showingStart int The number of the first item shown on this page
 * @uses $showingEnd int The number of the last item shown on this page
 * @uses $total int The total number of items available
 *}

{if $prevUrl || $nextUrl}
	<nav aria-label="{translate|escape key="common.pagination.label"}">
		<ul class="pages_btns">
			<li class="prev_page{if !$prevUrl} disabled{/if}">
				<a class="page-link" href="{$prevUrl}">
					<img src="/plugins/themes/healthSciences/img/prev_page.png" alt="">
				</a>
			</li>
			<li class="active">
				<span class="page-link">
					{$showingStart}
				</span>
			</li>
			<li class="page-item{if !$nextUrl} disabled{/if}">
				<a class="next_page" href="{$nextUrl}">
					<img src="/plugins/themes/healthSciences/img/next_page.png" alt="">
				</a>
			</li>
		</ul>
	</nav>
{/if}