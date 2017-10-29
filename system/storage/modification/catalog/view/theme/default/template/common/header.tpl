<?php
/******************************************************
 * @package	SO Theme Framework for Opencart 2.3.x
 * @author	http://www.magentech.com
 * @license	GNU General Public License
 * @copyright(C) 2008-2015 Magentech.com. All rights reserved.
*******************************************************/
require_once(DIR_SYSTEM . 'soconfig/classes/soconfig.php');
if( isset($registry)){$this->soconfig = new Soconfig($registry);}
else{ include(DIR_TEMPLATE.'default/template/soconfig/not_registry.php'); exit; } 

?>

<!DOCTYPE html>
<html>
<head>
<title><?php echo $title; ?></title>
<meta charset="UTF-8" />
<base href="<?php echo $base; ?>" />
<meta name="format-detection" content="telephone=no" />
<?php if($layouts){?><meta name="viewport" content="width=device-width, initial-scale=1"> <?php }?>
<?php if ($description) { ?><meta name="description" content="<?php echo $description; ?>" /><?php } ?>
<?php if ($keywords) { ?><meta name="keywords" content="<?php echo $keywords; ?>" /><?php } ?>
<!--[if IE]><meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"><![endif]-->

<?php // Begin General CSS ----- 
	
	if($direction=='ltr') $this->soconfig->addCss('catalog/view/javascript/bootstrap/css/bootstrap.min.css');
	else if($direction=='rtl') $this->soconfig->addCss('catalog/view/javascript/soconfig/css/bootstrap/bootstrap.rtl.min.css');
	else  $this->soconfig->addCss('catalog/view/javascript/bootstrap/css/bootstrap.min.css');
	if(!$layouts) 	  $this->soconfig->addCss('catalog/view/javascript/soconfig/css/bootstrap/bootstrap.none.css');

	$this->soconfig->addCss('catalog/view/javascript/font-awesome/css/font-awesome.min.css');
	
	$this->soconfig->addCss('catalog/view/javascript/soconfig/css/lib.css');
	$this->soconfig->addCss('catalog/view/theme/'.$theme.'/css/ie9-and-up.css');
	
	foreach ($styles as $style) $this->soconfig->addCss($style['href']);  
	if(isset($cssfile_status) && $cssfile_status ) foreach ($cssfile as $file) $this->soconfig->addCss($file);  
	
?>

<?php // Begin Themes Scripts ----
	$this->soconfig->addJs('catalog/view/javascript/jquery/jquery-2.1.1.min.js');
	$this->soconfig->addJs('catalog/view/javascript/bootstrap/js/bootstrap.min.js');
	$this->soconfig->addJs('catalog/view/javascript/soconfig/js/libs.js');
	$this->soconfig->addJs('catalog/view/javascript/soconfig/js/so.system.js');
	$this->soconfig->addJs('catalog/view/theme/'.$theme.'/js/so.custom.js');
	$this->soconfig->addJs('catalog/view/theme/'.$theme.'/js/jquery.easyembed.js');
	$this->soconfig->addJs('catalog/view/theme/'.$theme.'/js/common.js');
	if (!isset($toppanel_status) || $toppanel_status != 0) $this->soconfig->addJs('catalog/view/javascript/soconfig/js/toppanel.js');
	if (!isset($scroll_animation) || $scroll_animation != 0) $this->soconfig->addJs('catalog/view/javascript/soconfig/js/jquery.unveil.js');
	if(!defined('OWL_CAROUSEL')){
		$this->soconfig->addCss('catalog/view/javascript/soconfig/css/owl.carousel.css');
		$this->soconfig->addJs('catalog/view/javascript/soconfig/js/owl.carousel.js');
		define('OWL_CAROUSEL', 1);
	}
	foreach ($scripts as $script) $this->soconfig->addJs($script);
	if(isset($jsfile_status) && $jsfile_status) foreach ($jsfile as $file) $this->soconfig->addJs($file);
	
	$this->soconfig->scss_compass();
    $this->soconfig->css_out();
	$this->soconfig->js_out();
	
?>

<?php //Begin Google Fonts -----?>
<?php if (isset($url_body) && $body_status == 'google'):?> <link href='<?php echo $url_body ?>' rel='stylesheet' type='text/css'> <?php endif; ?>	
<?php if (isset($menu_status) && $menu_status == 'google'):?> <link href='<?php echo $url_menu ?>' rel='stylesheet' type='text/css'> <?php endif; ?>	
<?php if (isset($menu_heading) && $menu_heading == 'google'):?> <link href='<?php echo $url_heading ?>' rel='stylesheet' type='text/css'> <?php endif; ?>	

<?php if (isset($selector_body)) :?>
	<style type="text/css"><?php 
		if ($body_status =='google') echo html_entity_decode($selector_body).'{font-family:'. $family_body.'}';
		else echo $selector_body.'{font-family:'. $normal_body.'}';
		?>
	</style>
<?php endif; ?>		
<?php
 if (isset($selector_menu)) :?>
	<style type="text/css"><?php 
		if ($menu_status =='google') echo html_entity_decode($selector_menu).'{font-family:'. $family_menu.'}';
		else echo $selector_menu.'{font-family:'. $normal_menu.'}';
		?>
	</style>
<?php endif; ?>	

<?php if (isset($selector_heading)) :?>
	<style type="text/css"><?php 
		if ($heading_status =='google') echo html_entity_decode($selector_heading).'{font-family:'. $family_heading.'}';
		else echo $selector_heading.'{font-family:'. $normal_heading.'}';
		?>
	</style>
<?php endif; ?>	
<?php // End Google Fonts ----- ?>

<?php // Begin Custom Code ----?>
<?php if(isset($cssinput_status) && $cssinput_status){?><style type="text/css"><?php echo $custom_css;?></style><?php } ?>
<?php if(isset($jsinput_status) && $jsinput_status){?><script type="text/javascript"><?php echo $custom_js;?></script><?php } ?>
<?php if(isset($general_bgcolor) || isset($contentbg) ):?>	
	<style type="text/css">
	body {
			background-color:<?php echo (!empty($general_bgcolor) ? $general_bgcolor : ''); ?>;
		<?php if (isset($contentbg) && $contentbg != '' && $layoutstyle !='full') : ?>
            background-image: url("image/<?php echo $contentbg; ?>");
            background-repeat:<?php echo (!empty($content_bg_mode) ? $content_bg_mode : ''); ?>;
            background-attachment:<?php echo (!empty($content_attachment) ? $content_attachment : ''); ?>;
			background-position:top center; 
		<?php endif?>
	}
	</style>
<?php endif; ?>	

<?php // End Custom Code ----- ?>

<?php foreach ($links as $link) { ?>
	<link href="<?php echo $link['href']; ?>" rel="<?php echo $link['rel']; ?>" />
<?php } ?>

<?php foreach ($analytics as $analytic) { ?>
	<?php echo $analytic; ?>
<?php } ?>

</head>

<?php
	 //Render a class Body
	 $layoutstyle = isset($_GET['layoutbox']) ? $_GET['layoutbox'] : $layoutstyle;
	 $pattern = isset($_GET['pattern']) ? $_GET['pattern'] : $pattern;
	 
	 $cls_body  =  $class .' ';
	 $cls_body .=  $direction.' ' ;
	 $cls_body .= (($layouts) ? 'res'.'':'no-res').' ';
	 $cls_body .='layout-'.(isset($typelayout) ? $typelayout : '0').' ';
	 if( $layoutstyle!='full' && $contentbg=='' && $pattern !='none' )$cls_body .='pattern-'. $pattern;
	 $cls_wrapper = 'wrapper-'.$layoutstyle.' ' ;
	 $cls_wrapper .= 'banners-effect-'.$type_banner;
?>
<body class="<?php echo $cls_body; ?> ">
<div id="wrapper" class="<?php echo $cls_wrapper; ?>">   
	
	<?php 
	//Render preloader
	
	if (!isset($preloader) || $preloader != 0) {
		$path_preloader = DIR_TEMPLATE.$theme.'/template/soconfig/preloader.php';
		include($path_preloader);
	}
	?>
	
	<?php 
	//Select Type Of Header
	if(isset($typeheader)){
		$header_alert = '<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> Pleases Create Position Header</div>';
		switch ($typeheader) {
		case "1":
			$header1 = DIR_TEMPLATE.$theme.'/template/header/header1.tpl';
			$header1 = DIR_TEMPLATE.$theme.'/template/header/header1.tpl';
			if (file_exists($header1)) include($header1);
			else echo $header_alert; 
			break;
		case "2":
			$header2 = DIR_TEMPLATE.$theme.'/template/header/header2.tpl';
			if (file_exists($header2)) include($header2);
			else echo $header_alert; 
			break;
		case "3":
			$header3 = DIR_TEMPLATE.$theme.'/template/header/header3.tpl';
			if (file_exists($header3)) include($header3);
			else echo $header_alert; 
			break;
		case "4":
			$header4 = DIR_TEMPLATE.$theme.'/template/header/header4.tpl';
			if (file_exists($header4)) include($header4);
			else echo $header_alert; 
			break;
		case "5":
			$header5 = DIR_TEMPLATE.$theme.'/template/header/header5.tpl';
			if (file_exists($header5)) include($header5);
			else echo $header_alert; 
			break;
		case "6":
			$header6 = DIR_TEMPLATE.$theme.'/template/header/header6.tpl';
			if (file_exists($header6)) include($header6);
			else echo $header_alert; 
			break;
		case "7":
			$header7 = DIR_TEMPLATE.$theme.'/template/header/header7.tpl';
			if (file_exists($header7)) include($header7);
			else echo $header_alert; 
			break;
		case "8":
			$header8 = DIR_TEMPLATE.$theme.'/template/header/header8.tpl';
			if (file_exists($header8)) include($header8);
			else echo $header_alert; 
			break;				
		case "9":
			$header9 = DIR_TEMPLATE.$theme.'/template/header/header9.tpl';
			if (file_exists($header9)) include($header9);
			else echo $header_alert; 
			break;	
		}
	}else{
		include(DIR_TEMPLATE.$theme.'/template/header/header1.tpl');
	}
	?>
	<div id="socialLogin"></div>

                <?php if (isset($setting) && $setting['so_sociallogin_status'] && $setting['so_sociallogin_popuplogin']) {?>
                    <div class="modal fade in" id="so_sociallogin" tabindex="-1" role="dialog" aria-hidden="true">
                        <div class="modal-dialog block-popup-login">
                            <a href="javascript:void(0)" title="Close" class="close close-login fa fa-times-circle" data-dismiss="modal"></a>
                            <div class="tt_popup_login"><strong><?php echo $text_title_popuplogin?></strong></div>
                            <div class="block-content">
                                <div class=" col-reg registered-account">
                                    <div class="block-content">
                                        <form class="form form-login" action="<?php echo $login?>" method="post" id="login-form">
                                            <fieldset class="fieldset login" data-hasrequired="* Required Fields">
                                                <div class="field email required email-input">
                                                    <div class="control">
                                                        <input name="email" value="" autocomplete="off" id="email" type="email" class="input-text" title="Email" placeholder="E-mail Address" />
                                                    </div>
                                                </div>
                                                <div class="field password required pass-input">
                                                    <div class="control">
                                                        <input name="password" type="password" autocomplete="off" class="input-text" id="pass" title="Password" placeholder="Password" />
                                                    </div>
                                                </div>
                                                <?php if ($setting['so_sociallogin_status']) {?>
                                                <div class=" form-group">
                                                    <label class="control-label"><?php echo $text_title_login_with_social?></label>
                                                    <div>
                                                        <?php if ($setting['so_sociallogin_googlestatus']) {?>
                                                            <?php if ($setting['so_sociallogin_button'] == 'icon') {?>
                                                                <a href="<?php echo $googlelink?>" class="btn btn-social-icon btn-sm btn-google-plus"><i class="fa fa-google fa-fw" aria-hidden="true"></i></a>
                                                            <?php }else {?>
                                                                <a class="social-icon" href="<?php echo $googlelink?>">
                                                                    <img class="img-responsive" src="<?php echo $googleimage; ?>" 
                                                                        data-toggle="tooltip" alt="<?php echo $setting['so_sociallogin_googletitle']; ?>" 
                                                                        title="<?php echo $setting['so_sociallogin_googletitle']; ?>" 
                                                                    />
                                                                </a>
                                                            <?php }?>
                                                        <?php }?>
                                                        <?php if ($setting['so_sociallogin_fbstatus']) {?>
                                                            <?php if ($setting['so_sociallogin_button'] == 'icon') {?>
                                                                <a href="<?php echo $fblink?>" class="btn btn-social-icon btn-sm btn-facebook"><i class="fa fa-facebook fa-fw" aria-hidden="true"></i></a>
                                                            <?php }else {?>
                                                                <a href="<?php echo $fblink?>" class="social-icon">
                                                                    <img class="img-responsive" src="<?php echo $fbimage; ?>" 
                                                                        data-toggle="tooltip" alt="<?php echo $setting['so_sociallogin_fbtitle']; ?>" 
                                                                        title="<?php echo $setting['so_sociallogin_fbtitle']; ?>"
                                                                    />
                                                                </a>
                                                            <?php }?>
                                                        <?php }?>
                                                        <?php if ($setting['so_sociallogin_twitstatus']) {?>
                                                            <?php if ($setting['so_sociallogin_button'] == 'icon') {?>
                                                                <a href="<?php echo $twitlink?>" class="btn btn-social-icon btn-sm btn-twitter"><i class="fa fa-twitter fa-fw" aria-hidden="true"></i></a>
                                                            <?php }else {?>
                                                                <a class="social-icon"  href="<?php echo $twitlink; ?>">
                                                                    <img class="img-responsive" src="<?php echo $twitimage; ?>" 
                                                                        data-toggle="tooltip" alt="<?php echo $setting['so_sociallogin_twittertitle']; ?>" 
                                                                        title="<?php echo $setting['so_sociallogin_twittertitle']; ?>"
                                                                    />
                                                                </a>
                                                            <?php }?>
                                                        <?php }?>
                                                        <?php if ($setting['so_sociallogin_linkstatus']) {?>
                                                            <?php if ($setting['so_sociallogin_button'] == 'icon') {?>
                                                                <a href="<?php echo $linkdinlink?>" class="btn btn-social-icon btn-sm btn-linkdin"><i class="fa fa-linkedin fa-fw" aria-hidden="true"></i></a>
                                                            <?php }else {?>
                                                                <a class="social-icon"  href="<?php echo $linkdinlink; ?>">
                                                                    <img class="img-responsive" src="<?php echo $linkdinimage; ?>" 
                                                                        data-toggle="tooltip" alt="<?php echo $setting['so_sociallogin_linkedintitle']; ?>" 
                                                                        title="<?php echo $setting['so_sociallogin_linkedintitle']; ?>"
                                                                    />
                                                                </a>
                                                            <?php }?>
                                                        <?php }?>
                                                    </div>
                                                </div>
                                                <?php }?>
                                                <div class="secondary ft-link-p"><a class="action remind" href=""><span><?php echo $text_forgot_password?></span></a></div>
                                                <div class="actions-toolbar">
                                                    <div class="primary"><button type="submit" class="action login primary" name="send" id="send2"><span><?php echo $text_login?></span></button></div>
                                                </div>
                                            </fieldset>
                                        </form>
                                    </div>
                                </div>      
                                <div class="col-reg login-customer">
                                    <?php echo $text_colregister?>
                                    <a class="btn-reg-popup" title="<?php echo $text_register?>" href="<?php echo $register; ?>"><?php echo $text_create_account?></a>
                                </div>
                                <div style="clear:both;"></div>
                            </div>
                        </div>
                    </div>
                    <script type="text/javascript">
                        jQuery(document).ready(function($) {
                            var $window = $(window);
                            function checkWidth() {
                                var windowsize = $window.width();
                                if (windowsize > 767) {
                                    $('a[href*="account/login"]').click(function (e) {
                                        e.preventDefault();
                                        $("#so_sociallogin").modal('show');
                                    });
                                }
                            }
                            checkWidth();
                            $(window).resize(checkWidth);
                        });
                    </script>
                <?php }?>
            