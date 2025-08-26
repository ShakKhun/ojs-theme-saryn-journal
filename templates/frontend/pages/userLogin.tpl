{**
 * templates/frontend/pages/userLogin.tpl
 *
 * Copyright (c) 2014-2020 Simon Fraser University
 * Copyright (c) 2000-2017 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * User login form.
 *
 *}
{include file="frontend/components/header.tpl" pageTitle="user.login"}
<div class="wrapper">
	<div class="container">
		<div class="main">
			<div class="auth_content">
				<div class="auth_block">
					<h4>{translate key="user.login"}</h4>
					{if $loginMessage}
						<p>
							{translate key=$loginMessage}
						</p>
					{/if}

					{if $error}
						<div class="alert alert-danger" role="alert">
							{translate key=$error reason=$reason}
						</div>
					{/if}

					{include file="frontend/components/loginForm.tpl" formType = "loginPage"}
				</div>
			</div>
		</div>
	</div>
</div>
{include file="frontend/components/footer.tpl"}