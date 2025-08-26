{**
 * templates/frontend/pages/submissions.tpl
 *
 * Copyright (c) 2014-2020 Simon Fraser University
 * Copyright (c) 2003-2020 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @brief Display the page to view the editorial team.
 *
 * @uses $currentContext Journal|Press The current journal or press
 * @uses $submissionChecklist array List of requirements for submissions
* @uses $submissionHeaderText array List of requirements for submissions
 *}
{include file="frontend/components/header.tpl" pageTitle="about.submissions"}

<div class="wrapper">
	<section id="article">
		<div class="container">
			<div class="row">
				<div class="col"></div>
				<div class="col col-12 col-lg-7">
					<div class="row">
						<h1 class="accent-color">{translate key="about.submissions"}</h1>
					</div>
					{$context = Application::get()->getRequest()->getContext()}
					{$submissionHeaderText = $context->getLocalizedData('submissionHeaderText')}
					{$submissionHeaderText}


					{* <div class="row" id="alert-card">
                        <div class="col-12 col-xl-8 d-flex flex-column justify-content-between">
                            <h2>ДЛЯ ОТПРАВКИ МАТЕРИАЛА ВАМ НУЖНО</h2>
                            <p class="mt-5">Войти в систему или Зарегистрироваться.</p>
                        </div>
                        <div class="col-12 col-xl-4 d-flex justify-content-start align-items-end pe-0">
                            <button class="btn btn-outline-light">Регистрация</button>
                            <button class="btn btn-outline-light ms-3">Вход</button>
                        </div>
                    </div> *}
					<div class="row mb-5" id="alert-card">
						{if $isUserLoggedIn}
							<div class="d-flex justify-content-center">
								{capture assign="newSubmission"}<a href="{url page="submission" op="wizard"}">{translate key="about.onlineSubmissions.newSubmission"}</a>{/capture}
								{capture assign="viewSubmissions"}<a href="{url page="submissions"}">{translate key="about.onlineSubmissions.viewSubmissions"}</a>{/capture}
								{translate key="about.onlineSubmissions.submissionActions" newSubmission=$newSubmission viewSubmissions=$viewSubmissions}
							</div>
						{else}

							{capture assign="login"}{translate key="about.onlineSubmissions.login"}{/capture}
							{capture assign="register"}{translate key="about.onlineSubmissions.register"}{/capture}
							<div class="col-12 col-xl-8 d-flex flex-column justify-content-between">
								{translate key="about.onlineSubmissions.registrationRequired" login=$login register=$register}
							</div>
							<div class="col-12 col-xl-4 d-flex justify-content-start align-items-end pe-0">
								<a href="{url page="user" op="register"}"><button class="btn btn-outline-light">{translate key="about.onlineSubmissions.register"}</button></a>
								<a href="{url page="login"}"><button class="btn btn-outline-light ms-2">{translate key="about.onlineSubmissions.login"}</button></a>
							</div>
						{/if}
					</div>
					
					{if $submissionChecklist}
						<div class="submissions-checklist">
							<p>{translate key="about.submissionPreparationChecklist.description"}</p>
							<p>
								{$submissionChecklist}
							</p>
						</div>
					{/if}

					{if $currentContext->getLocalizedData('authorGuidelines')}
						<div class="submissions-author-guidelines">
							<h2>
								{translate key="about.authorGuidelines"}
								{include file="frontend/components/editLink.tpl" page="management" op="settings" path="workflow" anchor="submission/authorGuidelines" sectionTitleKey="about.authorGuidelines"}
							</h2>
							{$currentContext->getLocalizedData('authorGuidelines')}
						</div>
					{/if}
				</div>
				<div class="col"></div>
			</div>
		</div>
	</section>
</div>



{* <div class="wrapper">
	<div class="container">
		<div class="page_article submissions-padding">
			<div class="page_description">
				<h2>{translate key="about.submissions"}</h2>
			</div>
			<div class="page_description_bottom">
			</div>
		</div>
		<div class="main">
			<div class="requirements_content">
				{$context = Application::get()->getRequest()->getContext()}
				{$submissionHeaderText = $context->getLocalizedData('submissionHeaderText')}
				{$submissionHeaderText}
				
			Login/register prompt
				{if $isUserLoggedIn}
					{capture assign="newSubmission"}<a href="{url page="submission" op="wizard"}">{translate key="about.onlineSubmissions.newSubmission"}</a>{/capture}
					{capture assign="viewSubmissions"}<a href="{url page="submissions"}">{translate key="about.onlineSubmissions.viewSubmissions"}</a>{/capture}
					<div class="alert alert-primary">
						{translate key="about.onlineSubmissions.submissionActions" newSubmission=$newSubmission viewSubmissions=$viewSubmissions}
					</div>
				{else}
					{capture assign="login"}<a href="{url page="login"}">{translate key="about.onlineSubmissions.login"}</a>{/capture}
					{capture assign="register"}<a href="{url page="user" op="register"}">{translate key="about.onlineSubmissions.register"}</a>{/capture}
					<div class="alert alert-primary">
						{translate key="about.onlineSubmissions.registrationRequired" login=$login register=$register}
					</div>
				{/if}

				{if $submissionChecklist}
					<div class="submissions-checklist">
						<p>{translate key="about.submissionPreparationChecklist.description"}</p>
						<p>
							{$submissionChecklist}
						</p>
					</div>
				{/if}

				{if $currentContext->getLocalizedData('authorGuidelines')}
					<div class="submissions-author-guidelines">
						<h2>
							{translate key="about.authorGuidelines"}
							{include file="frontend/components/editLink.tpl" page="management" op="settings" path="workflow" anchor="submission/authorGuidelines" sectionTitleKey="about.authorGuidelines"}
						</h2>
						{$currentContext->getLocalizedData('authorGuidelines')}
					</div>
				{/if}

				
			</div>
		</div>
	</div>
</div> *}

{include file="frontend/components/footer.tpl"}
