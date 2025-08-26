{**
 * templates/frontend/components/registrationForm.tpl
 *
 * Copyright (c) 2014-2020 Simon Fraser University
 * Copyright (c) 2003-2020 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @brief Display the basic registration form fields
 *
 * @uses $locale string Locale key to use in the affiliate field
 * @uses $firstName string First name input entry if available
 * @uses $middleName string Middle name input entry if available
 * @uses $lastName string Last name input entry if available
 * @uses $countries array List of country options
 * @uses $country string The selected country if available
 * @uses $email string Email input entry if available
 * @uses $username string Username input entry if available
 *}

<div class="registration_slider">
	<div class="registration_slider_block" id="back_form_1">
		<h4>{translate key="user.createAccount"}</h4>
		<p class="form_count">1/3</p>
		<p class="required_input">{translate key="user.requiredField"}</p>
		<input placeholder="{translate key="user.email"} *" type="email" name="email" id="email" value="{$email|escape}" maxlength="90" autocomplete="email" required>

		<input style="display:none" type="text" placeholder="{translate key="user.username"} *" name="username" id="username" value="{$username|escape}" maxlength="90" autocomplete="username" required>

		<input placeholder="{translate key="user.password"} *" type="password" name="password" id="password" password="true" maxlength="32" required>

		<input placeholder="{translate key="user.repeatPassword"} *" type="password" name="password2" id="password2" password="true" maxlength="32" required>

		<!-- <input type="text" name="" id="" placeholder="ORCID ID (если имеется)"> -->

		<p class="checkbox"><input type="checkbox" name="emailConsent" value="1"{if $emailConsent} checked="checked"{/if}> {translate key="user.register.form.emailConsent"}</p>
		
		<a href="#back_form_2" class="default_btn" id="first_registrationform">{translate key="user.nextForm"}</a>
		<div class="sign_in_btn">
			<p class="info_text">{translate key="plugins.themes.healthSciences.register.haveAccount"}
			{capture assign="rolesProfileUrl"}{url page="user" op="profile" path="roles"}{/capture}</p>
			<a href="{url page="login" source=$rolesProfileUrl}" class="login">
				{translate key="plugins.themes.healthSciences.register.loginHere"}
			</a>
		</div>
	</div>
	<div class="registration_slider_block auth_block_2" id="back_form_2">
		<a href="#back_form_1" class="back_form">{translate key="user.prevForm"}</a>
		<p class="form_count">2/3</p>	
		<p class="required_input">{translate key="user.requiredField"}</p>
		<div class="input_row">
			<input placeholder="{translate key="user.givenName"} *" type="text" name="givenName" id="givenName" autocomplete="given-name" value="{$givenName|escape}" maxlength="255" required>
		</div>
		<div class="input_row">
			<input placeholder="{translate key="user.familyName"} *" type="text" name="familyName" id="familyName" autocomplete="family-name" value="{$familyName|escape}" maxlength="255">
		</div>
		<input placeholder="{translate key="user.phone"}" type="text" name="phone" id="phone" value="{$phone|escape}" maxlength="40" required placeholder="Телефон *"> 

		<select name="country" id="country" required>
			<option>{translate key="common.country"} *</option>
			{html_options options=$countries selected=$country}
		</select>
		<a href="#back_form_3" class="default_btn">{translate key="user.nextForm"}</a>
		<div class="sign_in_btn">
			<p class="info_text">{translate key="plugins.themes.healthSciences.register.haveAccount"}
			{capture assign="rolesProfileUrl"}{url page="user" op="profile" path="roles"}{/capture}</p>
			<a href="{url page="login" source=$rolesProfileUrl}" class="login">
				{translate key="plugins.themes.healthSciences.register.loginHere"}
			</a>
		</div>
	</div>
	<div class="registration_slider_block auth_block_2" id="back_form_3">
		<a href="#back_form_2" class="back_form">{translate key="user.prevForm"}</a>
		<p class="form_count">3/3</p>
		<p class="required_input">{translate key="user.requiredField"}</p>
		<div class="input_row">
			<input placeholder="{translate key="user.position"} *" type="text" name="position" id="position" value="{$position|escape}" maxlength="40" required> 
		</div>
		<div class="input_row">
			<input placeholder="{translate key="user.affiliation"} *" type="text" name="affiliation" id="affiliation" value="{$affiliation|escape}" maxlength="40" required> 
		</div>
		<!-- <p class="required_input">{translate key="user.requiredField"}</p> -->
		<div class="input_row">
			<input placeholder="{translate key="user.academicDegree"} *" type="text" name="academicDegree" id="academicDegree" value="{$academicDegree|escape}" maxlength="40" required> 

		</div>
		<div class="input_row">
			<input placeholder="{translate key="user.academicTitle"}" type="text" name="academicTitle" id="academicTitle" value="{$academicTitle|escape}" maxlength="40"> 
		</div>

		<p class="checkbox"><input type="checkbox" name="privacyConsent[{$smarty.const.CONTEXT_ID_NONE}]" id="privacyConsent[{$smarty.const.CONTEXT_ID_NONE}]" value="1"{if $privacyConsent[$smarty.const.CONTEXT_ID_NONE]} checked="checked"{/if}>
			{capture assign="privacyUrl"}{url router=$smarty.const.ROUTE_PAGE page="about" op="privacy"}{/capture}
			{translate key="user.register.form.privacyConsent" privacyUrl=$privacyUrl}
		</p>

		<div class="form-group form-group-buttons">
			<button class="default_btn" type="submit">
				{translate key="user.register"}
			</button>
		</div>
		<div class="sign_in_btn">
			<p class="info_text">{translate key="plugins.themes.healthSciences.register.haveAccount"}
			{capture assign="rolesProfileUrl"}{url page="user" op="profile" path="roles"}{/capture}</p>
			<a href="{url page="login" source=$rolesProfileUrl}" class="login">
				{translate key="plugins.themes.healthSciences.register.loginHere"}
			</a>
		</div>
	</div>
</div>
