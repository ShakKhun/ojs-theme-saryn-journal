{**
 * templates/frontend/components/header.tpl
 *
 * Copyright (c) 2014-2020 Simon Fraser University
 * Copyright (c) 2003-2020 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @brief Common frontend site header.
 *}

{* Determine whether a logo or title string is being displayed *}
{assign var="showingLogo" value=true}
{if !$displayPageHeaderLogo}
	{assign var="showingLogo" value=false}
{/if}

{capture assign="homeUrl"}
	{url page="index" router=$smarty.const.ROUTE_PAGE}
{/capture}

{* Logo or site title. Only use <h1> heading on the homepage.
	 Otherwise that should go to the page title. *}
{if $requestedOp == 'index'}
	{assign var="siteNameTag" value="h1"}
{else}
	{assign var="siteNameTag" value="div"}
{/if}

{* Determine whether to show a logo of site title *}
{capture assign="brand"}{strip}
				
{/strip}{/capture}

<!DOCTYPE html>
<html lang="{$currentLocale|replace:"_":"-"}" xml:lang="{$currentLocale|replace:"_":"-"}">
{if !$pageTitleTranslated}{capture assign="pageTitleTranslated"}{translate key=$pageTitle}{/capture}{/if}
{include file="frontend/components/headerHead.tpl"}
<body dir="{$currentLocaleLangDir|escape|default:"ltr"}">

{* Header *}
{* <header class="header">
	<div class="container">
		<div class="header_top">
			<div class="header_logo">
				
				<a href="{$homeUrl}">
					<img src="/public/journals/1/saryn-logo-white.svg" alt="Saryn Journal" class="img-fluid">
				</a>

			</div>
			<div class="header_language">
				{include file="frontend/components/languageSwitcher.tpl" id="languageLargeNav"}
			</div>
			<div class="header_auth logged_in">
				{load_menu name="user" id="	" ulClass="header-right-item" liClass="part-1"}
			</div>
			<div class="mobile_menu">
				<div class="burger_menu" id="burger_menu">
					<span></span>
				</div>
			</div>

			<form action="{url page="search"}" method="get" class="mobile_search" id="mobile_search">
				<input type="text" type="search" id="query" name="query" placeholder="{translate key="locale.search.placeholder"}" class="search_input">
				<div class="gradient_box"></div>
				<button type="submit"  class="search_btn"><img src="/plugins/themes/healthSciences/img/search.png" alt=""></button>
			</form>
		</div>
	</div>
	<span id="output"></span>
	<nav class="nav" id="main-menu">
		<div class="container">
			{capture assign="primaryMenu"}
				{load_menu name="primary" id="menu" ulClass="menu" liClass="dropdown_menu"}
			{/capture}
			{if !empty(trim($primaryMenu)) || $currentContext}
				{$primaryMenu}
			{/if} 
		</div>
	</nav>
</header> *}


<header id = "header">
  <div class="row align-items-center h-100 container">
    <div class="col-4 col-md-2">
      <a href="{$homeUrl}">
      {if $currentContext && $currentContext->getLocalizedData('pageHeaderLogoImage')}
          {assign var=logo value=$currentContext->getLocalizedData('pageHeaderLogoImage')}
          <img src="{$publicFilesDir}/{$logo.uploadName|escape}" alt="{$currentContext->getLocalizedName()|escape}" class="img-fluid">
      {/if}
        {* <img src="/public/journals/1/saryn-logo-white.svg" alt="Saryn Journal" class="img-fluid"> *}
      </a>
    </div>
    <div class="col-8 col-md-10 h-100 d-flex flex-column pe-0 ">
      <div class="flex-fill d-flex align-items-center justify-content-end">
        <a href="{url router=$smarty.const.ROUTE_PAGE page="search"}" id="search_button">
          <button class="btn btn-outline-secondary d-md-block d-sm-block d-xs-block d-lg-none p-0" style=" width: 48px;">
            <svg width="18" height="18" viewBox="0 0 18 18" fill="none" xmlns="http://www.w3.org/2000/svg">
              <path d="M7.7002 0C12 0.000106086 15.4999 3.49996 15.5 7.7998C15.5 9.59972 14.9003 11.2 13.9004 12.5L18 16.5996L16.5996 18L12.4004 13.7998C11.1004 14.7998 9.50012 15.4003 7.7002 15.4004C3.50026 15.4004 0.000106085 12.0001 0 7.7002C0 3.5002 3.5002 0 7.7002 0ZM7.7002 1.90039C6.10027 1.90045 4.60055 2.60063 3.60059 3.60059C2.50063 4.70054 1.90044 6.10028 1.90039 7.7002C1.90039 9.3002 2.60059 10.8008 3.60059 11.8008C4.7005 12.9005 6.10042 13.5 7.7002 13.5C9.3002 13.5 10.8008 12.8008 11.8008 11.8008C12.8008 10.8008 13.5 9.3002 13.5 7.7002C13.4999 6.10042 12.8006 4.60055 11.8008 3.60059C10.7008 2.50059 9.3002 1.90039 7.7002 1.90039Z" fill="#4C5578"/>
            </svg>
          </button>
        </a>


            
        <div class="header_auth logged_in d-none d-lg-block" id="customUserMenu">
          {load_menu name="user" id="" ulClass="header-right-item" liClass="part-1"}
        </div>


        <div class="header_language">
          {include file="frontend/components/languageSwitcher.tpl" id="languageLargeNav"}
        </div>


      </div>
      <nav class = "navbar navbar-expand-lg flex-fill justify-content-end p-0"> 
        <div class="container-fluid justify-content-end d-flex pe-0 h-100">
          <button class="navbar-toggler" type="button" id="menu-toggle">
            <div>
              <span class="pe-5">Меню</span>
              <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg" id = "open-button">
                <path d="M3 8H21C21.2652 8 21.5196 7.89464 21.7071 7.70711C21.8946 7.51957 22 7.26522 22 7C22 6.73478 21.8946 6.48043 21.7071 6.29289C21.5196 6.10536 21.2652 6 21 6H3C2.73478 6 2.48043 6.10536 2.29289 6.29289C2.10536 6.48043 2 6.73478 2 7C2 7.26522 2.10536 7.51957 2.29289 7.70711C2.48043 7.89464 2.73478 8 3 8ZM21 16H3C2.73478 16 2.48043 16.1054 2.29289 16.2929C2.10536 16.4804 2 16.7348 2 17C2 17.2652 2.10536 17.5196 2.29289 17.7071C2.48043 17.8946 2.73478 18 3 18H21C21.2652 18 21.5196 17.8946 21.7071 17.7071C21.8946 17.5196 22 17.2652 22 17C22 16.7348 21.8946 16.4804 21.7071 16.2929C21.5196 16.1054 21.2652 16 21 16ZM21 11H3C2.73478 11 2.48043 11.1054 2.29289 11.2929C2.10536 11.4804 2 11.7348 2 12C2 12.2652 2.10536 12.5196 2.29289 12.7071C2.48043 12.8946 2.73478 13 3 13H21C21.2652 13 21.5196 12.8946 21.7071 12.7071C21.8946 12.5196 22 12.2652 22 12C22 11.7348 21.8946 11.4804 21.7071 11.2929C21.5196 11.1054 21.2652 11 21 11Z" fill="#4C5578"/>
              </svg>
              <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg" id = "close-button">
                <path d="M13.4099 12.0002L19.7099 5.71019C19.8982 5.52188 20.004 5.26649 20.004 5.00019C20.004 4.73388 19.8982 4.47849 19.7099 4.29019C19.5216 4.10188 19.2662 3.99609 18.9999 3.99609C18.7336 3.99609 18.4782 4.10188 18.2899 4.29019L11.9999 10.5902L5.70994 4.29019C5.52164 4.10188 5.26624 3.99609 4.99994 3.99609C4.73364 3.99609 4.47824 4.10188 4.28994 4.29019C4.10164 4.47849 3.99585 4.73388 3.99585 5.00019C3.99585 5.26649 4.10164 5.52188 4.28994 5.71019L10.5899 12.0002L4.28994 18.2902C4.19621 18.3831 4.12182 18.4937 4.07105 18.6156C4.02028 18.7375 3.99414 18.8682 3.99414 19.0002C3.99414 19.1322 4.02028 19.2629 4.07105 19.3848C4.12182 19.5066 4.19621 19.6172 4.28994 19.7102C4.3829 19.8039 4.4935 19.8783 4.61536 19.9291C4.73722 19.9798 4.86793 20.006 4.99994 20.006C5.13195 20.006 5.26266 19.9798 5.38452 19.9291C5.50638 19.8783 5.61698 19.8039 5.70994 19.7102L11.9999 13.4102L18.2899 19.7102C18.3829 19.8039 18.4935 19.8783 18.6154 19.9291C18.7372 19.9798 18.8679 20.006 18.9999 20.006C19.132 20.006 19.2627 19.9798 19.3845 19.9291C19.5064 19.8783 19.617 19.8039 19.7099 19.7102C19.8037 19.6172 19.8781 19.5066 19.9288 19.3848C19.9796 19.2629 20.0057 19.1322 20.0057 19.0002C20.0057 18.8682 19.9796 18.7375 19.9288 18.6156C19.8781 18.4937 19.8037 18.3831 19.7099 18.2902L13.4099 12.0002Z" fill="#4C5578"/>
              </svg>
            </div>
          </button>
          <div class=" justify-content-end h-100 d-none d-lg-block" id="navbarSupportedContent">
            <ul class="navbar-nav h-100">
              {capture assign="primaryMenu"}
                {load_menu name="primary" id="menu" ulClass="menu" liClass="dropdown_menu"}
              {/capture}
              {if !empty(trim($primaryMenu)) || $currentContext}
                {$primaryMenu}
              {/if} 
                <a href="{url router=$smarty.const.ROUTE_PAGE page="search"}" id = "search-button" class="ms-4 ps-2">
                  <svg width="18" height="18" viewBox="0 0 18 18" fill="none" xmlns="http://www.w3.org/2000/svg">
                    <path d="M7.7002 0C12 0.000106086 15.4999 3.49996 15.5 7.7998C15.5 9.59972 14.9003 11.2 13.9004 12.5L18 16.5996L16.5996 18L12.4004 13.7998C11.1004 14.7998 9.50012 15.4003 7.7002 15.4004C3.50026 15.4004 0.000106085 12.0001 0 7.7002C0 3.5002 3.5002 0 7.7002 0ZM7.7002 1.90039C6.10027 1.90045 4.60055 2.60063 3.60059 3.60059C2.50063 4.70054 1.90044 6.10028 1.90039 7.7002C1.90039 9.3002 2.60059 10.8008 3.60059 11.8008C4.7005 12.9005 6.10042 13.5 7.7002 13.5C9.3002 13.5 10.8008 12.8008 11.8008 11.8008C12.8008 10.8008 13.5 9.3002 13.5 7.7002C13.4999 6.10042 12.8006 4.60055 11.8008 3.60059C10.7008 2.50059 9.3002 1.90039 7.7002 1.90039Z" fill="#4C5578"/>
                  </svg>
                </a>
              </li>
            </ul>
          </div>
        </div>
      </nav>
    </div>
  </div>


  <nav id="hidden-nav">
    <div class="pt-5 pb-4">
    
      {capture assign="primaryMenu"}
        {load_menu name="primary" id="menu" ulClass="menu" liClass="dropdown_menu"}
      {/capture}
      {if !empty(trim($primaryMenu)) || $currentContext}
        {$primaryMenu}
      {/if} 
      <div id=hidden-nav-buttons >
        {load_menu name="user" id="" ulClass="header-right-item" liClass="part-1"}
      </div>
      
    </div>
  </nav>

  {* <div class="hidden-menu" id="journal-menu">
    <div class="container">
      <div class="row">
        <div class="col">
          <ul>
            <li><a href="">О журнале</a></li>
            <li><a href="">Цели</a></li>
            <li><a href="">Редакционная коллегия</a></li>
          </ul>
        </div>
        <div class="col">
          <ul>
            <li><a href="">Новости и предложения</a></li>
            <li><a href="">Индексирование</a></li>
            <li><a href="">Партнеры</a></li>
          </ul>
        </div>
      </div>
    </div>
  </div> *}


{* 
  <div class="hidden-menu" id="author-menu">
    <div class="container">
      <div class="row">
        <div class="col">
          <ul>
            <li><a href="">Руководство для авторов</a></li>
            <li><a href="">Правила структурирования рукописи</a></li>
            <li><a href="">Требования к оформлению статьи</a></li>
          </ul>
        </div>
        <div class="col">
          <ul>
            <li><a href="">Правила оформления сведений об авторе</a></li>
            <li><a href="">Правила оформления Списка источников в References</a></li>
            <li><a href="">Авторские правила</a></li>
          </ul>
        </div>
      </div>
    </div>
  </div> *}

{* 
  <div class="hidden-menu" id="policy-menu">
    <div class="container">
      <div class="row">
        <div class="col">
          <ul>
            <li><a href="">Редакционная политика</a></li>
            <li><a href="">Этика научных публикаций</a></li>
            <li><a href="">Политика свободного доступа</a></li>
          </ul>
        </div>
        <div class="col">
          <ul>
            <li><a href="">Архивирование</a></li>
            <li><a href="">Распространение</a></li>
          </ul>
        </div>
      </div>
    </div>
  </div> *}

{*   
  <div class="hidden-menu" id="review-menu">
    <div class="container">
      <div class="row">
        <div class="col">
          <ul>
            <li><a href="">Порядок рецензирования</a></li>
            <li><a href="">Инструкции для рецензентов</a></li>
          </ul>
        </div>
        <div class="col">
          <ul>
          </ul>
        </div>
      </div>
    </div>
  </div> *}

  <div class="hidden-menu" id="search-menu">
    <div class="container">
      <div class="row">

        <form action="{url page='search'}" method="get" class="mobile_search p-0" id="mobile_search">
          <div class="input-group">
            <button type="submit" >            
              <span class="input-group-text bg-transparent border-0 p-0">
                  <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                    <path d="M21.7099 20.29L17.9999 16.61C19.44 14.8144 20.1374 12.5353 19.9487 10.2413C19.76 7.94733 18.6996 5.81281 16.9854 4.27667C15.2713 2.74053 13.0337 1.91954 10.7328 1.9825C8.43194 2.04546 6.24263 2.98759 4.61505 4.61517C2.98747 6.24275 2.04534 8.43207 1.98237 10.7329C1.91941 13.0338 2.74041 15.2714 4.27655 16.9855C5.81269 18.6997 7.94721 19.7601 10.2412 19.9488C12.5352 20.1375 14.8143 19.4401 16.6099 18L20.2899 21.68C20.3829 21.7738 20.4935 21.8482 20.6153 21.8989C20.7372 21.9497 20.8679 21.9758 20.9999 21.9758C21.1319 21.9758 21.2626 21.9497 21.3845 21.8989C21.5063 21.8482 21.6169 21.7738 21.7099 21.68C21.8901 21.4936 21.9909 21.2444 21.9909 20.985C21.9909 20.7257 21.8901 20.4765 21.7099 20.29ZM10.9999 18C9.61544 18 8.26206 17.5895 7.11091 16.8203C5.95977 16.0511 5.06256 14.9579 4.53275 13.6788C4.00293 12.3997 3.86431 10.9923 4.13441 9.63439C4.4045 8.27653 5.07119 7.02925 6.05016 6.05028C7.02912 5.07131 8.27641 4.40463 9.63427 4.13453C10.9921 3.86443 12.3996 4.00306 13.6787 4.53287C14.9578 5.06268 16.051 5.95989 16.8202 7.11103C17.5894 8.26218 17.9999 9.61556 17.9999 11C17.9999 12.8565 17.2624 14.637 15.9497 15.9498C14.6369 17.2625 12.8564 18 10.9999 18Z" fill="currentColor"/>
                  </svg>
                </span>
            </button>
            <input type="text" name="query" id="query" class="form-control search_input" placeholder="{translate key='locale.search.placeholder'}">
          </div>
        </form>



        {* <span>
          <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
            <path d="M21.7099 20.29L17.9999 16.61C19.44 14.8144 20.1374 12.5353 19.9487 10.2413C19.76 7.94733 18.6996 5.81281 16.9854 4.27667C15.2713 2.74053 13.0337 1.91954 10.7328 1.9825C8.43194 2.04546 6.24263 2.98759 4.61505 4.61517C2.98747 6.24275 2.04534 8.43207 1.98237 10.7329C1.91941 13.0338 2.74041 15.2714 4.27655 16.9855C5.81269 18.6997 7.94721 19.7601 10.2412 19.9488C12.5352 20.1375 14.8143 19.4401 16.6099 18L20.2899 21.68C20.3829 21.7738 20.4935 21.8482 20.6153 21.8989C20.7372 21.9497 20.8679 21.9758 20.9999 21.9758C21.1319 21.9758 21.2626 21.9497 21.3845 21.8989C21.5063 21.8482 21.6169 21.7738 21.7099 21.68C21.8901 21.4936 21.9909 21.2444 21.9909 20.985C21.9909 20.7257 21.8901 20.4765 21.7099 20.29ZM10.9999 18C9.61544 18 8.26206 17.5895 7.11091 16.8203C5.95977 16.0511 5.06256 14.9579 4.53275 13.6788C4.00293 12.3997 3.86431 10.9923 4.13441 9.63439C4.4045 8.27653 5.07119 7.02925 6.05016 6.05028C7.02912 5.07131 8.27641 4.40463 9.63427 4.13453C10.9921 3.86443 12.3996 4.00306 13.6787 4.53287C14.9578 5.06268 16.051 5.95989 16.8202 7.11103C17.5894 8.26218 17.9999 9.61556 17.9999 11C17.9999 12.8565 17.2624 14.637 15.9497 15.9498C14.6369 17.2625 12.8564 18 10.9999 18Z" fill="white"/>
          </svg>
        </span>
        <input type="text" class="form-control" placeholder="Поиск по сайту" id="search"> *}
      </div>
    </div>
  </div>


</header>