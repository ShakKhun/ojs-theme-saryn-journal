{**
 * templates/frontend/pages/indexJournal.tpl
 *
 * Copyright (c) 2014-2020 Simon Fraser University
 * Copyright (c) 2003-2020 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @brief Display the index page for a journal
 *
 * @uses $currentJournal Journal This journal
 * @uses $journalDescription string Journal description from HTML text editor
 * @uses $homepageImage object Image to be displayed on the homepage
 * @uses $additionalHomeContent string Arbitrary input from HTML text editor
 * @uses $announcements array List of announcements
 * @uses $numAnnouncementsHomepage int Number of announcements to display on the
 *       homepage
 * @uses $issue Issue Current issue
 *}
{include file="frontend/components/header.tpl" pageTitleTranslated=$currentJournal->getLocalizedName()}

<body>
	<div class="wrapper">
		<div class="container">
		{*
			<div class="page_article">
				<div class="page_description">
					<!--<h1>{$displayPageHeaderLogo.altText|escape}</h1>-->
					<div class="main_page_content">
						{if !$activeTheme->getOption('useHomepageImageAsHeader') && $homepageImage}
							<div class="homepage_image">
								<img src="{$publicFilesDir}/{$homepageImage.uploadName|escape:"url"}"
									{if $homepageImage.altText} alt="{$homepageImage.altText|escape}" {/if}>
							</div>
						{/if}
						<div class="main_content">
							<p class="about_journal">{$aboutMain}</p>
						</div>
					</div>
					<!--<h3>{$displayPageHeaderTitle|escape}</h3>-->
				</div>
				<div class="page_description_bottom">
					<!--{if $currentContext && $requestedPage !== 'search'}
						<div class="pkp_navigation_search_wrapper">
							<a href="{url page="search"}" class="pkp_search pkp_search_desktop">
								<span class="fa fa-search" aria-hidden="true"></span>
								{translate key="common.search"}
							</a>
						</div>
					{/if}-->
					<form action="{url page="search"}" method="get">
						<input type="text" type="search" id="query" name="query"
							placeholder="{translate key="locale.search.placeholder"}" class="search_input">
						<a class="search_btn" id="search_btn"><img src="/plugins/themes/healthSciences/img/search.png"
								alt=""></a>
						<button type="submit" class="search_btn" id="search_btn_submit"><img
								src="/plugins/themes/healthSciences/img/search.png" alt=""></button>
						<a class="search_btn_close"><span></span></a>
					</form>
				</div>
			</div>
		*}
			<div class="main d-block">
				<section id="about">
					<div class="container" >
						<div class="row">

							<div class="col-12 col-lg-6 col-md-12 col-sm-12 align-items-center d-flex flex-column justify-content-center">

								<div class="container ps-0 pe-5">
									<h1>{$currentContext->getLocalizedData('additionalHomeContent')|strip_tags}</h1>
								</div>
								<div class="container ps-0">
									<div class="col-12 col-md-10 ps-0">
									{if $currentContext->getLocalizedData('aboutText')}
										{$currentContext->getLocalizedData('aboutText')|strip_unsafe_html}
									{/if}
									</div>
								</div>
								<div class="container mt-5">
									<div class="row lh-1">
										<div class="col-5 p-0">
											<div class="accent-color mb-3">{translate key="common.publisher"}:</div>
											<div><a class="text-decoration-underline color-2F374A" href="https://www.conservatoire.edu.kz/ru/" target="_blank">
												{$context = Application::get()->getRequest()->getContext()}
												{$publisherMulti = $context->getLocalizedData('publisherMulti')}				
												<p class="color-2F374A">
													{$publisherMulti}
												</p>
												</a>
											</div>
										</div>
											<div class="col-5 pe-0 ps-3 ms-5">
											<div class="accent-color mb-3">{translate key="locale.publish.period"}:</div>
											{* {$context = Application::get()->getRequest()->getContext()}
											{assign var=publishedSince value=$context->getData('publishedSince')}
											{assign var=publishedTimes value=$context->getData('publishedTimes')} *}
											<div class="color-2F374A">{$publishedTimes}{$publishedSince}</div>
										</div>
									</div>
								</div>
								
								<div class="container pt-1 ps-0">
									<a href="{$baseUrl}/saryn/aims-and-scope">
										<button class="btn btn-success mt-5">{translate key="about.button.journal.aim"}</button>
									</a>
								</div>

							{* <h1>Профиль и<br>миссия журнала</h1>
							<div class="container ps-0">
								<div class="col-12 col-md-10 ps-0">
									<p>
									Международный рецензируемый журнал, способствующий распространению и обсуждению высококачественных статей по научному направлению «Искусство и гуманитарные науки». 
									</p>
									<p class="mt-4">
									Академические тексты, предложенные в журнал, могут быть связаны с музыкальными событиями, театральными и балетными представлениями, киноиндустрией, художественными выставками и другими произведениями культуры.
									</p>
								</div>
							</div>
							<div class="container mt-5">
								<div class="row lh-1">
									<div class="col-5 p-0">
										<div class="accent-color mb-3">Издатель:</div>
										<div><a class="text-decoration-underline color-2F374A">Казахская национальная консерватория имени Курмангазы</a></div>
									</div>
									<div class="col-5 pe-0 ps-3 ms-5">
										<div class="accent-color mb-3">Периодичность издания:</div>
										<div class="color-2F374A">Ежеквартально (4 раза в год)<br>Издается с 2013 года;</div>
									</div>
								</div>
								<div class="row pt-3">
									<button class="btn btn-success mt-5">Цели журнала</button>
								</div>
							</div> *}

							</div>
							<div class="col-12 ms-auto col-md-12 col-sm-12 col-lg-6">
								<a href="{$baseUrl}/saryn/issue/view/{$issue->getBestIssueId()}">
								{* {$issue} *}
									<div class="card" id="book-card">
										{if !$activeTheme->getOption('useHomepageImageAsHeader') && $homepageImage}
											<div class="homepage_image d-flex justify-content-center">
												<img src="{$publicFilesDir}/{$homepageImage.uploadName|escape:"url"}"
													{if $homepageImage.altText} alt="{$homepageImage.altText|escape}" {/if} class="overflow-hidden">
											</div>
										{/if}
										<div class="card-body pt-0 ps-5 pe-5">
											<div class="accent-color">{translate key="about.card.header"}</div>
											<div class="card-title mt-3">
												<b class="lh-1">
													{$currentJournal->getLocalizedName()} № {$issue->getNumber()|escape} ({$issue->getVolume()|escape}) {$issue->getDatePublished()|date_format:$dateFormatShort}
												</b>
											</div>

											<div class="container d-flex justify-content-start">
												<div class="row ">
													<div class="col ps-0 text-nowrap">
													<div class="gray-small-text mt-2 mb-1">{translate key="locale.issn.printed"}</div>
													<div class="text-dark">{$currentJournal->getData('printIssn')}</div>
													</div>
													<div class="col">
													<div class="gray-small-text mt-2 mb-1"">{translate key="locale.issn.online"}</div>
													<div class="text-dark">{$currentJournal->getData('onlineIssn')}</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</a>
							</div>
						</div>
					</div>
				</section>


				<section id = "hero">
					<div class="container p-0">
						<div id = "square">
							<div class="container h-100 " id="hero-content">
								<div class="row align-items-center h-100">
								<div class="col-12 col-md-12 col-sm-12 col-lg p-0">
									{* <img src="{$baseUrl}/plugins/themes/healthSciences/img/hero-instrument.png" alt="Instrument"> *}
									{if $currentContext->getLocalizedData('heroForeground')}
										{assign var=heroForeground value=$currentContext->getLocalizedData('heroForeground')}
											<img src="{$publicFilesDir}/{$heroForeground.uploadName|escape:"url"}"
												{if $heroForeground.altText} alt="{$heroForeground.altText|escape}" {/if}>
									{/if}
								</div>
								<div class="col-12 col-md-12 col-sm-12 col-lg pe-5">
									<h2 class="pe-5 lh-sm">
										{if $currentContext->getLocalizedData('heroTitle')}
											{$currentContext->getLocalizedData('heroTitle')|strip_tags}
										{/if}
									</h2>
									<div class="pe-5 mt-5">
										<p class="mb-0 fw-light">
										{if $currentContext->getLocalizedData('heroText')}
											{$currentContext->getLocalizedData('heroText')|regex_replace:"/<\/?p[^>]*>/":""}
										{/if}
										</p>
									</div>
								</div>
								</div>
							</div>
						</div>
						{if $currentContext->getLocalizedData('heroBackground')}
							{assign var=heroImage value=$currentContext->getLocalizedData('heroBackground')}
								<img src="{$publicFilesDir}/{$heroImage.uploadName|escape:"url"}"
									{if $heroImage.altText} alt="{$heroImage.altText|escape}" {/if} id = "hero-img">
						{/if}
				</section>

				<section id = "recommendation">
					<div class="container">
						<h2 class="accent-color" style="font-weight: 500">{translate key="recommendation.header"}</h2>
						<p>
						{if $currentContext->getLocalizedData('recommendationText')}
							{$currentContext->getLocalizedData('recommendationText')}
						{/if}
						</p>
					</div>
				</section>

				    
				<section id = "partners">
					<div class="container">
						{if $currentContext->getLocalizedData('partnersField')}
							{$currentContext->getLocalizedData('partnersField')}
						{/if}

						{* <ul class="list-group list-group-horizontal justify-content-between align-items-center">
							<li class="list-group-item justify-content-center col "><a href="https://www.gov.kz/memleket/entities/quality/documents/details/520901?lang=ru"><img src="https://ojs34.seopro.kz/plugins/themes/healthSciences/img/logo-edugov.png"></a></li>
							<li class="list-group-item justify-content-center ex-sm-img col"><a href="https://www.budapestopenaccessinitiative.org/read/"><img src="https://ojs34.seopro.kz/plugins/themes/healthSciences/img/logo-boai.png"></a></li>
							<li class="list-group-item justify-content-center col"><a href="https://www.crossref.org/"><img src="https://ojs34.seopro.kz/plugins/themes/healthSciences/img/logo-crossref.png"></a></li>
							<li class="list-group-item justify-content-center col"><a href="https://www.ncste.kz/"><img src="https://ojs34.seopro.kz/plugins/themes/healthSciences/img/logo-ncgt.png"></a></li>
							<li class="list-group-item justify-content-center col"><a href="https://cyberleninka.ru/journal/n/saryn?i=1140972"><img src="https://ojs34.seopro.kz/plugins/themes/healthSciences/img/logo-cyberleninka.png"></a></li>
							<li class="list-group-item justify-content-center sm-img col partner-svg"><a href="https://www.rilm.org/resources.php?product=ram&type=music" class="d-flex justify-content-start align-items-center"><img src="https://ojs34.seopro.kz/plugins/themes/healthSciences/img/logo-rilm.svg" class="h-50"></a></li>
							<li class="list-group-item justify-content-center sm-img col ex-sm-img"><a href="https://elibrary.ru/title_about_new.asp?id=81325"><img src="https://ojs34.seopro.kz/plugins/themes/healthSciences/img/logo-rinc.png" style="max-height: 70px"></a></li>
						</ul> *}


						{* <ul class="list-group list-group-horizontal justify-content-between align-items-center">
							<li class="list-group-item justify-content-center col "><a href="https://www.gov.kz/memleket/entities/quality/documents/details/520901?lang=ru"><img src="{$baseUrl}/plugins/themes/healthSciences/img/logo-edugov.png"></a></li>
							<li class="list-group-item justify-content-center ex-sm-img col"><a href="https://www.budapestopenaccessinitiative.org/read/"><img src="{$baseUrl}/plugins/themes/healthSciences/img/logo-boai.png"></a></li>
							<li class="list-group-item justify-content-center col"><a href="https://www.crossref.org/"><img src="{$baseUrl}/plugins/themes/healthSciences/img/logo-crossref.png"></a></li>
							<li class="list-group-item justify-content-center col"><a href="https://www.ncste.kz/"><img src="{$baseUrl}/plugins/themes/healthSciences/img/logo-ncgt.png"></a></li>
							<li class="list-group-item justify-content-center col"><a href="https://cyberleninka.ru/journal/n/saryn?i=1140972"><img src="{$baseUrl}/plugins/themes/healthSciences/img/logo-cyberleninka.png"></a></li>
							<li class="list-group-item justify-content-center sm-img col partner-svg"><a href="https://www.rilm.org/resources.php?product=ram&type=music" class="d-flex justify-content-start align-items-center"><img src="{$baseUrl}/plugins/themes/healthSciences/img/logo-rilm.svg" class="h-50"></a></li>
							<li class="list-group-item justify-content-center sm-img col ex-sm-img"><a href="https://elibrary.ru/title_about_new.asp?id=81325"><img src="{$baseUrl}/plugins/themes/healthSciences/img/logo-rinc.png" style="max-height: 70px"></a></li>
						</ul> *}
					</div>
				</section>



				{* <div class="content">

					<div class="content_description">
						{$additionalHomeContent}
					</div>
				</div>
				<div class="sidebar">
					<p class="info_text">{translate key="common.publisher"}:</p>
					{$context = Application::get()->getRequest()->getContext()}
					{$publisherMulti = $context->getLocalizedData('publisherMulti')}				
					<p>{$publisherMulti}
					</p>
					<p>{$publishedSince}</p>
					<p class="info_text">{translate key="locale.publish.period"}:</p>
					{$publishedTimes}
					<div class="issn">
						<div class="issn_left">
							<p class="info_text">{translate key="locale.issn.printed"}</p>
							<p>{$currentJournal->getData('printIssn')}</p>
						</div>
						<div class="issn_right">
							<p class="info_text">{translate key="locale.issn.online"}</p>
							<p>{$currentJournal->getData('onlineIssn')}</p>
						</div>
					</div>
				</div> *}

			</div>
			{* <div class="partners-wrap">
				<a href="https://www.ncste.kz/"><img src="/public/journals/1/logo/logo-ncgt.png"></a> 
				<a href="https://www.gov.kz/memleket/entities/quality/documents/details/520901?lang=ru"><img src="/public/journals/1/logo/logo-edugov.png"></a>
				<a href="https://www.rilm.org/resources.php?product=ram&type=music"><img src="/public/journals/1/logo/logo-rilm.svg"></a>
				<a href="https://cyberleninka.ru/journal/n/saryn?i=1140972"><img src="/public/journals/1/logo/logo-cyberleninka_1.svg"></a>
				<a href="https://nauka.kz/"><img src="/public/journals/1/logo/logo-nauka.png"></a>
				<a href="https://elibrary.ru/title_about_new.asp?id=81325"><img src="/public/journals/1/logo/logo-rinc.png"></a>
				<a href="https://www.crossref.org/"><img src="/public/journals/1/logo/logo-crossref.svg"></a>
				<a href=""><img src="/public/journals/1/logo/logo-openaccess.svg"></a>
				<a href="https://www.nlrk.kz/index.php"><img src="/public/journals/1/logo/logo-nacbibleoteka.png"></a>
				<a href="https://www.budapestopenaccessinitiative.org/read/"><img src="/public/journals/1/logo/logo-boai.webp"></a>
			</div> *}
		</div>
	</div>
</body>

{include file="frontend/components/footer.tpl"}