{**
 * templates/frontend/components/registrationForm.tpl
 *
 * Copyright (c) 2014-2020 Simon Fraser University
 * Copyright (c) 2003-2020 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @brief Display the basic registration form fields
 *
 * @uses $loginUrl string URL to post the login request
 * @uses $source string Optional URL to redirect to after successful login
 * @uses $username string Username
 * @uses $password string Password
 * @uses $remember boolean Should logged in cookies be preserved on this computer
 * @uses $disableUserReg boolean Can users register for this site?
 *}
{if $formType && $formType === "loginPage"}
	{assign var=usernameId value="username"}
	{assign var=passwordId value="password"}
	{assign var=rememberId value="remember"}
{elseif $formType && $formType === "loginModal"}
	{assign var=usernameId value="usernameModal"}
	{assign var=passwordId value="passwordModal"}
	{assign var=rememberId value="rememberModal"}
{/if}

{literal}
	<script src="https://www.google.com/recaptcha/api.js?render=6LfjlqkrAAAAAO79v7QCp3Ql7TnephDtbesHxPDj"></script>
	<script>
		grecaptcha.ready(function() {
			grecaptcha.execute('6LfjlqkrAAAAAO79v7QCp3Ql7TnephDtbesHxPDj', {action: 'login'}).then(function(token) {
				document.getElementById('g-recaptcha-response').value = token;
			});
		});
	</script>
{/literal}

<form id="login" method="post" action="{$loginUrl}">
	{csrf}
	<input type="hidden" name="source" value="{$source|strip_unsafe_html|escape}"/>
	<input type="hidden" id="g-recaptcha-response" name="g-recaptcha-response" id="g-recaptcha-response">

	<fieldset>
		<div>
			<input type="text" name="username" placeholder="{translate key="user.username"} *" id="{$usernameId}" value="{$username|escape}"
			       maxlength="32" required>
		</div>
		<div>
			<input type="password" name="password" placeholder="{translate key="user.password"} *" id="{$passwordId}" value="{$password|escape}"
			       maxlength="32" required>
		</div>
		<div>
			<p class="checkbox"><input type="checkbox" name="remember" id="{$rememberId}" value="1" checked="$remember"> {translate key="user.login.rememberUsernameAndPassword"}</p>
			<div>
				
			</div>
		</div>
		<button class="default_btn" type="submit">
				{translate key="user.login"}
		</button>
		<div class="forgot_password"><a href="{url page="login" op="lostPassword"}">
				{translate key="user.login.forgotPassword"}</a></div>
		
		{if !$disableUserReg}

			<div class="sign_in_btn">
				<p class="info_text">{translate key="plugins.themes.healthSciences.register.noAccount"}
					{capture assign=registerUrl}{url page="user" op="register" source=$source}{/capture}</p>
				<a href="{$registerUrl}">{translate key="plugins.themes.healthSciences.register.registerHere"}</a>
					<!-- <a href="https://new.sarynjournal.kz/index.php/saryn/login?source=https%3A%2F%2Fnew.sarynjournal.kz%2Findex.php%2Fsaryn%2Fuser%2Fprofile%2Froles" class="login">
					Login here</a> -->
			</div>
		{/if}
	</fieldset>
</form>
