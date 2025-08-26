{**
 * templates/frontend/components/languageSwitcher.tpl
 *
 * Copyright (c) 2014-2020 Simon Fraser University
 * Copyright (c) 2003-2020 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @brief A re-usable template for displaying a language switcher dropdown.
 *
 * @uses $currentLocale string Locale key for the locale being displayed
 * @uses $languageToggleLocales array All supported locales
 * @uses $id string A unique ID for this language toggle
 *}
{if $languageToggleLocales && $languageToggleLocales|@count > 1}
	{* <a class="active">{($currentLocale == "ru") ? "RU" : (($currentLocale == "en") ? "EN": (($currentLocale == "kk") ? "KZ": ""))}</a> *}
	{* {foreach from=$languageToggleLocales item="localeName" key="localeKey"} *}
{* 		{if $localeKey !== $currentLocale}
			<a href="{url router=$smarty.const.ROUTE_PAGE page="user" op="setLocale" path=$localeKey source=$smarty.server.REQUEST_URI}">
				{($localeKey == "ru") ? "RU" : (($localeKey == "en") ? "EN": (($localeKey == "kk") ? "KZ": ""))}
			</a>
		{/if} *}

		{* {if $localeKey|escape == "kk"}
			<a href="{url router=$smarty.const.ROUTE_PAGE page="user" op="setLocale" path=$localeKey source=$smarty.server.REQUEST_URI}" style="order: 0;" class='{($currentLocale == "kk") ? "active" : ""}'>KZ
			</a>
		{/if}

		{if $localeKey|escape == "ru"}
			<a href="{url router=$smarty.const.ROUTE_PAGE page="user" op="setLocale" path=$localeKey source=$smarty.server.REQUEST_URI}" style="order: 1;" class='{($currentLocale == "ru") ? "active" : ""}'>RU
			</a>
		{/if}

		{if $localeKey|escape == "en"}
			<a href="{url router=$smarty.const.ROUTE_PAGE page="user" op="setLocale" path=$localeKey source=$smarty.server.REQUEST_URI}" style="order: 2;" class='{($currentLocale == "en") ? "active" : ""}'>EN
			</a>
		{/if}


	{/foreach} *}


	<div id="langOptions">
		<div class="hoverForBtn" id="langChangeButton">
		<button class="btn btn-outline-secondary">
			{if $currentLocale == "kk"}KZ{elseif $currentLocale == "ru"}RU{elseif $currentLocale == "en"}EN{/if}
		</button>
		</div>
		<div id="hiddenLangMenuNew">
		{foreach from=$languageToggleLocales item="localeName" key="localeKey"}
			{if $localeKey !== $currentLocale}
			<div class="hoverForBtn">
				<button class="btn btn-outline-secondary d-block" onclick="window.location.href='{url router=$smarty.const.ROUTE_PAGE page='user' op='setLocale' path=$localeKey source=$smarty.server.REQUEST_URI}'">
				{if $localeKey == "kk"}KZ{elseif $localeKey == "ru"}RU{elseif $localeKey == "en"}EN{/if}
				</button>
			</div>
			{/if}
		{/foreach}
		</div>
	</div>


	
{/if}
