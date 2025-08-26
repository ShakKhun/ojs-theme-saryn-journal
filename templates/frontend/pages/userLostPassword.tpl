{**
 * templates/frontend/pages/userLostPassword.tpl
 *
 * Copyright (c) 2014-2020 Simon Fraser University
 * Copyright (c) 2000-2017 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @brief Password reset form.
 *
 *}
{include file="frontend/components/header.tpl" pageTitle="user.login.resetPassword"}

<div class="wrapper">
		<div class="container">
			<div class="main">
				<div class="auth_content">
                    <div class="auth_block">
                        <h4>{translate key="user.login.resetPassword"}</h4>
                        <p>{translate key="user.login.resetPasswordInstructions"}</p>
						{if $error}
							<div class="result_error_input">
								{translate key=$error}
							</div>
						{/if}
	
						<form class="form-lost-password" action="{url page="login" op="requestResetPassword"}" method="post">
							{csrf}
							
							<input type="email" placeholder="{translate key="user.login.registeredEmail"} *" name="email" id="email" value="{$email|escape}" required>
							
							<button class="default_btn" type="submit">
									{translate key="user.login.resetPassword"}
							</button>
							<div class="sign_in_btn">
								{if !$disableUserReg}
									{capture assign=registerUrl}{url page="user" op="register" source=$source}{/capture}
									<a href="{$registerUrl}">
										{translate key="user.login.registerNewAccount"}
									</a>
								{/if}
							</div>
						</form>

                    </div>
				</div>
			</div>
		</div>
</div>

{include file="frontend/components/footer.tpl"}