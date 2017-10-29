<?php echo $header; ?>
<div class="container">
  <ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
  </ul>
  <?php if ($success) { ?>
  <div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?></div>
  <?php } ?>
  <?php if ($error_warning) { ?>
  <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?></div>
  <?php } ?>
  <div class="row"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>
      <div class="row">
        <div class="col-sm-6">
          
                <div class="well col-sm-12">    
            
            <h2><?php echo $text_new_customer; ?></h2>
            <p><strong><?php echo $text_register; ?></strong></p>
            <p><?php echo $text_register_account; ?></p>
            <a href="<?php echo $register; ?>" class="btn btn-primary"><?php echo $button_continue; ?></a></div>
        </div>
        <div class="col-sm-6">
          
                <div class="well col-sm-12">    
            
            <h2><?php echo $text_returning_customer; ?></h2>
            <p><strong><?php echo $text_i_am_returning_customer; ?></strong></p>
            <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
              <div class="form-group">
                <label class="control-label" for="input-email"><?php echo $entry_email; ?></label>
                <input type="text" name="email" value="<?php echo $email; ?>" placeholder="<?php echo $entry_email; ?>" id="input-email" class="form-control" />
              </div>
              <div class="form-group">
                <label class="control-label" for="input-password"><?php echo $entry_password; ?></label>
                <input type="password" name="password" value="<?php echo $password; ?>" placeholder="<?php echo $entry_password; ?>" id="input-password" class="form-control" />
                <a href="<?php echo $forgotten; ?>"><?php echo $text_forgotten; ?></a></div>
              
                <input type="submit" value="<?php echo $button_login; ?>" class="btn btn-primary pull-left" />  
            
              <?php if ($redirect) { ?>
              <input type="hidden" name="redirect" value="<?php echo $redirect; ?>" />
              <?php } ?>
            </form>

                <?php //echo $column_login; ?>
                <?php if ($setting['so_sociallogin_status']) {?>
                    <column id="column-login" class="col-sm-8 pull-right">
                        <div class="row">
                            <?php if (isset($this->session->data['warning'])) { ?>
                            <div class="alert alert-warning"><i class="fa fa-check-circle"></i> <?php echo $this->session->data['warning']; ?></div>
                            <?php } ?>
                          
                            <div class="social_login pull-right" id="so_sociallogin">
                                <?php if($setting['so_sociallogin_fbstatus']){?>
                                    <?php if ($setting['so_sociallogin_button'] == 'image') {?>
                                        <a class="social-icon"  href="<?php echo $fblink; ?>">
                                            <img class="img-responsive" src="<?php echo $fbimage; ?>" 
                                                data-toggle="tooltip" alt="<?php echo $setting['so_sociallogin_fbtitle']; ?>" 
                                                title="<?php echo $setting['so_sociallogin_fbtitle']; ?>"
                                            />
                                        </a>
                                    <?php }else {?>
                                        <a href="<?php echo $fblink?>" class="btn btn-social-icon btn-sm btn-facebook"><i class="fa fa-facebook fa-fw" aria-hidden="true"></i></a>
                                    <?php } ?>
                                <?php } ?>
                                
                                <?php if($setting['so_sociallogin_twitstatus']){?>
                                    <?php if ($setting['so_sociallogin_button'] == 'image') {?>
                                        <a class="social-icon"  href="<?php echo $twitlink; ?>">
                                            <img class="img-responsive" src="<?php echo $twitimage; ?>" 
                                                data-toggle="tooltip" alt="<?php echo $setting['so_sociallogin_twittertitle']; ?>" 
                                                title="<?php echo $setting['so_sociallogin_twittertitle']; ?>"
                                            />
                                        </a>
                                    <?php }else {?>
                                        <a href="<?php echo $twitlink?>" class="btn btn-social-icon btn-sm btn-twitter"><i class="fa fa-twitter fa-fw" aria-hidden="true"></i></a>
                                    <?php }?>
                                <?php } ?>
                                
                                <?php if($setting['so_sociallogin_googlestatus']){?>
                                    <?php if ($setting['so_sociallogin_button'] == 'image') {?>
                                        <a class="social-icon"  href="<?php echo $googlelink; ?>">
                                            <img class="img-responsive" src="<?php echo $googleimage; ?>" 
                                                data-toggle="tooltip" alt="<?php echo $setting['so_sociallogin_googletitle']; ?>" 
                                                title="<?php echo $setting['so_sociallogin_googletitle']; ?>" 
                                            />
                                        </a>
                                    <?php }else {?>
                                        <a href="<?php echo $googlelink?>" class="btn btn-social-icon btn-sm btn-google-plus"><i class="fa fa-google fa-fw" aria-hidden="true"></i></a>
                                    <?php }?>
                                <?php } ?>
                                
                                <?php if($setting['so_sociallogin_linkstatus']){?>
                                    <?php if ($setting['so_sociallogin_button'] == 'image') {?>
                                        <a class="social-icon"  href="<?php echo $linkdinlink; ?>">
                                            <img class="img-responsive" src="<?php echo $linkdinimage; ?>" 
                                                data-toggle="tooltip" alt="<?php echo $setting['so_sociallogin_linkedintitle']; ?>" 
                                                title="<?php echo $setting['so_sociallogin_linkedintitle']; ?>"
                                            />
                                        </a>
                                    <?php }else {?>
                                        <a href="<?php echo $linkdinlink?>" class="btn btn-social-icon btn-sm btn-linkdin"><i class="fa fa-linkedin fa-fw" aria-hidden="true"></i></a>
                                    <?php }?>
                                <?php } ?>
                            </div>
                        </div>
                    </column>
                <?php }?>
            
          </div>
        </div>
      </div>
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>

                <style>
                @media(max-width:991px){
                    #column-login,.social_login,.socalicon{
                        float:none !important;
                        width:100%;
                    }
                    .account-login .btn-primary{
                        float:none !important;
                    }
                    .social_login {
                        padding:0 10px;
                    }
                }
                </style>
            
<?php echo $footer; ?>