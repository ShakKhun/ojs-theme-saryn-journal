<?php

/**
 * @file plugins/themes/healthSciences/HealthSciencesThemePlugin.inc.php
 *
 * Copyright (c) 2014-2023 Simon Fraser University
 * Copyright (c) 2003-2023 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @class HealthSciencesThemePlugin
 * @ingroup plugins_themes_healthSciences
 *
 * @brief Health Sciences theme
 */

use PKP\plugins\ThemePlugin;
use PKP\facades\Locale;
use PKP\core\PKPString;
use APP\core\Application;
use PKP\components\forms\FieldText;
use PKP\components\forms\FormComponent;
use PKP\plugins\GenericPlugin;
use PKP\plugins\Hook;
use APP\facades\Repo;

// use stdClass;
class HealthSciencesThemePlugin extends ThemePlugin
{

	/**
	 * Load the custom styles for our theme
	 * @return null
	 */
	public function init()
	{

		// Add theme options
		$this->addOption('baseColour', 'colour', array(
			'label' => 'plugins.themes.healthSciences.option.colour.label',
			'description' => 'plugins.themes.healthSciences.option.colour.description',
			'default' => '#10BECA',
		)
		);

		// Add usage stats display options
		$this->addOption('displayStats', 'FieldOptions', [
			'type' => 'radio',
			'label' => __('plugins.themes.healthSciences.option.displayStats.label'),
			'options' => [
				[
					'value' => 'none',
					'label' => __('plugins.themes.healthSciences.option.displayStats.none'),
				],
				[
					'value' => 'bar',
					'label' => __('plugins.themes.healthSciences.option.displayStats.bar'),
				],
				[
					'value' => 'line',
					'label' => __('plugins.themes.healthSciences.option.displayStats.line'),
				],
			],
			'default' => 'none',
		]);


		// Update colour based on theme option
		$additionalLessVariables = [];
		if ($this->getOption('baseColour') !== '#10BECA') {
			$additionalLessVariables[] = '@primary:' . $this->getOption('baseColour') . ';';
			$additionalLessVariables[] = '
				@primary-light: desaturate(lighten(@primary, 41%), 15%);
				@primary-text: darken(@primary, 15%);
				@primary-link: darken(@primary, 50%);
			';
		}

		// Update contrast colour based on primary colour
		$checkMarkColour = '000';
		if ($this->isColourDark($this->getOption('baseColour'))) {
			$checkMarkColour = 'FFF';
			$additionalLessVariables[] = '
				@contrast: rgba(255, 255, 255, 0.85);
				@primary-text: lighten(@primary, 15%);
				@primary-link: lighten(@primary, 50%);
				@btn-border-colour: @primary;
			';
		}

		/**
		 * Change the check mark image colour for better contrast,
		 * the URL is from bootstrap5/scss/_variables.scss => $form-check-input-checked-bg-image
		 */
		$checkImageUrl = 'data:image/svg+xml,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20"> ' .
			'<path fill="none" stroke="#' . $checkMarkColour . '" stroke-linecap="round" stroke-linejoin="round" ' .
			'stroke-width="3" d="M6 10l3 3l6-6"/></svg>';

		$additionalLessVariables[] = '
			@check-image-url: url(\'' . str_replace(['<', '>', '#'], ['%3c', '%3e', '%23'], $checkImageUrl) . '\');
		';

		$this->addScript('app-js', 'libs/bootstrap.js');

		// Load theme stylesheet and script
		$this->addStyle('app-css', 'libs/bootstrap.css');
		$this->addStyle('stylesheet', 'styles/index.less');
		$this->modifyStyle('stylesheet', array('addLessVariables' => join("\n", $additionalLessVariables)));

		// Styles for HTML galleys
		$this->addStyle('htmlFont', 'styles/htmlGalley.less', array('contexts' => 'htmlGalley'));
		$this->addStyle('htmlGalley', 'templates/plugins/generic/htmlArticleGalley/css/default.css', array('contexts' => 'htmlGalley'));

		// Styles for right to left scripts
		$locale = Locale::getLocale();
		if (Locale::getMetadata($locale)->isRightToLeft()) {
			$this->addStyle('rtl', 'styles/rtl.less');
		}

		// My custom style
		// $this->addStyle('stylesheet', 'styles/rebrand.css');

		// My custom js
		$this->addScript('rebrand-js', 'js/rebrand.js');


		// Add navigation menu areas for this theme
		$this->addMenuArea(array('primary', 'user', 'guideline', 'rule', 'policy', 'ethic', "adMenuGuideline", "adMenuPolicy", "forAuthors", "aboutJournal", "aboutPolicy", "forPeer"));

		// Get extra data for templates
		HookRegistry::add('TemplateManager::display', array($this, 'loadTemplateData'));
		Hook::add('Schema::get::context', [$this, 'addToSchema']);
		Hook::add('Form::config::before', [$this, 'addToForm']);

	}

	/**
	 * Get the display name of this theme
	 * @return string
	 */
	public function getDisplayName()
	{
		return __('plugins.themes.healthSciences.name');
	}

	/**
	 * Get the description of this plugin
	 * @return string
	 */
	public function getDescription()
	{
		return __('plugins.themes.healthSciences.description');
	}


	public function addToSchema(string $hookName, array $args)
	{
		$schema = $args[0]; /** @var stdClass */

		$schema->properties->publisherMulti = (object) [
			'type' => "string",
			// 'apiSummary' => true,
			'multilingual' => true,
			'validation' => ['nullable']
		];

		return false;
	}

	/**
	 * Extend the masthead form to add an institutionalHome input field
	 * in the journal/press settings
	 */
	public function addtoForm(string $hookName, FormComponent $form): bool
	{

		// Only modify the masthead form
		if (!defined('FORM_MASTHEAD') || $form->id !== FORM_MASTHEAD) {
			return false;
		}

		// Don't do anything at the site-wide level
		$context = Application::get()->getRequest()->getContext();
		if (!$context) {
			return false;
		}

		// Add a field to the form
		$form->addField(new FieldText('publisherMulti', [
			'label' => 'Издатель Мультиязычный',
			'groupId' => 'publishing',
			'isMultilingual' => true,
			'value' => $context->getData('publisherMulti'),

		]));

		return false;
	}

	/**
	 * Load custom data for templates
	 *
	 * @param string $hookName
	 * @param array $args [
	 *		@option TemplateManager
	 *		@option string Template file requested
	 *		@option string
	 *		@option string
	 *		@option string output HTML
	 * ]
	 */
	public function loadTemplateData($hookName, $args)
	{
		$templateMgr = $args[0];
		$request = Application::get()->getRequest();
		$context = $request->getContext();




		if (!defined('SESSION_DISABLE_INIT')) {

			// Get possible locales
			if ($context) {
				$locales = $context->getSupportedLocaleNames();
			} else {
				$locales = $request->getSite()->getSupportedLocaleNames();
			}

			// Load login form
			$loginUrl = $request->url(null, 'login', 'signIn');
			if (Config::getVar('security', 'force_login_ssl')) {
				$loginUrl = PKPString::regexp_replace('/^http:/', 'https:', $loginUrl);
			}

			$orcidImage = $this->getPluginPath() . '/templates/images/orcid.png';

			$countries = [];
			foreach (Locale::getCountries() as $country) {
				$countries[$country->getAlpha2()] = $country->getLocalName();
			}
			asort($countries);
			$test = 'KZ';

			$templateMgr->assign(
				array(
					'languageToggleLocales' => $locales,
					'loginUrl' => $loginUrl,
					'brandImage' => 'templates/images/ojs_brand_white.png',
					'orcidImage' => $orcidImage,
					'countries' => $countries,
					'test' => $test,
				)
			);
		}

		$templateMgr = $args[0];
		$submission = $templateMgr->getTemplateVars('citationArgs');
		$submissionId = $submission['submissionId'];
		// print_r($submission);
		$dateAccepted = "";
		if (isset($submissionId)) {
			// $editDecisionDao = DAORegistry::getDAO('EditDecisionDAO');
			$editDecisionDao = Repo::decision();
			$decisions = $editDecisionDao->get($submissionId);
			$log = date('Y-m-d H:i:s') . print_r($decisions,true);
			file_put_contents(__DIR__ . '/log.txt', $log . PHP_EOL, FILE_APPEND);
			foreach ($decisions as $decision) {
				if ($decision['stageId'] == '3' && $decision['decision'] == '1')
					$dateAccepted = $decision['dateDecided'];
			}
			$templateMgr->assign('acceptanceDate', $dateAccepted);
		}
	}
}

