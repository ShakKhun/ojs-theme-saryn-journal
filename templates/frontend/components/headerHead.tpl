{**
 * templates/frontend/components/headerHead.tpl
 *
 * Copyright (c) 2014-2021 Simon Fraser University
 * Copyright (c) 2000-2021 John Willinsky
 * Distributed under the GNU GPL v3. For full terms see the file docs/COPYING.
 *
 * Common site header <head> tag and contents.
 *}
<head>
	<meta charset="{$defaultCharset|escape}">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="format-detection" content="telephone=no">
	<meta property="og:title" content="Saryn Journal - Official Site"/>
	<meta property="og:description" content="Saryn by Kurmangazy Kazakh National Conservatory is an international peer-reviewed journal promoting distribution and discussion of high-quality texts in the field of cross-cultural research in the line of Arts and Humanities."/>
	{* <meta property="og:image" content="https://sarynjournal.kz/public/site/images/logo.png"/> *}
	<meta property="og:url" content="https://sarynjournal.kz/"/>
	<meta property="og:type" content="website"/>
	<meta name="twitter:title" content="Saryn Journal - Official Site">
	<meta name="twitter:description" content="Saryn by Kurmangazy Kazakh National Conservatory is an international peer-reviewed journal promoting distribution and discussion of high-quality texts in the field of cross-cultural research in the line of Arts and Humanities.">



	
	<title>
		{$pageTitleTranslated|strip_tags}
		{* Add the journal name to the end of page titles *}
		{if $requestedPage|escape|default:"index" != 'index' && $currentContext && $currentContext->getLocalizedName()}
			| {$currentContext->getLocalizedName()}
		{/if}
	</title>


	<link rel="stylesheet" href="/plugins/themes/healthSciences/libs/bootstrap/css/bootstrap.css">

	{load_header context="frontend"}
	{load_stylesheet context="frontend"}
	
	<link rel="stylesheet" href="/plugins/generic/citationStyleLanguage/css/citationStyleLanguagePlugin.css"> 

	<link rel="stylesheet" href="/plugins/themes/healthSciences/libs/animate/animate.css">

	<link rel="stylesheet" href="/plugins/themes/healthSciences/styles/css/fonts.css">
	<link rel="stylesheet" href="/plugins/themes/healthSciences/styles/css/main.css">
	<link rel="stylesheet" href="/plugins/themes/healthSciences/styles/css/media.css">
	<link rel="stylesheet" href="/plugins/themes/healthSciences/styles/custom.css">

	<link rel="stylesheet" href="/plugins/themes/healthSciences/styles/rebrand.css">
</head>
