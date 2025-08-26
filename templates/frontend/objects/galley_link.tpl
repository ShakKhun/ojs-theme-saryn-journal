{**
 * templates/frontend/objects/galley_link.tpl
 *
 * Copyright (c) 2014-2020 Simon Fraser University
 * Copyright (c) 2003-2020 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @brief View of a galley object as a link to view or download the galley, to be used
 *  in a list of galleys.
 *
 * @uses $galley Galley
 * @uses $parent Issue|Article Object which these galleys are attached to
 * @uses $hasAccess bool Can this user access galleys for this context?
 * @uses $restrictOnlyPdf bool Is access only restricted to PDF galleys?
 * @uses $isSupplementary bool Is this a supplementary file?
 * @uses $purchaseArticleEnabled bool Can this article be purchased?
 * @uses $currentJournal Journal The current journal context
 * @uses $journalOverride Journal An optional argument to override the current
 *       journal with a specific context
 *}

{* Override the $currentJournal context if desired *}
{if $journalOverride}
	{assign var="currentJournal" value=$journalOverride}
{/if}

{* Determine galley type and URL op *}
{if $galley->isPdfGalley()}
	{assign var="type" value="pdf"}
{else}
	{assign var="type" value="file"}
{/if}

{* Get page and parentId for URL *}
{if $parent instanceOf Issue}
	{assign var="page" value="issue"}
	{assign var="parentId" value=$parent->getBestIssueId()}
	{assign var="path" value=$parentId|to_array:$galley->getBestGalleyId()}
{else}
	{assign var="page" value="article"}
	{assign var="parentId" value=$parent->getBestId()}
	{* Get a versioned link if we have an older publication *}
	{if $publication && $publication->getId() !== $parent->getCurrentPublication()->getId()}
		{assign var="path" value=$parentId|to_array:"version":$publication->getId():$galley->getBestGalleyId()}
	{else}
		{assign var="path" value=$parentId|to_array:$galley->getBestGalleyId()}
	{/if}
{/if}

{* Get user access flag *}
{if !$hasAccess}
	{if $restrictOnlyPdf && type=="pdf"}
		{assign var=restricted value="1"}
	{elseif !$restrictOnlyPdf}
		{assign var=restricted value="1"}
	{/if}
{/if}

{* Don't be frightened. This is just a link *}
<a class="{if !$isSupplementary} download_pdf{/if}" href="{url page=$page op="view" path=$path}">

	{$galleyLabel = $galley->getGalleyLabel()|escape}
	{if $galleyLabel != 'PDF'}
		{$startPos = strpos($galleyLabel, '(')}
		{$endPos = strpos($galleyLabel, ')')}
		{$extractedLanguage = substr($galleyLabel, $startPos + 1, $endPos - $startPos - 1)}
		{$lowercaseLanguage = $extractedLanguage|lower}

		{if $lowercaseLanguage == 'english' || $lowercaseLanguage == 'английский' || $lowercaseLanguage == 'ағылшын' || $lowercaseLanguage == 'en' || $lowercaseLanguage == 'eng'}
			{$languageCode = "EN"}
		{elseif $lowercaseLanguage == 'russian' || $lowercaseLanguage == 'русский' || $lowercaseLanguage == 'орыс' || $lowercaseLanguage == 'ru' || $lowercaseLanguage == 'rus'}
			{$languageCode = "RU"}
		{elseif $lowercaseLanguage == 'kazakh' || $lowercaseLanguage == 'қазақ' || $lowercaseLanguage == 'казахский' || $lowercaseLanguage == 'kz' || $lowercaseLanguage == 'kaz'}
			{$languageCode = "KZ"}
		{else}
			{$languageCode = $extractedLanguage}
		{/if}
	{else}
		{$languageCode = ""}
	{/if}

	<button type="button" class="btn btn-outline-success rounded-2">
		<svg width="18" height="22" viewBox="0 0 18 22" fill="none" xmlns="http://www.w3.org/2000/svg">
			<path d="M7.25936 8.68429C7.37831 9.92731 7.43603 12.2902 6.49144 14.1484C6.41472 14.2983 6.3387 14.444 6.26269 14.5834C4.61987 15.0873 2.88484 16.0418 2.59555 17.0927C2.48223 17.5079 2.5864 17.9232 2.88132 18.2322C3.18891 18.5525 3.57111 18.7228 3.9892 18.7228C5.00066 18.7228 6.05223 17.7578 7.20094 15.7757C7.61763 15.673 10.0185 15.3802 10.5232 15.3858C11.9077 16.8013 13.0282 17.4889 13.9433 17.4889C14.5176 17.4889 15.0124 17.1989 15.301 16.6915C15.5009 16.3367 15.5016 15.9271 15.3031 15.5674C14.7288 14.5299 12.4919 14.1076 11.1503 14.0111C11.0349 13.8851 10.918 13.7542 10.7984 13.6184C9.42445 12.0488 8.86276 9.7429 8.65512 8.53788C8.62908 8.26197 8.59952 8.03251 8.57488 7.86429C8.4862 7.22658 8.0857 7.13086 7.85483 7.13086C7.65423 7.13086 7.46207 7.21743 7.32904 7.36877C7.11436 7.6123 7.14674 7.87555 7.16786 8.05151C7.18756 8.22467 7.21853 8.45272 7.25936 8.68429ZM4.04833 17.3144C4.17995 17.1687 4.43686 16.954 4.8261 16.7217C4.4629 17.1159 4.19543 17.2785 4.04833 17.3144ZM13.8701 16.0875C13.7525 16.0728 13.5287 16.0136 13.1697 15.7933C13.4794 15.894 13.7152 15.9981 13.8701 16.0875ZM8.47916 12.6126C8.73607 13.1341 9.02184 13.6092 9.33576 14.0351C9.18232 14.0499 8.09977 14.1899 8.00405 14.2019C8.20395 13.712 8.36231 13.1806 8.47916 12.6126Z" fill="#008283"/>
			<path d="M5.80646 0L0.109375 6.01523V22H17.8932V0H5.80646ZM5.3039 2.52969V5.19523H2.77913L5.3039 2.52969ZM16.5172 20.6246H1.48402V6.57058H6.67925V1.37535H16.5186V20.6246H16.5172Z" fill="#008283"/>
		</svg>
		<span>PDF {$languageCode}</span>
		
	</button>
	{* Add some screen reader text to indicate if a galley is restricted *}
	{* <img src="/plugins/themes/healthSciences/img/download_vector.png">
	{if $restricted}
		<span class="sr-only">
			{if $purchaseArticleEnabled}
				{translate key="reader.subscriptionOrFeeAccess"}
			{else}
				{translate key="reader.subscriptionAccess"}
			{/if}

		</span>
	{/if}

	{$galleyLabel = $galley->getGalleyLabel()|escape}
	{if $galleyLabel != 'PDF'}
		{$startPos = strpos($galleyLabel, '(')}
		{$endPos = strpos($galleyLabel, ')')}
		{$languageCode = substr($galleyLabel, $startPos + 1, $endPos - $startPos - 1)}
	{else}
		{$languageCode = ""}
	{/if}

	<span>{translate key="plugins.themes.healthSciences.currentIssuePublished" date=$issue->getDatePublished()|date_format:$dateFormatLong}
		{$languageCode}</span> *}

</a>