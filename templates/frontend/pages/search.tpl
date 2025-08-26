{**
 * templates/frontend/pages/search.tpl
 *
 * Copyright (c) 2014-2020 Simon Fraser University
 * Copyright (c) 2003-2020 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @brief Display the page to search and view search results.
 *
 * @uses $query Value of the primary search query
 * @uses $authors Value of the authors search filter
 * @uses $dateFrom Value of the date from search filter (published after).
 *  Value is a single string: YYYY-MM-DD HH:MM:SS
 * @uses $dateTo Value of the date to search filter (published before).
 *  Value is a single string: YYYY-MM-DD HH:MM:SS
 * @uses $yearStart Earliest year that can be used in from/to filters
 * @uses $yearEnd Latest year that can be used in from/to filters
 *}
{include file="frontend/components/header.tpl" pageTitle="common.search"}

<div class="wrapper">
		<div class="container">
			<div class="page_article">
				<div class="page_description">
					<h2>
						{if $query}
							{translate key="plugins.themes.healthSciences.search.resultsFor" query=$query|escape}
						{elseif $authors}
							{translate key="plugins.themes.healthSciences.search.resultsFor" query=$authors|escape}
						{else}
							{translate key="common.search"}
						{/if}
					</h2>
				</div>
				<div class="page_description_bottom">
					<form action="{url page="search"}" method="get">
						<input type="text" type="search" id="query" name="query" placeholder="{translate key="locale.search.placeholder"}" class="search_input">
						<a  class="search_btn" id="search_btn"><img src="/plugins/themes/healthSciences/img/search.png" alt=""></a>
						<button type="submit"  class="search_btn" id="search_btn_submit"><img src="/plugins/themes/healthSciences/img/search.png" alt=""></button>
						<a class="search_btn_close"><span></span></a>
					</form>
				</div>
			</div>
			<div class="main">
				<div class="search_content">
					{capture name="searchFormUrl"}{url op="search" escape=false}{/capture}
					{$smarty.capture.searchFormUrl|parse_url:$smarty.const.PHP_URL_QUERY|parse_str:$formUrlParameters}
					<form class="form-search" method="get" action="{$smarty.capture.searchFormUrl|strtok:"?"|escape}">
						{foreach from=$formUrlParameters key=paramKey item=paramValue}
							<input type="hidden" name="{$paramKey|escape}" value="{$paramValue|escape}"/>
						{/foreach}
						<p class="info_text">По дате публикации</p>
						<div class="label_row">
							<label for="dateFromYear">
									От
							</label>
							<label for="dateToYear">
									до
							</label>
						</div>	
						<div class="filter">
							<div class="filter_left">
								{html_select_date class="form-control" prefix="dateFrom" time=$dateFrom start_year=$yearStart end_year=$yearEnd year_empty="" month_empty="" day_empty="" field_order="YMD"}
							</div>
							<div class="filter_right">
								{html_select_date class="form-control" prefix="dateTo" time=$dateTo start_year=$yearStart end_year=$yearEnd year_empty="" month_empty="" day_empty="" field_order="YMD"}
							</div>
						</div>
						<p class="info_text">Поиск</p>
						<div class="seacrh_form">
							<input placeholder="{translate key="locale.search.placeholder"}" type="search" id="query" class="search_input" name="query" value="{$query|escape}">
							<button class="search_btn" type="submit"><img src="/plugins/themes/healthSciences/img/search.png" alt=""></button>
						</div>
					</form>
					
					{* No results found *}
					{if $results->wasEmpty()}
						{if $error}
							<div class="alert alert-danger" role="alert">{$error|escape}</div>
						{else}
							<div class="alert alert-primary" role="alert">{translate key="search.noResults"}</div>
						{/if}

					{* Results pagination *}
					{else}
						{iterate from=results item=result}
							{include file="frontend/objects/article_summary_list.tpl" article=$result.publishedSubmission journal=$result.journal showDatePublished=true hideGalleys=true}
						{/iterate}
					{/if}
                </div>
			</div>
		</div>
	</div>

{include file="frontend/components/footer.tpl"}
