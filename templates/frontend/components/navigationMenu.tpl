{**
 * templates/frontend/components/navigationMenu.tpl
 *
 * Copyright (c) 2014-2020 Simon Fraser University
 * Copyright (c) 2003-2020 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @brief Navigation menu template
 *
 * @uses navigationMenu array Hierarchical array of navigation menu item assignments
 * @uses id string Element ID to assign the outer <ul>
 * @uses ulClass string Class name(s) to assign the outer <ul>
 * @uses liClass string Class name(s) to assign all <li> elements
 *}

{if $navigationMenu}
	{if $id == "userNav"}
		<ul style="z-index:99;">
			{foreach key=field item=navigationMenuItemAssignment from=$navigationMenu->menuTree}
				{if !$navigationMenuItemAssignment->navigationMenuItem->getIsDisplayed()}
					{continue}
				{/if}
				{assign var="hasChildren" value=false}
				{if !empty($navigationMenuItemAssignment->children)}
					{assign var="hasChildren" value=true}
				{/if}
				{if $id === 'navigationUser'}
						<a href="{$navigationMenuItemAssignment->navigationMenuItem->getUrl()}"
							class="nav-link{if $hasChildren} dropdown-toggle{/if}"
							{if $hasChildren}
								id="{'navMenuDropdown'|concat:$field}"
								data-toggle="dropdown"
								aria-haspopup="true"
								aria-expanded="false"
							{/if}
						>
							{$navigationMenuItemAssignment->navigationMenuItem->getLocalizedTitle()}
						</a>
						{if $hasChildren}
							<div class="dropdown-menu {if $id === 'userNav'} dropdown-menu-right{/if}" aria-labelledby="{'navMenuDropdown'|concat:$field}">
								{foreach key=childField item=childNavigationMenuItemAssignment from=$navigationMenuItemAssignment->children}
									{if $childNavigationMenuItemAssignment->navigationMenuItem->getIsDisplayed()}
										<a class="dropdown-item" href="{$childNavigationMenuItemAssignment->navigationMenuItem->getUrl()}">
											{$childNavigationMenuItemAssignment->navigationMenuItem->getLocalizedTitle()}
										</a>
									{/if}
								{/foreach}
							</div>
						{/if}
					<li class="{$liClass|escape} {$navigationMenuItemAssignment->navigationMenuItem->getType()|lower}{if $hasChildren} dropdown{/if}">
					</li>
				{else}
					<li class="{$liClass|escape} {$navigationMenuItemAssignment->navigationMenuItem->getType()|lower}{if $hasChildren} dropdown{/if}" style="margin-bottom: unset; display:flex;">
						{if $hasChildren}
							<a href="#"
								class="logged_in_dropdown_btn"
								{if $hasChildren}
									id="{'navMenuDropdown'|concat:$field}"
									data-toggle="dropdown"
									aria-haspopup="true"
									aria-expanded="false"
								{else}
									style="padding: 5px 6px;"
								{/if}
							>
								{$navigationMenuItemAssignment->navigationMenuItem->getLocalizedTitle()}
							</a>
						{else}
							<a href="{$navigationMenuItemAssignment->navigationMenuItem->getUrl()}"
								class="logged_in_dropdown_btn"
								{if $hasChildren}
									id="{'navMenuDropdown'|concat:$field}"
									data-toggle="dropdown"
									aria-haspopup="true"
									aria-expanded="false"
								{else}
									style="padding: 5px 6px;"
								{/if}
							>
								{$navigationMenuItemAssignment->navigationMenuItem->getLocalizedTitle()}
							</a>
						{/if}
						{if $hasChildren}
							<img width="37" height="37" src="/plugins/themes/healthSciences/img/icon_profile.svg" alt="">
						{/if}
						{if $hasChildren}
							<ul class="dropdown-menu {if $id === 'userNav'} logged_in_dropdown{/if}" aria-labelledby="{'navMenuDropdown'|concat:$field}">
								{foreach key=childField item=childNavigationMenuItemAssignment from=$navigationMenuItemAssignment->children}
									{if $childNavigationMenuItemAssignment->navigationMenuItem->getIsDisplayed()}
										<li><a href="{$childNavigationMenuItemAssignment->navigationMenuItem->getUrl()}">
											{$childNavigationMenuItemAssignment->navigationMenuItem->getLocalizedTitle()}
										</a></li>
									{/if}
								{/foreach}
							</ul>
						{/if}
					</li>
				{/if}
			{/foreach}
		</ul>
	{else}
		<ul id="{$id|escape}" class="{$ulClass|escape} h-100">
			{foreach key=field item=navigationMenuItemAssignment from=$navigationMenu->menuTree}
				{if !$navigationMenuItemAssignment->navigationMenuItem->getIsDisplayed()}
					{continue}
				{/if}
				{assign var="hasChildren" value=false}
				{if !empty($navigationMenuItemAssignment->children)}
					{assign var="hasChildren" value=true}
				{/if}
				<li class="{$navigationMenuItemAssignment->navigationMenuItem->getType()|lower}{if $hasChildren} {$liClass|escape} disable-link{/if}">
					<a href="{$navigationMenuItemAssignment->navigationMenuItem->getUrl()}"
						class="link{if $hasChildren} dropdown{/if}"
						{if $hasChildren}
							id="{'navMenuDropdown'|concat:$field}"
							data-toggle="dropdown"
							aria-haspopup="true"
							aria-expanded="false"
						{/if}
					>
						<span>{$navigationMenuItemAssignment->navigationMenuItem->getLocalizedTitle()}</span>
						<span class="d-none svg-for-hidden-nav">
							<svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
								<path d="M12.7101 14.8302L16.9501 10.5902C17.0438 10.4972 17.1182 10.3866 17.1689 10.2648C17.2197 10.1429 17.2458 10.0122 17.2458 9.88019C17.2458 9.74818 17.2197 9.61747 17.1689 9.49561C17.1182 9.37375 17.0438 9.26315 16.9501 9.17019C16.7627 8.98394 16.5092 8.87939 16.2451 8.87939C15.9809 8.87939 15.7274 8.98394 15.5401 9.17019L12.0001 12.7102L8.46005 9.17019C8.27269 8.98394 8.01924 8.87939 7.75505 8.87939C7.49086 8.87939 7.23741 8.98394 7.05005 9.17019C6.95737 9.26363 6.88404 9.37444 6.83428 9.49628C6.78452 9.61812 6.75929 9.74858 6.76005 9.88019C6.75929 10.0118 6.78452 10.1423 6.83428 10.2641C6.88404 10.3859 6.95737 10.4967 7.05005 10.5902L11.2901 14.8302C11.383 14.9239 11.4936 14.9983 11.6155 15.0491C11.7373 15.0998 11.868 15.126 12.0001 15.126C12.1321 15.126 12.2628 15.0998 12.3846 15.0491C12.5065 14.9983 12.6171 14.9239 12.7101 14.8302Z" fill="white"/>
							</svg>
						</span>
					</a>
					{if $hasChildren}
						<ul class="sub_menu dropdown-content{if $id === 'userNav'} dropdown-menu-right{/if}" aria-labelledby="{'navMenuDropdown'|concat:$field}">
							{foreach key=childField item=childNavigationMenuItemAssignment from=$navigationMenuItemAssignment->children}
								{if $childNavigationMenuItemAssignment->navigationMenuItem->getIsDisplayed()}
									<li><a class="dropdown-item" href="{$childNavigationMenuItemAssignment->navigationMenuItem->getUrl()}">
										{$childNavigationMenuItemAssignment->navigationMenuItem->getLocalizedTitle()}
									</a></li>
								{/if}
							{/foreach}
						</ul>
					{/if}
				</li>
			{/foreach}
		</ul>
		{* <ul style="z-index:99;" id="{$id}">

			{foreach key=field item=navigationMenuItemAssignment from=$navigationMenu->menuTree}
				{if !$navigationMenuItemAssignment->navigationMenuItem->getIsDisplayed()}
					{continue}
				{/if}

				{capture assign = urlcurrent}{$smarty.server.REQUEST_URI}{/capture}

				<li class=""><a href="{$navigationMenuItemAssignment->navigationMenuItem->getUrl()}"
					class="nav-link{if $hasChildren} dropdown-toggle{/if}">
					{$navigationMenuItemAssignment->navigationMenuItem->getLocalizedTitle()}
				</a></li>
				
			{/foreach}
		</ul> *}
	{/if}
{/if}