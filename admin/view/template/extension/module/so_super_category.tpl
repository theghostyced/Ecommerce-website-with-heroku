<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
	<div class="page-header">
		<div class="container-fluid">
			<div class="pull-right">
				<button type="submit" form="form-featured" data-toggle="tooltip" title="<?php echo $objlang->get('entry_button_save'); ?>" class="btn btn-primary"><i class="fa fa-save"></i> <?php echo $objlang->get('entry_button_save')?></button>
				<a class="btn btn-success" onclick="$('#action').val('save_edit');$('#form-featured').submit();" data-toggle="tooltip" title="<?php echo $objlang->get('entry_button_save_and_edit'); ?>" ><i class="fa fa-pencil-square-o"></i> <?php echo $objlang->get('entry_button_save_and_edit')?></a>
				<a class="btn btn-info" onclick="$('#action').val('save_new');$('#form-featured').submit();" data-toggle="tooltip" title="<?php echo $objlang->get('entry_button_save_and_new'); ?>" ><i class="fa fa-book"></i>  <?php echo $objlang->get('entry_button_save_and_new')?></a>
				<a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $objlang->get('entry_button_cancel'); ?>" class="btn btn-danger"><i class="fa fa-reply"></i>  <?php echo $objlang->get('entry_button_cancel')?></a>
			</div>
			<h1><?php echo $objlang->get('heading_title_so'); ?></h1>
			<ul class="breadcrumb">
				<?php foreach ($breadcrumbs as $breadcrumb) { ?>
				<li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
				<?php } ?>
			</ul>
		</div>
	</div>
	<div class="container-fluid">
		<?php if (isset($error['warning'])) { ?>
			<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error['warning']; ?>
				<button type="button" class="close" data-dismiss="alert">&times;</button>
			</div>
		<?php } ?>
		<?php if (isset($success) && !empty($success)) { ?>
			<div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?>
				<button type="button" class="close" data-dismiss="alert">&times;</button>
			</div>
			<div class="alert alert-info"><i class="fa fa-info-circle"></i> <?php echo $text_layout; ?>
				<button type="button" class="close" data-dismiss="alert">&times;</button>
			</div>
		<?php } ?>
    <div class="panel panel-default">
		<div class="panel-heading">
			<h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $subheading; ?></h3>
		</div>
		<div class="panel-body">
			<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-featured" class="form-horizontal">
                <div class="row"> <?php // Nav tabs -->?>
                  <ul class="nav nav-tabs" role="tablist">
                    <li <?php if( $selectedid ==0 ) { ?>class="active" <?php } ?>> <a href="<?php echo $link; ?>"> <span class="fa fa-plus"></span> <?php echo $objlang->get('button_add_module');?></a></li>
                    <?php $i=1; foreach( $moduletabs as $key => $module ){ ?>
                    <li role="presentation" <?php if( $module['module_id']==$selectedid ) {?>class="active"<?php } ?>>
                      <a href="<?php echo $link; ?>&module_id=<?php echo $module['module_id']?>" aria-controls="bannermodule-<?php echo $key; ?>"  >
                        <span class="fa fa-pencil"></span> <?php echo $module['name']?>
                       </a>
                      </li>
                    <?php $i++ ;} ?>
                  </ul>
                </div>	
				<div class="row">
					<div class="col-sm-12">
						<?php $module_row = 1; ?>
					<?php foreach ($modules as $module) { ?>
						<?php if( $selectedid ){ ?>
							<div class="pull-right">
								<a href="<?php echo $action;?>&delete=1" class="remove btn btn-danger" > <span><i class="fa fa-remove"></i> <?php echo $objlang->get('entry_button_delete');?></span></a>
							</div>
						<?php } ?>
						<div  id="tab-module<?php echo $module_row; ?>" class="col-sm-12">
							<div class="form-group"> <?php // Module Name ?>
								<input type="hidden" name="action" id="action" value=""/>
								<label class="col-sm-3 control-label" for="input-name"> <b style="font-weight:bold; color:#f00">*</b> <span data-toggle="tooltip" title="<?php echo $objlang->get('entry_name_desc'); ?>"><?php echo $objlang->get('entry_name'); ?> </span></label>
								<div class="col-sm-9">
									<div class="col-sm-5">
										<input type="text" name="name" value="<?php echo $module['name']; ?>" placeholder="<?php echo $objlang->get('entry_name'); ?>" id="input-name" class="form-control" />
									</div>
									<?php if (isset($error['name'])) { ?>
										<div class="text-danger col-sm-12"><?php echo $error['name']; ?></div>
									<?php }?>
								</div>
							</div>
							<div class="form-group"> <?php // Header title ?>
								<label class="col-sm-3 control-label" for="input-head_name"><b style="font-weight:bold; color:#f00">*</b> <span data-toggle="tooltip" title="<?php echo $objlang->get('entry_head_name_desc'); ?>"><?php echo $objlang->get('entry_head_name'); ?> </span></label>
								<div class="col-sm-9">
									<div class="col-sm-5">
										<?php
											$i = 0;
											foreach ($languages as $language) { $i++; ?>
										<input type="text" name="module_description[<?php echo $language['language_id']; ?>][head_name]" placeholder="<?php echo $objlang->get('entry_head_name'); ?>" id="input-head-name-<?php echo $language['language_id']; ?>" value="<?php echo isset($module_description[$language['language_id']]['head_name']) ? $module_description[$language['language_id']]['head_name'] : ''; ?>" class="form-control <?php echo ($i>1) ? ' hide ' : ' first-name'; ?>" />
										<?php
												 if($i == 1){ ?>
										<input type="hidden" class="form-control" id="input-head_name" placeholder="<?php echo $objlang->get('entry_head_name'); ?>" value="<?php echo isset($module_description[$language['language_id']]['head_name']) ? $module_description[$language['language_id']]['head_name'] : ''; ?>" name="head_name">
										<?php }
												 ?>
										<?php } ?>
									</div>
									<div class="col-sm-3">
										<select  class="form-control" id="language">
											<?php foreach ($languages as $language) { ?>
												<option value="<?php echo $language['language_id']; ?>">
													<?php echo $language['name']; ?>
												</option>
											<?php } ?>
										</select>
									</div>
									<?php if (isset($error['head_name'])) { ?>
										<div class="text-danger col-sm-12"><?php echo $error['head_name']; ?></div>
									<?php }?>
								</div>
							</div>
							<div class="form-group"> <?php //Display header title  ?>
								<label class="col-sm-3 control-label" for="input-disp_title_module"> <span data-toggle="tooltip" title="<?php echo $objlang->get('entry_display_title_module_desc'); ?>"><?php echo $objlang->get('entry_display_title_module'); ?> </span></label>
								<div class="col-sm-9">
									<div class="col-sm-5">
										<select name="disp_title_module" id="input-disp_title_module" class="form-control">
											<?php
											if ($module['disp_title_module']) { ?>
											<option value="1" selected="selected"><?php echo $objlang->get('text_yes'); ?></option>
											<option value="0"><?php echo $objlang->get('text_no'); ?></option>
											<?php } else { ?>
											<option value="1"><?php echo $objlang->get('text_yes'); ?></option>
											<option value="0" selected="selected"><?php echo $objlang->get('text_no'); ?></option>
											<?php } ?>
										</select>
									</div>
								</div>
							</div>
							<div class="form-group"> <?php //Status  ?>
								<label class="col-sm-3 control-label" for="input-status"><span data-toggle="tooltip" title="<?php echo $objlang->get('entry_status_desc'); ?>"><?php echo $objlang->get('entry_status'); ?> </span></label>
								<div class="col-sm-9">
									<div class="col-sm-5">
										<select name="status" id="input-status" class="form-control">
											<?php if ($module['status']) { ?>
											<option value="1" selected="selected"><?php echo $objlang->get('text_enabled'); ?></option>
											<option value="0"><?php echo $objlang->get('text_disabled'); ?></option>
											<?php } else { ?>
											<option value="1"><?php echo $objlang->get('text_enabled'); ?></option>
											<option value="0" selected="selected"><?php echo $objlang->get('text_disabled'); ?></option>
											<?php } ?>
										</select>
									</div>
								</div>
							</div>
						</div>
						<div class="tab-pane">
							<ul class="nav nav-tabs" id="so_youtech">
								<li>
									<a href="#so_module" data-toggle="tab">
										<?php echo $objlang->get('entry_module'); ?>
									</a>
								</li>
								<li>
									<a href="#so_source_option" data-toggle="tab">
										<?php echo $objlang->get('entry_source_option'); ?>
									</a>
								</li>
								<li>
									<a href="#so_category_option" data-toggle="tab">
										<?php echo $objlang->get('entry_category_option'); ?>
									</a>
								</li>
								<li>
									<a href="#so_product_option" data-toggle="tab">
										<?php echo $objlang->get('entry_product_option'); ?>
									</a>
								</li>
								<li>
									<a href="#so_image_option" data-toggle="tab">
										<?php echo $objlang->get('entry_image_option'); ?>
									</a>
								</li>
								<li>
									<a href="#so_effect_option" data-toggle="tab">
										<?php echo $objlang->get('entry_effect_option'); ?>
									</a>
								</li>
								<li>
									<a href="#advanced_option" data-toggle="tab">
										<?php echo $objlang->get('entry_advanced_option') ?>
									</a>
								</li>
							</ul>
							<div class="tab-content">
						<?php // -----------------------------------------------------------------------  ?>
								<div class="tab-pane" id="so_module"> <?php //General Options ?>
									<div class="form-group"> <?php //Module Class Suffix ?>
										<label class="col-sm-3 control-label" for="input-advanced_mod_class_suffix"> <span data-toggle="tooltip" title="<?php echo $objlang->get('entry_advanced_mod_class_suffix_desc'); ?>"><?php echo $objlang->get('entry_advanced_mod_class_suffix'); ?> </span></label>
										<div class="col-sm-9">
											<div class="col-sm-5">
												<input type="text" name="advanced_mod_class_suffix" value="<?php echo $module['advanced_mod_class_suffix']; ?>" id="input-advanced_mod_class_suffix" class="form-control" />
											</div>
										</div>
									</div>
									<div class="form-group"> <?php //Link Target ?>
										<label class="col-sm-3 control-label" for="input-open_link"> <span data-toggle="tooltip" title="<?php echo $objlang->get('entry_open_link_desc'); ?>"><?php echo $objlang->get('entry_open_link'); ?> </span></label>
										<div class="col-sm-9">
											<div class="col-sm-5">
												<select name="item_link_target" id="input-open_link" class="form-control">
													<?php 
														foreach($item_link_targets as $option_id => $option_value)
														{
															$selected = ($option_id == $module['item_link_target']) ? 'selected' :'';
													?>
															<option value="<?php echo $option_id ?>" <?php echo $selected ?> ><?php echo $option_value ?></option>
													<?php
														}
													?>
												</select>
											</div>
										</div>
									</div>
								</div>
						<?php // -----------------------------------------------------------------------  ?>
								<div class="tab-pane" id="so_source_option"> <?php //Source Options ?>		
								<label class="col-sm-12"> 
									<u style="color: #003399; font-weight: bold;"><?php echo $objlang->get('label_for_category');?></u>
								</label>
									<div class="form-group"> <?php //Category	 ?>						
										<label class="col-sm-3 control-label" for="input-category"> <b style="color:#f00">*</b> <span data-toggle="tooltip" title="<?php echo $objlang->get('entry_category_desc'); ?>"><?php echo $objlang->get('entry_category'); ?> </span></label>
										<div class="col-sm-9">
											<div class="col-sm-5">
												<select name="category" id="input-category" class="form-control">
													<?php 
													foreach($module['categorys'] as $item)
														{
															$selected = ($item['category_id'] == $module['category']) ? 'selected' :'';
													?>
															<option value="<?php echo $item['category_id'] ?>" <?php echo $selected ?> > <?php echo $item['name'] ?></option>
													<?php
														}
													?>
												</select>
											</div>
											<?php if (isset($error['category'])) { ?>
												<div class="text-danger col-sm-12"><?php echo $error['category']; ?></div>
											<?php } ?>
										</div>
									</div>
									<div class="form-group"> <?php //Category Depth	 ?>	
										<label class="col-sm-3 control-label" for="input-category_depth"> <b style="color:#f00">*</b> <span data-toggle="tooltip" title="<?php echo $objlang->get('entry_category_depth_desc'); ?>"><?php echo $objlang->get('entry_category_depth'); ?> </span></label>
										<div class="col-sm-9">
											<div class="col-sm-5">
												<input type="text" name="category_depth" value="<?php echo $module['category_depth']; ?>" id="input-category_depth" class="form-control" />
											</div>
											<?php if (isset($error['category_depth'])) { ?>
												<div class="text-danger col-sm-12"><?php echo $error['category_depth']; ?></div>
											<?php } ?>
										</div>
									</div>											
									<label class="col-sm-12">
										<u style="color: #003399; font-weight: bold;"><?php echo $objlang->get('label_for_field_products');?></u>
									</label>						
									<div class="form-group"> <?php //Field to show tabs	 ?>	
										<label class="col-sm-3 control-label" for="input-field_product_tab"> <b style="color:#f00">*</b> <span data-toggle="tooltip" title="<?php echo $objlang->get('entry_field_product_tab_desc'); ?>"><?php echo $objlang->get('entry_field_product_tab'); ?> </span></label>
										<div class="col-sm-9">
											<div class="col-sm-5">
												<input type="text" name="field_product_tab" value="" placeholder="<?php echo $objlang->get('entry_field_product_tab'); ?>" id="input-field_product_tab" class="form-control" />
												<div id="featured-field_product_tab" class="well well-sm" style="height: 150px; overflow: auto;">
													<?php foreach ($module['field_product_tabs'] as $field_product_tab) { ?>
														<div id="featured-field_product_tab<?php echo $field_product_tab['product_id']; ?>"><i class="fa fa-minus-circle"></i> <?php echo $field_product_tab['name']; ?>
														<input type="hidden" name="field_product_tab[]" value="<?php echo $field_product_tab['product_id']; ?>" />
														</div>
													<?php } ?>
												</div>
											</div>
											<?php if (isset($error['field_product_tab'])) { ?>
												<div class="text-danger col-sm-12"><?php echo $error['field_product_tab']; ?></div>
											<?php } ?>
										</div>
									</div>
									<div class="form-group"> <?php //Field Preload	 ?>	
										<label class="col-sm-3 control-label" for="input-field_preload"> <span data-toggle="tooltip" title="<?php echo $objlang->get('entry_field_preload_desc'); ?>"><?php echo $objlang->get('entry_field_preload'); ?> </span></label>
										<div class="col-sm-9">
											<div class="col-sm-5">
												<select name="field_preload" id="input-field_preload" class="form-control">
													<?php 
													foreach($module['field_product_tabs'] as $option)
														{
															$selected = ($option['product_id'] == $module['field_preload']) ? 'selected' :'';
													?>
															<option value="<?php echo $option['product_id'] ?>" id="field_product<?php echo $option['product_id'] ?>" <?php echo $selected ?> ><?php echo $option['name'] ?></option>
													<?php
														}
													?>
												</select>
											</div>
										</div>
									</div>	
									<div class="form-group"> <?php //Limitation	 ?>	
										<label class="col-sm-3 control-label" for="input-limitation"> <b style="font-weight:bold; color:#f00">*</b> <span data-toggle="tooltip" title="<?php echo $objlang->get('entry_limitation_desc'); ?>"><?php echo $objlang->get('entry_limitation'); ?> </span></label>
										<div class="col-sm-9">
											<div class="col-sm-5">
												<input type="text" name="limitation" value="<?php echo $module['limitation']; ?>" id="input-limitation" class="form-control" />
											</div>
											<?php if (isset($error['limitation'])) { ?>
												<div class="text-danger col-sm-12"><?php echo $error['limitation']; ?></div>
											<?php } ?>
										</div>
									</div>
									<div class="form-group"> <?php //Ordering Direction	 ?>	
										<label class="col-sm-3 control-label" for="input-product_order"> <span data-toggle="tooltip" title="<?php echo $objlang->get('entry_product_order_desc'); ?>"><?php echo $objlang->get('entry_product_order'); ?> </span></label>
										<div class="col-sm-9">
											<div class="col-sm-5">
												<select name="product_ordering" id="input-product_order" class="form-control">
													<?php 
														foreach($product_orderings as $option_id => $option_value)
														{
															$selected = ($option_id == $module['product_ordering']) ? 'selected' :'';
													?>
															<option value="<?php echo $option_id ?>" <?php echo $selected ?> ><?php echo $option_value ?></option>
													<?php
														}
													?>
												</select>
											</div>
										</div>
									</div>						
								</div>
						<?php // -----------------------------------------------------------------------  ?>
								<div class="tab-pane" id="so_category_option"> <?php //Category Options	 ?>		
									<label class="col-sm-12"> 
										<u style="color: #003399; font-weight: bold;"><?php echo $objlang->get('label_for_category_slider');?></u>
									</label>
									<div class="form-group"> <?php //Column 0	 ?>		
										<label class="col-sm-3 control-label" for="input-category_column0"> <span data-toggle="tooltip" title="<?php echo $objlang->get('entry_nb_column0_desc'); ?>"><?php echo $objlang->get('entry_column'); ?> </span></label>
										<div class="col-sm-9">
											<div class="col-sm-5">
												<select name="category_column0" id="input-category_column0" class="form-control">
													<?php 
													foreach($list_columns as $option_id => $option_value)
														{
															$selected = ($option_id == $module['category_column0']) ? 'selected' :'';
													?>
															<option value="<?php echo $option_id ?>" <?php echo $selected ?> ><?php echo $option_value ?></option>
													<?php
														}
													?>
												</select>
											</div>
										</div>
									</div>
									<div class="form-group"> <?php //Column 1	 ?>	
										<label class="col-sm-3 control-label" for="input-category_column1"> <span data-toggle="tooltip" title="<?php echo $objlang->get('entry_nb_column1_desc'); ?>"><?php echo $objlang->get('entry_column'); ?> </span></label>
										<div class="col-sm-9">
											<div class="col-sm-5">
												<select name="category_column1" id="input-category_column1" class="form-control">
													<?php 
													foreach($list_columns as $option_id => $option_value)
														{
															$selected = ($option_id == $module['category_column1']) ? 'selected' :'';
													?>
															<option value="<?php echo $option_id ?>" <?php echo $selected ?> ><?php echo $option_value ?></option>
													<?php
														}
													?>
												</select>
											</div>
										</div>
									</div>						
									<div class="form-group"> <?php //Column 2	 ?>	
										<label class="col-sm-3 control-label" for="input-category_column2"> <span data-toggle="tooltip" title="<?php echo $objlang->get('entry_nb_column2_desc'); ?>"><?php echo $objlang->get('entry_column'); ?> </span></label>
										<div class="col-sm-9">
											<div class="col-sm-5">
												<select name="category_column2" id="input-category_column2" class="form-control">
													<?php 
													foreach($list_columns as $option_id => $option_value)
														{
															$selected = ($option_id == $module['category_column2']) ? 'selected' :'';
													?>
															<option value="<?php echo $option_id ?>" <?php echo $selected ?> ><?php echo $option_value ?></option>
													<?php
														}
													?>
												</select>
											</div>
										</div>
									</div>						
									<div class="form-group"> <?php //Column 3	 ?>	
										<label class="col-sm-3 control-label" for="input-category_column3"> <span data-toggle="tooltip" title="<?php echo $objlang->get('entry_nb_column3_desc'); ?>"><?php echo $objlang->get('entry_column'); ?> </span></label>
										<div class="col-sm-9">
											<div class="col-sm-5">
												<select name="category_column3" id="input-category_column3" class="form-control">
													<?php 
													foreach($list_columns as $option_id => $option_value)
														{
															$selected = ($option_id == $module['category_column3']) ? 'selected' :'';
													?>
															<option value="<?php echo $option_id ?>" <?php echo $selected ?> ><?php echo $option_value ?></option>
													<?php
														}
													?>
												</select>
											</div>
										</div>
									</div>
									<div class="form-group"> <?php //Column 4	 ?>	
										<label class="col-sm-3 control-label" for="input-category_column4"> <span data-toggle="tooltip" title="<?php echo $objlang->get('entry_nb_column4_desc'); ?>"><?php echo $objlang->get('entry_column'); ?> </span></label>
										<div class="col-sm-9">
											<div class="col-sm-5">
												<select name="category_column4" id="input-category_column4" class="form-control">
													<?php 
													foreach($list_columns as $option_id => $option_value)
														{
															$selected = ($option_id == $module['category_column4']) ? 'selected' :'';
													?>
															<option value="<?php echo $option_id ?>" <?php echo $selected ?> ><?php echo $option_value ?></option>
													<?php
														}
													?>
												</select>
											</div>
										</div>
									</div>
									<div class="form-group"> <?php //Category Title Maxlength	 ?>	
										<label class="col-sm-3 control-label" for="input-category_title_maxlength"> <b style="font-weight:bold; color:#f00">*</b> <span data-toggle="tooltip" title="<?php echo $objlang->get('entry_category_title_maxlength_desc'); ?>"><?php echo $objlang->get('entry_category_title_maxlength'); ?> </span></label>
										<div class="col-sm-9">
											<div class="col-sm-5">
												<input type="text" name="category_title_maxlength" value="<?php echo $module['category_title_maxlength']; ?>" id="input-category_title_maxlength" class="form-control" />
											</div>
											<?php if (isset($error['category_title_maxlength'])) { ?>
												<div class="text-danger col-sm-12"><?php echo $error['category_title_maxlength']; ?></div>
											<?php } ?>
										</div>
									</div>
									<div class="form-group"> <?php //Display Title Sub Category	 ?>	
										<label class="col-sm-3 control-label" for="input-display_title_sub_category"> <span data-toggle="tooltip" title="<?php echo $objlang->get('entry_display_title_sub_category_desc'); ?>"><?php echo $objlang->get('entry_display_title_sub_category'); ?> </span></label>
										<div class="col-sm-9">
											<div class="col-sm-5">
												<label class="radio-inline">
													<?php if ($module['display_title_sub_category']) { ?>
													<input type="radio" name="display_title_sub_category" value="1" checked="checked" />
													<?php echo $objlang->get('text_yes'); ?>
													<?php } else { ?>
													<input type="radio" name="display_title_sub_category" value="1" />
													<?php echo $objlang->get('text_yes'); ?>
													<?php } ?>
												</label>
												<label class="radio-inline">
													<?php if (!$module['display_title_sub_category']) { ?>
													<input type="radio" name="display_title_sub_category" value="0" checked="checked" />
													<?php echo $objlang->get('text_no'); ?>
													<?php } else { ?>
													<input type="radio" name="display_title_sub_category" value="0" />
													<?php echo $objlang->get('text_no'); ?>
													<?php } ?>
												</label>
											</div>
										</div>
									</div>
									<div class="form-group"> <?php //Display Slide Category	 ?>	
										<label class="col-sm-3 control-label" for="input-display_slide_category"> <span data-toggle="tooltip" title="<?php echo $objlang->get('entry_display_slide_category_desc'); ?>"><?php echo $objlang->get('entry_display_slide_category'); ?> </span></label>
										<div class="col-sm-9">
											<div class="col-sm-5">
												<label class="radio-inline">
													<?php if ($module['display_slide_category']) { ?>
													<input type="radio" name="display_slide_category" value="1" checked="checked" />
													<?php echo $objlang->get('text_yes'); ?>
													<?php } else { ?>
													<input type="radio" name="display_slide_category" value="1" />
													<?php echo $objlang->get('text_yes'); ?>
													<?php } ?>
												</label>
												<label class="radio-inline">
													<?php if (!$module['display_slide_category']) { ?>
													<input type="radio" name="display_slide_category" value="0" checked="checked" />
													<?php echo $objlang->get('text_no'); ?>
													<?php } else { ?>
													<input type="radio" name="display_slide_category" value="0" />
													<?php echo $objlang->get('text_no'); ?>
													<?php } ?>
												</label>
											</div>
										</div>
									</div>
									<div class="form-group"> <?php //Show Category Type	 ?>
										<label class="col-sm-3 control-label" for="input-show_category_type"> <span data-toggle="tooltip" title="<?php echo $objlang->get('entry_show_category_type_desc'); ?>"><?php echo $objlang->get('entry_show_category_type'); ?> </span></label>
										<div class="col-sm-9">
											<div class="col-sm-5">
												<label class="radio-inline">
													<?php if ($module['show_category_type']) { ?>
													<input type="radio" name="show_category_type" value="1" checked="checked" />
													<?php echo $objlang->get('text_slide'); ?>
													<?php } else { ?>
													<input type="radio" name="show_category_type" value="1" />
													<?php echo $objlang->get('text_slide'); ?>
													<?php } ?>
												</label>
												<label class="radio-inline">
													<?php if (!$module['show_category_type']) { ?>
													<input type="radio" name="show_category_type" value="0" checked="checked" />
													<?php echo $objlang->get('text_default'); ?>
													<?php } else { ?>
													<input type="radio" name="show_category_type" value="0" />
													<?php echo $objlang->get('text_default'); ?>
													<?php } ?>
												</label>
											</div>
										</div>
									</div>
									<div class="form-group"> <?php //Sub Category Title Maxlength	 ?>	
										<label class="col-sm-3 control-label" for="input-sub_category_title_maxlength"> <b style="font-weight:bold; color:#f00">*</b> <span data-toggle="tooltip" title="<?php echo $objlang->get('entry_sub_category_title_maxlength_desc'); ?>"><?php echo $objlang->get('entry_sub_category_title_maxlength'); ?> </span></label>
										<div class="col-sm-9">
											<div class="col-sm-5">
												<input type="text" name="sub_category_title_maxlength" value="<?php echo $module['sub_category_title_maxlength']; ?>" id="input-sub_category_title_maxlength" class="form-control" />
											</div>
											<?php if (isset($error['sub_category_title_maxlength'])) { ?>
												<div class="text-danger col-sm-12"><?php echo $error['sub_category_title_maxlength']; ?></div>
											<?php } ?>
										</div>
									</div>
									<label class="col-sm-12"> 
										<u style="color: #003399; font-weight: bold;"><?php echo $objlang->get('label_get_images_from_image');?></u>
									</label>
									<div class="form-group"> <?php //Category Width	 ?>	
										<label class="col-sm-3 control-label" for="input-category_width"> <b style="font-weight:bold; color:#f00">*</b> <span data-toggle="tooltip" title="<?php echo $objlang->get('entry_width_desc'); ?>"><?php echo $objlang->get('entry_width'); ?> </span></label>
										<div class="col-sm-9">
											<div class="col-sm-5">
												<input type="text" name="category_width" value="<?php echo $module['category_width']; ?>" id="input-category_width" class="form-control" />
											</div>
											<?php if (isset($error['category_width'])) { ?>
												<div class="text-danger col-sm-12"><?php echo $error['category_width']; ?></div>
											<?php } ?>
										</div>
									</div>
									<div class="form-group"> <?php //Category Height	 ?>
										<label class="col-sm-3 control-label" for="input-category_height"> <b style="font-weight:bold; color:#f00">*</b> <span data-toggle="tooltip" title="<?php echo $objlang->get('entry_height_desc'); ?>"><?php echo $objlang->get('entry_height'); ?> </span></label>
										<div class="col-sm-9">
											<div class="col-sm-5">
												<input type="text" name="category_height" value="<?php echo $module['category_height']; ?>" id="input-category_height" class="form-control" />
											</div>								
											<?php if (isset($error['category_height'])) { ?>
												<div class="text-danger col-sm-12"><?php echo $error['category_height']; ?></div>
											<?php } ?>
										</div>
									</div>
									<div class="form-group"> <?php //Category Placeholder path	 ?>
										<label class="col-sm-3 control-label" for="input-category_placeholder_path"> <b style="font-weight:bold; color:#f00">*</b> <span data-toggle="tooltip" title="<?php echo $objlang->get('entry_placeholder_path_desc'); ?>"><?php echo $objlang->get('entry_placeholder_path'); ?> </span></label>
										<div class="col-sm-9">
											<div class="col-sm-5">
												<input type="text" name="category_placeholder_path" value="<?php echo $module['category_placeholder_path']; ?>" id="input-category_placeholder_path" class="form-control" />
											</div>	
											<?php if (isset($error['category_placeholder_path'])) { ?>
											<div class="text-danger col-sm-12"><?php echo $error['category_placeholder_path']; ?></div>
											<?php } ?>
										</div>
									</div>
								</div>
						<?php // -----------------------------------------------------------------------  ?>	
								<div class="tab-pane" id="so_product_option"> <?php //Products Options		 ?>	
									<div class="form-group"> <?php //Column 1 ?>	
										<label class="col-sm-3 control-label" for="input-product_column0"> <span data-toggle="tooltip" title="<?php echo $objlang->get('entry_nb_column0_desc'); ?>"><?php echo $objlang->get('entry_column'); ?> </span></label>
										<div class="col-sm-9">
											<div class="col-sm-5">
												<select name="product_column0" id="input-product_column0" class="form-control">
													<?php 
													foreach($list_columns as $option_id => $option_value)
														{
															$selected = ($option_id == $module['product_column0']) ? 'selected' :'';
													?>
															<option value="<?php echo $option_id ?>" <?php echo $selected ?> ><?php echo $option_value ?></option>
													<?php
														}
													?>
												</select>
											</div>
										</div>
									</div>
									<div class="form-group"> <?php //Column 2 ?>	
										<label class="col-sm-3 control-label" for="input-product_column1"> <span data-toggle="tooltip" title="<?php echo $objlang->get('entry_nb_column1_desc'); ?>"><?php echo $objlang->get('entry_column'); ?> </span></label>
										<div class="col-sm-9">
											<div class="col-sm-5">
												<select name="product_column1" id="input-product_column1" class="form-control">
													<?php 
													foreach($list_columns as $option_id => $option_value)
														{
															$selected = ($option_id == $module['product_column1']) ? 'selected' :'';
													?>
															<option value="<?php echo $option_id ?>" <?php echo $selected ?> ><?php echo $option_value ?></option>
													<?php
														}
													?>
												</select>
											</div>
										</div>
									</div>						
									<div class="form-group"> <?php //Column 3 ?>	
										<label class="col-sm-3 control-label" for="input-product_column2"> <span data-toggle="tooltip" title="<?php echo $objlang->get('entry_nb_column2_desc'); ?>"><?php echo $objlang->get('entry_column'); ?> </span></label>
										<div class="col-sm-9">
											<div class="col-sm-5">
												<select name="product_column2" id="input-product_column2" class="form-control">
													<?php 
													foreach($list_columns as $option_id => $option_value)
														{
															$selected = ($option_id == $module['product_column2']) ? 'selected' :'';
													?>
															<option value="<?php echo $option_id ?>" <?php echo $selected ?> ><?php echo $option_value ?></option>
													<?php
														}
													?>
												</select>
											</div>
										</div>
									</div>						
									<div class="form-group"> <?php //Column 4 ?>	
										<label class="col-sm-3 control-label" for="input-product_column3"> <span data-toggle="tooltip" title="<?php echo $objlang->get('entry_nb_column3_desc'); ?>"><?php echo $objlang->get('entry_column'); ?> </span> </label>
										<div class="col-sm-9">
											<div class="col-sm-5">
												<select name="product_column3" id="input-product_column3" class="form-control">
													<?php 
													foreach($list_columns as $option_id => $option_value)
														{
															$selected = ($option_id == $module['product_column3']) ? 'selected' :'';
													?>
															<option value="<?php echo $option_id ?>" <?php echo $selected ?> ><?php echo $option_value ?></option>
													<?php
														}
													?>
												</select>
											</div>
										</div>
									</div>
									<div class="form-group"> <?php //Column 5 ?>	
										<label class="col-sm-3 control-label" for="input-product_column4"> <span data-toggle="tooltip" title="<?php echo $objlang->get('entry_nb_column4_desc'); ?>"><?php echo $objlang->get('entry_column'); ?> </span> </label>
										<div class="col-sm-9">
											<div class="col-sm-5">
												<select name="product_column4" id="input-product_column4" class="form-control">
													<?php 
													foreach($list_columns as $option_id => $option_value)
														{
															$selected = ($option_id == $module['product_column4']) ? 'selected' :'';
													?>
															<option value="<?php echo $option_id ?>" <?php echo $selected ?> ><?php echo $option_value ?></option>
													<?php
														}
													?>
												</select>
											</div>
										</div>
									</div>
									<div class="form-group"> <?php //Type Show ?>	
										<label class="col-sm-3 control-label" for="input-type_show"> <span data-toggle="tooltip" title="<?php echo $objlang->get('entry_type_show_desc'); ?>"><?php echo $objlang->get('entry_type_show'); ?> </span></label>
										<div class="col-sm-9">
											<div class="col-sm-5">
												<select name="type_show" id="input-type_show" class="form-control">
													<?php 
													foreach($type_shows as $option_id => $option_value)
														{
															$selected = ($option_id == $module['type_show']) ? 'selected' :'';
													?>
															<option value="<?php echo $option_id ?>" <?php echo $selected ?> ><?php echo $option_value ?></option>
													<?php
														}
													?>
												</select>
											</div>
										</div>
									</div>
									<div class="form-group"> <?php //Row ?>
										<label class="col-sm-3 control-label" for="input-row"> <span data-toggle="tooltip" title="<?php echo $objlang->get('entry_row_desc'); ?>"><?php echo $objlang->get('entry_row'); ?> </span></label>
										<div class="col-sm-9">
											<div class="col-sm-5">
												<select name="rows" id="input-row" class="form-control">
													<?php 
													for($i =1 ; $i<=10; $i++)
														{
															$selected = ($i == $module['rows']) ? 'selected' :'';
													?>
															<option value="<?php echo $i ?>" <?php echo $selected ?> ><?php echo $i ?></option>
													<?php
														}
													?>
												</select>
											</div>
										</div>
									</div>
									<div class="form-group"> <?php //Product Display Title ?>
										<label class="col-sm-3 control-label" for="input-product_display_title"> <span data-toggle="tooltip" title="<?php echo $objlang->get('entry_product_display_title_desc'); ?>"><?php echo $objlang->get('entry_product_display_title'); ?> </span></label>
										<div class="col-sm-9">
											<div class="col-sm-5">
												<label class="radio-inline">
													<?php if ($module['product_display_title']) { ?>
													<input type="radio" name="product_display_title" value="1" checked="checked" />
													<?php echo $objlang->get('text_yes'); ?>
													<?php } else { ?>
													<input type="radio" name="product_display_title" value="1" />
													<?php echo $objlang->get('text_yes'); ?>
													<?php } ?>
												</label>
												<label class="radio-inline">
													<?php if (!$module['product_display_title']) { ?>
													<input type="radio" name="product_display_title" value="0" checked="checked" />
													<?php echo $objlang->get('text_no'); ?>
													<?php } else { ?>
													<input type="radio" name="product_display_title" value="0" />
													<?php echo $objlang->get('text_no'); ?>
													<?php } ?>
												</label>
											</div>
										</div>
									</div>
									<div class="form-group"> <?php //Product Title Maxlength  ?>
										<label class="col-sm-3 control-label" for="input-product_title_maxlength"> <b style="font-weight:bold; color:#f00">*</b> <span data-toggle="tooltip" title="<?php echo $objlang->get('entry_product_title_maxlength_desc'); ?>"><?php echo $objlang->get('entry_product_title_maxlength'); ?> </span></label>
										<div class="col-sm-9">
											<div class="col-sm-5">
												<input type="text" name="product_title_maxlength" value="<?php echo $module['product_title_maxlength']; ?>" id="input-product_title_maxlength" class="form-control" />
											</div>
											<?php if (isset($error['product_title_maxlength'])) { ?>
												<div class="text-danger col-sm-12"><?php echo $error['product_title_maxlength']; ?></div>
											<?php } ?>
										</div>
									</div>
									<div class="form-group"> <?php //Product Display Description  ?>
										<label class="col-sm-3 control-label" for="input-product_display_description"> <span data-toggle="tooltip" title="<?php echo $objlang->get('entry_product_display_description_desc'); ?>"><?php echo $objlang->get('entry_product_display_description'); ?> </span></label>
										<div class="col-sm-9">
											<div class="col-sm-5">
												<label class="radio-inline">
													<?php if ($module['product_display_description']) { ?>
													<input type="radio" name="product_display_description" value="1" checked="checked" />
													<?php echo $objlang->get('text_yes'); ?>
													<?php } else { ?>
													<input type="radio" name="product_display_description" value="1" />
													<?php echo $objlang->get('text_yes'); ?>
													<?php } ?>
												</label>
												<label class="radio-inline">
													<?php if (!$module['product_display_description']) { ?>
													<input type="radio" name="product_display_description" value="0" checked="checked" />
													<?php echo $objlang->get('text_no'); ?>
													<?php } else { ?>
													<input type="radio" name="product_display_description" value="0" />
													<?php echo $objlang->get('text_no'); ?>
													<?php } ?>
												</label>
											</div>
										</div>
									</div>
									<div class="form-group"> <?php //Product Description Maxlength ?> 
										<label class="col-sm-3 control-label" for="input-product_description_maxlength"> <b style="font-weight:bold; color:#f00">*</b> <span data-toggle="tooltip" title="<?php echo $objlang->get('entry_product_description_maxlength_desc'); ?>"><?php echo $objlang->get('entry_product_description_maxlength'); ?> </span></label>
										<div class="col-sm-9">
											<div class="col-sm-5">
												<input type="text" name="product_description_maxlength" value="<?php echo $module['product_description_maxlength']; ?>" id="input-product_description_maxlength" class="form-control" />
											</div>
											<?php if (isset($error['product_description_maxlength'])) { ?>
												<div class="text-danger col-sm-12"><?php echo $error['product_description_maxlength']; ?></div>
											<?php } ?>
										</div>
									</div>
									<div class="form-group"> <?php //Product Display Price  ?>
										<label class="col-sm-3 control-label" for="input-product_display_price"> <span data-toggle="tooltip" title="<?php echo $objlang->get('entry_product_display_price_desc'); ?>"><?php echo $objlang->get('entry_product_display_price'); ?> </span></label>
										<div class="col-sm-9">
											<div class="col-sm-5">
												<label class="radio-inline">
													<?php if ($module['product_display_price']) { ?>
													<input type="radio" name="product_display_price" value="1" checked="checked" />
													<?php echo $objlang->get('text_yes'); ?>
													<?php } else { ?>
													<input type="radio" name="product_display_price" value="1" />
													<?php echo $objlang->get('text_yes'); ?>
													<?php } ?>
												</label>
												<label class="radio-inline">
													<?php if (!$module['product_display_price']) { ?>
													<input type="radio" name="product_display_price" value="0" checked="checked" />
													<?php echo $objlang->get('text_no'); ?>
													<?php } else { ?>
													<input type="radio" name="product_display_price" value="0" />
													<?php echo $objlang->get('text_no'); ?>
													<?php } ?>
												</label>
											</div>
										</div>
									</div>
									<div class="form-group"> <?php //Product Display Add To Cart  ?>
										<label class="col-sm-3 control-label" for="input-display_add_to_cart"> <span data-toggle="tooltip" title="<?php echo $objlang->get('entry_product_display_add_to_cart_desc'); ?>"><?php echo $objlang->get('entry_product_display_add_to_cart'); ?> </span></label>
										<div class="col-sm-9">
											<div class="col-sm-5">
												<label class="radio-inline">
													<?php if ($module['display_add_to_cart']) { ?>
													<input type="radio" name="display_add_to_cart" value="1" checked="checked" />
													<?php echo $objlang->get('text_yes'); ?>
													<?php } else { ?>
													<input type="radio" name="display_add_to_cart" value="1" />
													<?php echo $objlang->get('text_yes'); ?>
													<?php } ?>
												</label>
												<label class="radio-inline">
													<?php if (!$module['display_add_to_cart']) { ?>
													<input type="radio" name="display_add_to_cart" value="0" checked="checked" />
													<?php echo $objlang->get('text_no'); ?>
													<?php } else { ?>
													<input type="radio" name="display_add_to_cart" value="0" />
													<?php echo $objlang->get('text_no'); ?>
													<?php } ?>
												</label>
											</div>
										</div>
									</div>
									<div class="form-group"> <?php //Display wishlist  ?>
										<label class="col-sm-3 control-label" for="input-display_wishlist"> <span data-toggle="tooltip" title="<?php echo $objlang->get('entry_display_wishlist_desc'); ?>"><?php echo $objlang->get('entry_display_wishlist'); ?> </span></label>
										<div class="col-sm-9">
											<div class="col-sm-5">
												<label class="radio-inline">
													<?php if ($module['display_wishlist']) { ?>
													<input type="radio" name="display_wishlist" value="1" checked="checked" />
													<?php echo $objlang->get('text_yes'); ?>
													<?php } else { ?>
													<input type="radio" name="display_wishlist" value="1" />
													<?php echo $objlang->get('text_yes'); ?>
													<?php } ?>
												</label>
												<label class="radio-inline">
													<?php if (!$module['display_wishlist']) { ?>
													<input type="radio" name="display_wishlist" value="0" checked="checked" />
													<?php echo $objlang->get('text_no'); ?>
													<?php } else { ?>
													<input type="radio" name="display_wishlist" value="0" />
													<?php echo $objlang->get('text_no'); ?>
													<?php } ?>
												</label>
											</div>
										</div>
									</div>
									<div class="form-group"> <?php //Display compare  ?>
										<label class="col-sm-3 control-label" for="input-display_compare"> <span data-toggle="tooltip" title="<?php echo $objlang->get('entry_display_compare_desc'); ?>"><?php echo $objlang->get('entry_display_compare'); ?> </span></label>
										<div class="col-sm-9">
											<div class="col-sm-5">
												<label class="radio-inline">
													<?php if ($module['display_compare']) { ?>
													<input type="radio" name="display_compare" value="1" checked="checked" />
													<?php echo $objlang->get('text_yes'); ?>
													<?php } else { ?>
													<input type="radio" name="display_compare" value="1" />
													<?php echo $objlang->get('text_yes'); ?>
													<?php } ?>
												</label>
												<label class="radio-inline">
													<?php if (!$module['display_compare']) { ?>
													<input type="radio" name="display_compare" value="0" checked="checked" />
													<?php echo $objlang->get('text_no'); ?>
													<?php } else { ?>
													<input type="radio" name="display_compare" value="0" />
													<?php echo $objlang->get('text_no'); ?>
													<?php } ?>
												</label>
											</div>
										</div>
									</div>
									<div class="form-group"> <?php //Display display_rating  ?>
										<label class="col-sm-3 control-label" for="input-display_rating"> <span data-toggle="tooltip" title="<?php echo $objlang->get('entry_display_rating_desc'); ?>"><?php echo $objlang->get('entry_display_rating'); ?></span></label>
										<div class="col-sm-9">
											<div class="col-sm-5">
												<label class="radio-inline">
													<?php if ($module['display_rating']) { ?>
													<input type="radio" name="display_rating" value="1" checked="checked" />
													<?php echo $objlang->get('text_yes'); ?>
													<?php } else { ?>
													<input type="radio" name="display_rating" value="1" />
													<?php echo $objlang->get('text_yes'); ?>
													<?php } ?>
												</label>
												<label class="radio-inline">
													<?php if (!$module['display_rating']) { ?>
													<input type="radio" name="display_rating" value="0" checked="checked" />
													<?php echo $objlang->get('text_no'); ?>
													<?php } else { ?>
													<input type="radio" name="display_rating" value="0" />
													<?php echo $objlang->get('text_no'); ?>
													<?php } ?>
												</label>
											</div>
										</div>
									</div>
									<div class="form-group"> <?php //Display Sale  ?>
										<label class="col-sm-3 control-label" for="input-display_sale"> <span data-toggle="tooltip" title="<?php echo $objlang->get('entry_display_sale_desc'); ?>"><?php echo $objlang->get('entry_display_sale'); ?></span></label>
										<div class="col-sm-9">
											<div class="col-sm-5">
												<label class="radio-inline">
													<?php if ($module['display_sale']) { ?>
													<input type="radio" name="display_sale" value="1" checked="checked" />
													<?php echo $objlang->get('text_yes'); ?>
													<?php } else { ?>
													<input type="radio" name="display_sale" value="1" />
													<?php echo $objlang->get('text_yes'); ?>
													<?php } ?>
												</label>
												<label class="radio-inline">
													<?php if (!$module['display_sale']) { ?>
													<input type="radio" name="display_sale" value="0" checked="checked" />
													<?php echo $objlang->get('text_no'); ?>
													<?php } else { ?>
													<input type="radio" name="display_sale" value="0" />
													<?php echo $objlang->get('text_no'); ?>
													<?php } ?>
												</label>
											</div>
										</div>
									</div>
									<div class="form-group"> <?php //Display New  ?>
										<label class="col-sm-3 control-label" for="input-display_new"> <span data-toggle="tooltip" title="<?php echo $objlang->get('entry_display_new_desc'); ?>"><?php echo $objlang->get('entry_display_new'); ?></span></label>
										<div class="col-sm-9">
											<div class="col-sm-5">
												<label class="radio-inline">
													<?php if ($module['display_new']) { ?>
													<input type="radio" name="display_new" value="1" checked="checked" />
													<?php echo $objlang->get('text_yes'); ?>
													<?php } else { ?>
													<input type="radio" name="display_new" value="1" />
													<?php echo $objlang->get('text_yes'); ?>
													<?php } ?>
												</label>
												<label class="radio-inline">
													<?php if (!$module['display_new']) { ?>
													<input type="radio" name="display_new" value="0" checked="checked" />
													<?php echo $objlang->get('text_no'); ?>
													<?php } else { ?>
													<input type="radio" name="display_new" value="0" />
													<?php echo $objlang->get('text_no'); ?>
													<?php } ?>
												</label>
											</div>
										</div>
									</div>
									<div class="form-group" id="input-date_day_form"> <?php //New Date Day ?>
										<label class="col-sm-3 control-label" for="input-date_day"> <b style="font-weight:bold; color:#f00">*</b> <span data-toggle="tooltip" title="<?php echo $objlang->get('entry_date_day_desc'); ?>"><?php echo $objlang->get('entry_date_day'); ?></span></label>
										<div class="col-sm-9">
											<div class="col-sm-5">
												<input type="text" name="date_day" value="<?php echo $module['date_day']; ?>" id="input-date_day" class="form-control" />
											</div>
											<?php if (isset($error['date_day'])) { ?>
											<div class="text-danger col-sm-12"><?php echo $error['date_day']; ?></div>
											<?php }?>
										</div>
									</div>
									<div class="form-group">  <?php //Number Product Image  ?>
										<label class="col-sm-3 control-label" for="input-product_image_num"> <span data-toggle="tooltip" title="<?php echo $objlang->get('entry_product_image_num_desc'); ?>"><?php echo $objlang->get('entry_product_image_num'); ?> </span></label>
										<div class="col-sm-9">
											<div class="col-sm-5">
												<select name="product_image_num" id="input-product_image_num" class="form-control">
													<?php
													foreach($product_image_nums as $option_id => $option_value)
													{
													$selected = ($option_id == $module['product_image_num']) ? 'selected' :'';
													?>
													<option value="<?php echo $option_id ?>" <?php echo $selected ?> ><?php echo $option_value ?></option>
													<?php
														}
													?>
												</select>
											</div>
										</div>
									</div>
								</div>
						<?php // -----------------------------------------------------------------------  ?>	
								<div class="tab-pane" id="so_image_option"> <?php //Image Options ?>
									<div class="form-group"> <?php //Products Image ?>
										<label class="col-sm-3 control-label" for="input-product_image"> <span data-toggle="tooltip" title="<?php echo $objlang->get('entry_product_image_desc'); ?>"><?php echo $objlang->get('entry_product_image'); ?> </span></label>
										<div class="col-sm-9">
											<div class="col-sm-5">
												<label class="radio-inline">
													<?php if ($module['product_image']) { ?>
													<input type="radio" name="product_image" value="1" checked="checked" />
													<?php echo $objlang->get('text_yes'); ?>
													<?php } else { ?>
													<input type="radio" name="product_image" value="1" />
													<?php echo $objlang->get('text_yes'); ?>
													<?php } ?>
												</label>
												<label class="radio-inline">
													<?php if (!$module['product_image']) { ?>
													<input type="radio" name="product_image" value="0" checked="checked" />
													<?php echo $objlang->get('text_no'); ?>
													<?php } else { ?>
													<input type="radio" name="product_image" value="0" />
													<?php echo $objlang->get('text_no'); ?>
													<?php } ?>
												</label>
											</div>
										</div>
									</div>
									<div class="form-group"> <?php //Products Get Image From Tab Data ?>
										<label class="col-sm-3 control-label" for="input-product_get_image_data"> <span data-toggle="tooltip" title="<?php echo $objlang->get('entry_product_get_image_data_desc'); ?>"><?php echo $objlang->get('entry_product_get_image_data'); ?> </span></label>
										<div class="col-sm-9">
											<div class="col-sm-5">
												<label class="radio-inline">
													<?php if ($module['product_get_image_data']) { ?>
													<input type="radio" name="product_get_image_data" value="1" checked="checked" />
													<?php echo $objlang->get('text_yes'); ?>
													<?php } else { ?>
													<input type="radio" name="product_get_image_data" value="1" />
													<?php echo $objlang->get('text_yes'); ?>
													<?php } ?>
												</label>
												<label class="radio-inline">
													<?php if (!$module['product_get_image_data']) { ?>
													<input type="radio" name="product_get_image_data" value="0" checked="checked" />
													<?php echo $objlang->get('text_no'); ?>
													<?php } else { ?>
													<input type="radio" name="product_get_image_data" value="0" />
													<?php echo $objlang->get('text_no'); ?>
													<?php } ?>
												</label>
											</div>
										</div>
									</div>
									<div class="form-group"> <?php //Products Get Image From Tab Image ?>
										<label class="col-sm-3 control-label" for="input-product_get_image_image"> <span data-toggle="tooltip" title="<?php echo $objlang->get('entry_product_get_image_image_desc'); ?>"><?php echo $objlang->get('entry_product_get_image_image'); ?> </span></label>
										<div class="col-sm-9">
											<div class="col-sm-5">
												<label class="radio-inline">
													<?php if ($module['product_get_image_image']) { ?>
													<input type="radio" name="product_get_image_image" value="1" checked="checked" />
													<?php echo $objlang->get('text_yes'); ?>
													<?php } else { ?>
													<input type="radio" name="product_get_image_image" value="1" />
													<?php echo $objlang->get('text_yes'); ?>
													<?php } ?>
												</label>
												<label class="radio-inline">
													<?php if (!$module['product_get_image_image']) { ?>
													<input type="radio" name="product_get_image_image" value="0" checked="checked" />
													<?php echo $objlang->get('text_no'); ?>
													<?php } else { ?>
													<input type="radio" name="product_get_image_image" value="0" />
													<?php echo $objlang->get('text_no'); ?>
													<?php } ?>
												</label>
											</div>
										</div>
									</div>					
									<div class="form-group"> <?php //Product Width ?>
										<label class="col-sm-3 control-label" for="input-product_width"> <b style="font-weight:bold; color:#f00">*</b> <span data-toggle="tooltip" title="<?php echo $objlang->get('entry_width_desc'); ?>"><?php echo $objlang->get('entry_width'); ?> </span></label>
										<div class="col-sm-9">
											<div class="col-sm-5">
												<input type="text" name="product_width" value="<?php echo $module['product_width']; ?>" id="input-product_width" class="form-control" />
											</div>
											<?php if (isset($error['product_width'])) { ?>
												<div class="text-danger col-sm-12"><?php echo $error['product_width']; ?></div>
											<?php } ?>
										</div>
									</div>
									<div class="form-group"> <?php //Product Height ?>
										<label class="col-sm-3 control-label" for="input-product_height"> <b style="font-weight:bold; color:#f00">*</b> <span data-toggle="tooltip" title="<?php echo $objlang->get('entry_height_desc'); ?>"><?php echo $objlang->get('entry_height'); ?> </span></label>
										<div class="col-sm-9">
											<div class="col-sm-5">
												<input type="text" name="product_height" value="<?php echo $module['product_height']; ?>" id="input-product_height" class="form-control" />
											</div>								
											<?php if (isset($error['product_height'])) { ?>
												<div class="text-danger col-sm-12"><?php echo $error['product_height']; ?></div>
											<?php } ?>
										</div>
									</div>
									<div class="form-group"> <?php //Product Placeholder path ?>
										<label class="col-sm-3 control-label" for="input-product_placeholder_path"> <b style="font-weight:bold; color:#f00">*</b> <span data-toggle="tooltip" title="<?php echo $objlang->get('entry_placeholder_path_desc'); ?>"><?php echo $objlang->get('entry_placeholder_path'); ?> </span></label>
										<div class="col-sm-9">
											<div class="col-sm-5">
												<input type="text" name="product_placeholder_path" value="<?php echo $module['product_placeholder_path']; ?>" id="input-product_placeholder_path" class="form-control" />
											</div>	
											<?php if (isset($error['product_placeholder_path'])) { ?>
											<div class="text-danger col-sm-12"><?php echo $error['product_placeholder_path']; ?></div>
											<?php } ?>
										</div>
									</div>		
								</div>
						<?php // -----------------------------------------------------------------------  ?> 
								<div class="tab-pane" id="so_effect_option"> <?php //Effect Options ?>
									<label class="col-sm-12"> 
										<u style="color: #003399; font-weight: bold;"><?php echo $objlang->get('label_for_item_product')?></u>
									</label>
									<div class="form-group"> <?php //Effect ?>
										<label class="col-sm-3 control-label" for="input-effect"> <span data-toggle="tooltip" title="<?php echo $objlang->get('entry_effect_desc'); ?>"><?php echo $objlang->get('entry_effect'); ?> </span></label>
										<div class="col-sm-9">
											<div class="col-sm-5">
												<select name="effect" id="input-effect" class="form-control">
													<?php 
													foreach($effects as $option_id => $option_value)
														{
															$selected = ($option_id == $module['effect']) ? 'selected' :'';
													?>
															<option value="<?php echo $option_id ?>" <?php echo $selected ?> ><?php echo $option_value ?></option>
													<?php
														}
													?>
												</select>
											</div>
										</div>
									</div>
									<div class="form-group"> <?php //Duration ?>
										<label class="col-sm-3 control-label" for="input-product_duration"> <b style="font-weight:bold; color:#f00">*</b> <span data-toggle="tooltip" title="<?php echo $objlang->get('entry_duration_desc'); ?>"><?php echo $objlang->get('entry_duration'); ?> </span></label>
										<div class="col-sm-9">
											<div class="col-sm-5">
												<input type="text" name="product_duration" value="<?php echo $module['product_duration']; ?>" id="input-product_duration" class="form-control" />
											</div>
											<?php if (isset($error['product_duration'])) { ?>
												<div class="text-danger col-sm-12"><?php echo $error['product_duration']; ?></div>
											<?php } ?>
										</div>
									</div>
									<div class="form-group"> <?php //Delay ?>
										<label class="col-sm-3 control-label" for="input-product_delay"> <b style="font-weight:bold; color:#f00">*</b> <span data-toggle="tooltip" title="<?php echo $objlang->get('entry_delay_desc'); ?>"><?php echo $objlang->get('entry_delay'); ?> </span></label>
										<div class="col-sm-9">
											<div class="col-sm-5">
												<input type="text" name="product_delay" value="<?php echo $module['product_delay']; ?>" id="input-product_delay" class="form-control" />
											</div>
											<?php if (isset($error['product_delay'])) { ?>
												<div class="text-danger col-sm-12"><?php echo $error['product_delay']; ?></div>
											<?php } ?>
										</div>
									</div>
									<label class="col-sm-12"> 
										<u style="color: #003399; font-weight: bold;"><?php echo $objlang->get('label_for_subcategory');?></u>
									</label>
									<div class="form-group"> <?php //Center ?>
										<label class="col-sm-3 control-label" for="input-subcategory_center"> <span data-toggle="tooltip" title="<?php echo $objlang->get('entry_center_desc'); ?>"><?php echo $objlang->get('entry_center'); ?> </span></label>
										<div class="col-sm-9">
											<div class="col-sm-5">
												<label class="radio-inline">
													<?php if ($module['subcategory_center']) { ?>
													<input type="radio" name="subcategory_center" value="1" checked="checked" />
													<?php echo $objlang->get('text_yes'); ?>
													<?php } else { ?>
													<input type="radio" name="subcategory_center" value="1" />
													<?php echo $objlang->get('text_yes'); ?>
													<?php } ?>
												</label>
												<label class="radio-inline">
													<?php if (!$module['subcategory_center']) { ?>
													<input type="radio" name="subcategory_center" value="0" checked="checked" />
													<?php echo $objlang->get('text_no'); ?>
													<?php } else { ?>
													<input type="radio" name="subcategory_center" value="0" />
													<?php echo $objlang->get('text_no'); ?>
													<?php } ?>
												</label>
											</div>
										</div>
									</div>
									<div class="form-group"> <?php //Display Navigation ?>
										<label class="col-sm-3 control-label" for="input-subcategory_display_navigation"> <span data-toggle="tooltip" title="<?php echo $objlang->get('entry_display_navigation_desc'); ?>"><?php echo $objlang->get('entry_display_navigation'); ?> </span></label>
										<div class="col-sm-9">
											<div class="col-sm-5">
												<label class="radio-inline">
													<?php if ($module['subcategory_display_navigation']) { ?>
													<input type="radio" name="subcategory_display_navigation" value="1" checked="checked" />
													<?php echo $objlang->get('text_yes'); ?>
													<?php } else { ?>
													<input type="radio" name="subcategory_display_navigation" value="1" />
													<?php echo $objlang->get('text_yes'); ?>
													<?php } ?>
												</label>
												<label class="radio-inline">
													<?php if (!$module['subcategory_display_navigation']) { ?>
													<input type="radio" name="subcategory_display_navigation" value="0" checked="checked" />
													<?php echo $objlang->get('text_no'); ?>
													<?php } else { ?>
													<input type="radio" name="subcategory_display_navigation" value="0" />
													<?php echo $objlang->get('text_no'); ?>
													<?php } ?>
												</label>
											</div>
										</div>
									</div>
									<div class="form-group"> <?php //Display Loop ?>
										<label class="col-sm-3 control-label" for="input-subcategory_display_loop"> <span data-toggle="tooltip" title="<?php echo $objlang->get('entry_display_loop_desc'); ?>"><?php echo $objlang->get('entry_display_loop'); ?> </span></label>
										<div class="col-sm-9">
											<div class="col-sm-5">
												<label class="radio-inline">
													<?php if ($module['subcategory_display_loop']) { ?>
													<input type="radio" name="subcategory_display_loop" value="1" checked="checked" />
													<?php echo $objlang->get('text_yes'); ?>
													<?php } else { ?>
													<input type="radio" name="subcategory_display_loop" value="1" />
													<?php echo $objlang->get('text_yes'); ?>
													<?php } ?>
												</label>
												<label class="radio-inline">
													<?php if (!$module['subcategory_display_loop']) { ?>
													<input type="radio" name="subcategory_display_loop" value="0" checked="checked" />
													<?php echo $objlang->get('text_no'); ?>
													<?php } else { ?>
													<input type="radio" name="subcategory_display_loop" value="0" />
													<?php echo $objlang->get('text_no'); ?>
													<?php } ?>
												</label>
											</div>
										</div>
									</div>
									<div class="form-group"> <?php //Margin right ?>
										<label class="col-sm-3 control-label" for="input-subcategory_margin_right"> <b style="font-weight:bold; color:#f00">*</b> <span data-toggle="tooltip" title="<?php echo $objlang->get('entry_margin_right_subcategory_desc'); ?>"><?php echo $objlang->get('entry_margin_right_subcategory'); ?> </span></label>
										<div class="col-sm-9">
											<div class="col-sm-5">
												<input type="text" name="subcategory_margin_right" value="<?php echo $module['subcategory_margin_right']; ?>" id="input-subcategory_margin_right" class="form-control" />
											</div>
											<?php if (isset($error['subcategory_margin_right'])) { ?>
												<div class="text-danger col-sm-12"><?php echo $error['subcategory_margin_right']; ?></div>
											<?php } ?>
										</div>
									</div>
									<div class="form-group"> <?php //SlideBy ?>
										<label class="col-sm-3 control-label" for="input-subcategory_slideby"> <b style="font-weight:bold; color:#f00">*</b> <span data-toggle="tooltip" title="<?php echo $objlang->get('entry_subcategory_slideby_desc'); ?>"><?php echo $objlang->get('entry_subcategory_slideby'); ?> </span></label>
										<div class="col-sm-9">
											<div class="col-sm-5">
												<input type="text" name="subcategory_slideby" value="<?php echo $module['subcategory_slideby']; ?>" id="input-subcategory_slideby" class="form-control" />
											</div>
										</div>
									</div>
									<div class="form-group"> <?php //Auto Play ?>
										<label class="col-sm-3 control-label" for="input-subcategory_auto_play"><span data-toggle="tooltip" title="<?php echo $objlang->get('entry_auto_play_desc'); ?>"><?php echo $objlang->get('entry_auto_play'); ?> </span> </label>
										<div class="col-sm-9">
											<div class="col-sm-5">
												<label class="radio-inline">
													<?php if ($module['subcategory_auto_play']) { ?>
													<input type="radio" name="subcategory_auto_play" value="1" checked="checked" />
													<?php echo $objlang->get('text_yes'); ?>
													<?php } else { ?>
													<input type="radio" name="subcategory_auto_play" value="1" />
													<?php echo $objlang->get('text_yes'); ?>
													<?php } ?>
												</label>
												<label class="radio-inline">
													<?php if (!$module['subcategory_auto_play']) { ?>
													<input type="radio" name="subcategory_auto_play" value="0" checked="checked" />
													<?php echo $objlang->get('text_no'); ?>
													<?php } else { ?>
													<input type="radio" name="subcategory_auto_play" value="0" />
													<?php echo $objlang->get('text_no'); ?>
													<?php } ?>
												</label>
											</div>
										</div>
									</div>
									<div class="form-group"> <?php //Auto interval timeout?>
										<label class="col-sm-3 control-label" for="input-subcategory_auto_interval_timeout"> <b style="font-weight:bold; color:#f00">*</b> <span data-toggle="tooltip" title="<?php echo $objlang->get('entry_auto_interval_timeout_desc'); ?>"><?php echo $objlang->get('entry_auto_interval_timeout'); ?> </span></label>
										<div class="col-sm-9">
											<div class="col-sm-5">
												<input type="text" name="subcategory_auto_interval_timeout" value="<?php echo $module['subcategory_auto_interval_timeout']; ?>" id="input-subcategory_auto_interval_timeout" class="form-control" />
											</div>
											<?php if (isset($error['subcategory_auto_interval_timeout'])) { ?>
												<div class="text-danger col-sm-12"><?php echo $error['subcategory_auto_interval_timeout']; ?></div>
											<?php } ?>
										</div>
									</div>
									<div class="form-group"> <?php //Auto Hover Pause ?>
										<label class="col-sm-3 control-label" for="input-subcategory_auto_hover_pause"> <span data-toggle="tooltip" title="<?php echo $objlang->get('entry_auto_hover_pause_desc'); ?>"><?php echo $objlang->get('entry_auto_hover_pause'); ?> </span></label>
										<div class="col-sm-9">
											<div class="col-sm-5">
												<label class="radio-inline">
													<?php if ($module['subcategory_auto_hover_pause']) { ?>
													<input type="radio" name="subcategory_auto_hover_pause" value="1" checked="checked" />
													<?php echo $objlang->get('text_yes'); ?>
													<?php } else { ?>
													<input type="radio" name="subcategory_auto_hover_pause" value="1" />
													<?php echo $objlang->get('text_yes'); ?>
													<?php } ?>
												</label>
												<label class="radio-inline">
													<?php if (!$module['subcategory_auto_hover_pause']) { ?>
													<input type="radio" name="subcategory_auto_hover_pause" value="0" checked="checked" />
													<?php echo $objlang->get('text_no'); ?>
													<?php } else { ?>
													<input type="radio" name="subcategory_auto_hover_pause" value="0" />
													<?php echo $objlang->get('text_no'); ?>
													<?php } ?>
												</label>
											</div>
										</div>
									</div>
									<div class="form-group"> <?php //Auto play speed ?>
										<label class="col-sm-3 control-label" for="input-subcategory_auto_play_speed"> <b style="font-weight:bold; color:#f00">*</b> <span data-toggle="tooltip" title="<?php echo $objlang->get('entry_auto_play_speed_desc'); ?>"><?php echo $objlang->get('entry_auto_play_speed'); ?> </span></label>
										<div class="col-sm-9">
											<div class="col-sm-5">
												<input type="text" name="subcategory_auto_play_speed" value="<?php echo $module['subcategory_auto_play_speed']; ?>" id="input-subcategory_auto_play_speed" class="form-control" />
											</div>
											<?php if (isset($error['subcategory_auto_play_speed'])) { ?>
												<div class="text-danger col-sm-12"><?php echo $error['subcategory_auto_play_speed']; ?></div>
											<?php } ?>
										</div>
									</div>
									<div class="form-group"> <?php //Navigation speed ?>
										<label class="col-sm-3 control-label" for="input-subcategory_navigation_speed"> <b style="font-weight:bold; color:#f00">*</b> <span data-toggle="tooltip" title="<?php echo $objlang->get('entry_navigation_speed_desc'); ?>"><?php echo $objlang->get('entry_navigation_speed'); ?> </span></label>
										<div class="col-sm-9">
											<div class="col-sm-5">
												<input type="text" name="subcategory_navigation_speed" value="<?php echo $module['subcategory_navigation_speed']; ?>" id="input-subcategory_navigation_speed" class="form-control" />
											</div>
											<?php if (isset($error['subcategory_navigation_speed'])) { ?>
												<div class="text-danger col-sm-12"><?php echo $error['subcategory_navigation_speed']; ?></div>
											<?php } ?>
										</div>
									</div>
									<div class="form-group"> <?php //Start Position Subcategory ?>
										<label class="col-sm-3 control-label" for="input-subcategory_start_position"> <b style="font-weight:bold; color:#f00">*</b> <span data-toggle="tooltip" title="<?php echo $objlang->get('entry_start_position_subcategory_desc'); ?>"><?php echo $objlang->get('entry_start_position_subcategory'); ?> </span></label>
										<div class="col-sm-9">
											<div class="col-sm-5">
												<input type="text" name="subcategory_start_position" value="<?php echo $module['subcategory_start_position']; ?>" id="input-subcategory_start_position" class="form-control" />
											</div>
											<?php if (isset($error['subcategory_start_position'])) { ?>
												<div class="text-danger col-sm-12"><?php echo $error['subcategory_start_position']; ?></div>
											<?php } ?>
										</div>
									</div>
									<div class="form-group"> <?php //Mouse Drag ?>
										<label class="col-sm-3 control-label" for="input-subcategory_mouse_drag"> <span data-toggle="tooltip" title="<?php echo $objlang->get('entry_mouse_drag_desc'); ?>"><?php echo $objlang->get('entry_mouse_drag'); ?> </span></label>
										<div class="col-sm-9">
											<div class="col-sm-5">
												<label class="radio-inline">
													<?php if ($module['subcategory_mouse_drag']) { ?>
													<input type="radio" name="subcategory_mouse_drag" value="1" checked="checked" />
													<?php echo $objlang->get('text_yes'); ?>
													<?php } else { ?>
													<input type="radio" name="subcategory_mouse_drag" value="1" />
													<?php echo $objlang->get('text_yes'); ?>
													<?php } ?>
												</label>
												<label class="radio-inline">
													<?php if (!$module['subcategory_mouse_drag']) { ?>
													<input type="radio" name="subcategory_mouse_drag" value="0" checked="checked" />
													<?php echo $objlang->get('text_no'); ?>
													<?php } else { ?>
													<input type="radio" name="subcategory_mouse_drag" value="0" />
													<?php echo $objlang->get('text_no'); ?>
													<?php } ?>
												</label>
											</div>
										</div>
									</div>
									<div class="form-group"> <?php //Touch Drag ?>
										<label class="col-sm-3 control-label" for="input-subcategory_touch_drag"> <span data-toggle="tooltip" title="<?php echo $objlang->get('entry_touch_drag_desc'); ?>"><?php echo $objlang->get('entry_touch_drag'); ?> </span></label>
										<div class="col-sm-9">
											<div class="col-sm-5">
												<label class="radio-inline">
													<?php if ($module['subcategory_touch_drag']) { ?>
													<input type="radio" name="subcategory_touch_drag" value="1" checked="checked" />
													<?php echo $objlang->get('text_yes'); ?>
													<?php } else { ?>
													<input type="radio" name="subcategory_touch_drag" value="1" />
													<?php echo $objlang->get('text_yes'); ?>
													<?php } ?>
												</label>
												<label class="radio-inline">
													<?php if (!$module['subcategory_touch_drag']) { ?>
													<input type="radio" name="subcategory_touch_drag" value="0" checked="checked" />
													<?php echo $objlang->get('text_no'); ?>
													<?php } else { ?>
													<input type="radio" name="subcategory_touch_drag" value="0" />
													<?php echo $objlang->get('text_no'); ?>
													<?php } ?>
												</label>
											</div>
										</div>
									</div>
									<label class="col-sm-12"> 
										<u style="color: #003399; font-weight: bold;"><?php echo $objlang->get('label_for_type_show_slider');?></u>
									</label>
									<div class="form-group"> <?php //Auto Play ?>
										<label class="col-sm-3 control-label" for="input-slider_auto_play"> <span data-toggle="tooltip" title="<?php echo $objlang->get('entry_auto_play_desc'); ?>"><?php echo $objlang->get('entry_auto_play'); ?> </span></label>
										<div class="col-sm-9">
											<div class="col-sm-5">
												<label class="radio-inline">
													<?php if ($module['slider_auto_play']) { ?>
													<input type="radio" name="slider_auto_play" value="1" checked="checked" />
													<?php echo $objlang->get('text_yes'); ?>
													<?php } else { ?>
													<input type="radio" name="slider_auto_play" value="1" />
													<?php echo $objlang->get('text_yes'); ?>
													<?php } ?>
												</label>
												<label class="radio-inline">
													<?php if (!$module['slider_auto_play']) { ?>
													<input type="radio" name="slider_auto_play" value="0" checked="checked" />
													<?php echo $objlang->get('text_no'); ?>
													<?php } else { ?>
													<input type="radio" name="slider_auto_play" value="0" />
													<?php echo $objlang->get('text_no'); ?>
													<?php } ?>
												</label>
											</div>
										</div>
									</div>
									<div class="form-group"> <?php //Display Navigation ?>
										<label class="col-sm-3 control-label" for="input-slider_display_navigation"> <span data-toggle="tooltip" title="<?php echo $objlang->get('entry_display_navigation_desc'); ?>"><?php echo $objlang->get('entry_display_navigation'); ?> </span></label>
										<div class="col-sm-9">
											<div class="col-sm-5">
												<label class="radio-inline">
													<?php if ($module['slider_display_navigation']) { ?>
													<input type="radio" name="slider_display_navigation" value="1" checked="checked" />
													<?php echo $objlang->get('text_yes'); ?>
													<?php } else { ?>
													<input type="radio" name="slider_display_navigation" value="1" />
													<?php echo $objlang->get('text_yes'); ?>
													<?php } ?>
												</label>
												<label class="radio-inline">
													<?php if (!$module['slider_display_navigation']) { ?>
													<input type="radio" name="slider_display_navigation" value="0" checked="checked" />
													<?php echo $objlang->get('text_no'); ?>
													<?php } else { ?>
													<input type="radio" name="slider_display_navigation" value="0" />
													<?php echo $objlang->get('text_no'); ?>
													<?php } ?>
												</label>
											</div>
										</div>
									</div>
									<div class="form-group"> <?php // Display Loop ?>
										<label class="col-sm-3 control-label" for="input-slider_display_loop"> <span data-toggle="tooltip" title="<?php echo $objlang->get('entry_display_loop_desc'); ?>"><?php echo $objlang->get('entry_display_loop'); ?> </span></label>
										<div class="col-sm-9">
											<div class="col-sm-5">
												<label class="radio-inline">
													<?php if ($module['slider_display_loop']) { ?>
													<input type="radio" name="slider_display_loop" value="1" checked="checked" />
													<?php echo $objlang->get('text_yes'); ?>
													<?php } else { ?>
													<input type="radio" name="slider_display_loop" value="1" />
													<?php echo $objlang->get('text_yes'); ?>
													<?php } ?>
												</label>
												<label class="radio-inline">
													<?php if (!$module['slider_display_loop']) { ?>
													<input type="radio" name="slider_display_loop" value="0" checked="checked" />
													<?php echo $objlang->get('text_no'); ?>
													<?php } else { ?>
													<input type="radio" name="slider_display_loop" value="0" />
													<?php echo $objlang->get('text_no'); ?>
													<?php } ?>
												</label>
											</div>
										</div>
									</div>
									<div class="form-group"> <?php // Mouse Drag ?>
										<label class="col-sm-3 control-label" for="input-slider_mouse_drag"> <span data-toggle="tooltip" title="<?php echo $objlang->get('entry_mouse_drag_desc'); ?>"><?php echo $objlang->get('entry_mouse_drag'); ?> </span></label>
										<div class="col-sm-9">
											<div class="col-sm-5">
												<label class="radio-inline">
													<?php if ($module['slider_mouse_drag']) { ?>
													<input type="radio" name="slider_mouse_drag" value="1" checked="checked" />
													<?php echo $objlang->get('text_yes'); ?>
													<?php } else { ?>
													<input type="radio" name="slider_mouse_drag" value="1" />
													<?php echo $objlang->get('text_yes'); ?>
													<?php } ?>
												</label>
												<label class="radio-inline">
													<?php if (!$module['slider_mouse_drag']) { ?>
													<input type="radio" name="slider_mouse_drag" value="0" checked="checked" />
													<?php echo $objlang->get('text_no'); ?>
													<?php } else { ?>
													<input type="radio" name="slider_mouse_drag" value="0" />
													<?php echo $objlang->get('text_no'); ?>
													<?php } ?>
												</label>
											</div>
										</div>
									</div>
									<div class="form-group"> <?php // Touch Drag ?>
										<label class="col-sm-3 control-label" for="input-slider_touch_drag"> <span data-toggle="tooltip" title="<?php echo $objlang->get('entry_touch_drag_desc'); ?>"><?php echo $objlang->get('entry_touch_drag'); ?> </span></label>
										<div class="col-sm-9">
											<div class="col-sm-5">
												<label class="radio-inline">
													<?php if ($module['slider_touch_drag']) { ?>
													<input type="radio" name="slider_touch_drag" value="1" checked="checked" />
													<?php echo $objlang->get('text_yes'); ?>
													<?php } else { ?>
													<input type="radio" name="slider_touch_drag" value="1" />
													<?php echo $objlang->get('text_yes'); ?>
													<?php } ?>
												</label>
												<label class="radio-inline">
													<?php if (!$module['slider_touch_drag']) { ?>
													<input type="radio" name="slider_touch_drag" value="0" checked="checked" />
													<?php echo $objlang->get('text_no'); ?>
													<?php } else { ?>
													<input type="radio" name="slider_touch_drag" value="0" />
													<?php echo $objlang->get('text_no'); ?>
													<?php } ?>
												</label>
											</div>
										</div>
									</div>
									<div class="form-group"> <?php // Auto Hover Pause ?>
										<label class="col-sm-3 control-label" for="input-slider_auto_hover_pause"> <span data-toggle="tooltip" title="<?php echo $objlang->get('entry_auto_hover_pause_desc'); ?>"><?php echo $objlang->get('entry_auto_hover_pause'); ?> </span></label>
										<div class="col-sm-9">
											<div class="col-sm-5">
												<label class="radio-inline">
													<?php if ($module['slider_auto_hover_pause']) { ?>
													<input type="radio" name="slider_auto_hover_pause" value="1" checked="checked" />
													<?php echo $objlang->get('text_yes'); ?>
													<?php } else { ?>
													<input type="radio" name="slider_auto_hover_pause" value="1" />
													<?php echo $objlang->get('text_yes'); ?>
													<?php } ?>
												</label>
												<label class="radio-inline">
													<?php if (!$module['slider_auto_hover_pause']) { ?>
													<input type="radio" name="slider_auto_hover_pause" value="0" checked="checked" />
													<?php echo $objlang->get('text_no'); ?>
													<?php } else { ?>
													<input type="radio" name="slider_auto_hover_pause" value="0" />
													<?php echo $objlang->get('text_no'); ?>
													<?php } ?>
												</label>
											</div>
										</div>
									</div>
									<div class="form-group"> <?php // Auto interval timeout ?>
										<label class="col-sm-3 control-label" for="input-slider_auto_interval_timeout"> <b style="font-weight:bold; color:#f00">*</b> <span data-toggle="tooltip" title="<?php echo $objlang->get('entry_auto_interval_timeout_desc'); ?>"><?php echo $objlang->get('entry_auto_interval_timeout'); ?> </span></label>
										<div class="col-sm-9">
											<div class="col-sm-5">
												<input type="text" name="slider_auto_interval_timeout" value="<?php echo $module['slider_auto_interval_timeout']; ?>" id="input-slider_auto_interval_timeout" class="form-control" />
											</div>
											<?php if (isset($error['slider_auto_interval_timeout'])) { ?>
												<div class="text-danger col-sm-12"><?php echo $error['slider_auto_interval_timeout']; ?></div>
											<?php } ?>
										</div>
									</div>
									<div class="form-group"> <?php // Auto play speed ?>
										<label class="col-sm-3 control-label" for="input-slider_auto_play_speed"> <b style="font-weight:bold; color:#f00">*</b> <span data-toggle="tooltip" title="<?php echo $objlang->get('entry_auto_play_speed_desc'); ?>"><?php echo $objlang->get('entry_auto_play_speed'); ?> </span></label>
										<div class="col-sm-9">
											<div class="col-sm-5">
												<input type="text" name="slider_auto_play_speed" value="<?php echo $module['slider_auto_play_speed']; ?>" id="input-slider_auto_play_speed" class="form-control" />
											</div>
											<?php if (isset($error['slider_auto_play_speed'])) { ?>
												<div class="text-danger col-sm-12"><?php echo $error['slider_auto_play_speed']; ?></div>
											<?php } ?>
										</div>
									</div>
								</div>
						<?php // -----------------------------------------------------------------------  ?> 		
								<div class="tab-pane" id="advanced_option"> <?php // Advanced Option ?> 
									<div class="form-group"> <?php // Pre-text ?> 
										<label class="col-sm-3 control-label" for="input-pre_text"> <span data-toggle="tooltip" title="<?php echo $objlang->get('entry_pre_text_desc'); ?>"><?php echo $objlang->get('entry_pre_text'); ?></span></label>
										<div class="col-sm-9">
											<div class="col-sm-5">
												<textarea name="pre_text" id="input-pre_text" class="form-control"><?php echo $module['pre_text']; ?></textarea>
											</div>
										</div>
									</div>
									<div class="form-group"> <?php // Post-text ?> 
										<label class="col-sm-3 control-label" for="input-post_text"> <span data-toggle="tooltip" title="<?php echo $objlang->get('entry_post_text_desc'); ?>"><?php echo $objlang->get('entry_post_text'); ?></span></label>
										<div class="col-sm-9">
											<div class="col-sm-5">
												<textarea name="post_text" id="input-post_text" class="form-control"><?php echo $module['post_text']; ?></textarea>
											</div>
										</div>
									</div>
									<div class="form-group"> <?php // use cache  ?> 
										<label class="col-sm-3 control-label" for="input-use_cache">
											<span data-toggle="tooltip" title="<?php echo $objlang->get('entry_use_cache_desc'); ?>"><?php echo $objlang->get('entry_use_cache'); ?></span>
										</label>
										<div class="col-sm-9">
											<div class="col-sm-5">
												<label class="radio-inline">
													<?php if ($module['use_cache']) { ?>
													<input type="radio" name="use_cache" value="1" checked="checked" />
													<?php echo $objlang->get('text_yes'); ?>
													<?php } else { ?>
													<input type="radio" name="use_cache" value="1" />
													<?php echo $objlang->get('text_yes'); ?>
													<?php } ?>
												</label>
												<label class="radio-inline">
													<?php if (!$module['use_cache']) { ?>
													<input type="radio" name="use_cache" value="0" checked="checked" />
													<?php echo $objlang->get('text_no'); ?>
													<?php } else { ?>
													<input type="radio" name="use_cache" value="0" />
													<?php echo $objlang->get('text_no'); ?>
													<?php } ?>
												</label>
											</div>
										</div>
									</div>
									<div class="form-group" id="input-cache_time_form"> <?php // cache time  ?> 
										<label class="col-sm-3 control-label" for="input-cache_time">
											<span data-toggle="tooltip" title="<?php echo $objlang->get('entry_cache_time_desc'); ?>"><?php echo $objlang->get('entry_cache_time'); ?></span>
										</label>
										<div class="col-sm-9">
											<div class="col-sm-5">
												<input type="text" name="cache_time" value="<?php echo $module['cache_time']; ?>" id="input-cache_time" class="form-control" />
											</div>
											<?php if (isset($error['cache_time'])) { ?>
											<div class="text-danger col-sm-12"><?php echo $error['cache_time']; ?></div>
											<?php }?>
										</div>
									</div>
								</div>
						<?php // -----------------------------------------------------------------------  ?> 
							</div>
						</div>
						<?php $module_row++; ?>
					<?php } ?>
					</div>
				</div>
			</form>
		</div>
    </div>	
  </div>
	<script type="text/javascript"><!--
$('#so_youtech a:first').tab('show');
$('input[name=\'field_product_tab\']').autocomplete({
	source: function(request, response) {
		$.ajax({
			url: 'index.php?route=extension/module/so_super_category/autocomplete&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request),
			dataType: 'json',
			success: function(json) {
				response($.map(json, function(item) {
					return {
						label: item['name'],
						value: item['product_id']
					}
				}));
			}
		});
	},
	select: function(item) {
		$('input[name=\'field_product_tab\']').val('');
		
		$('#featured-field_product_tab' + item['value']).remove();
		
		$('#featured-field_product_tab').append('<div id="featured-field_product_tab' + item['value'] + '"><i class="fa fa-minus-circle"></i> ' + item['label'] + '<input type="hidden" name="field_product_tab[]" value="' + item['value'] + '" /></div>');
		
		$('#field_product' + item['value']).remove();
		$('#input-field_preload').append('<option value="'+item['value']+'" id="field_product' + item['value'] + '">' + item['label'] + '</option>');
		
	}
});
	if($("input[name='use_cache']:radio:checked").val() == '0')
	{
		$('#input-cache_time_form').hide();
	}else
	{
		$('#input-cache_time_form').show();
	}
	$("input[name='use_cache']").change(function(){
		val = $(this).val();
		if(val ==0)
		{
			$('#input-cache_time_form').hide();
		}else
		{
			$('#input-cache_time_form').show();
		}
	});
$('#featured-field_product_tab').delegate('.fa-minus-circle', 'click', function() {
	$(this).parent().remove();
	var id_par = $(this).parent().attr('id').substr(26);
	$("#input-field_preload option[value='"+id_par+"']").each(function() {
		$(this).remove();
	});
});
$('#language').change(function(){
		var that = $(this), opt_select = $('option:selected', that).val() , _input = $('#input-head-name-'+opt_select);
		$('[id^="input-head-name-"]').addClass('hide');
		_input.removeClass('hide');
	});

	$('.first-name').change(function(){
		$('input[name="head_name"]').val($(this).val());
	});
	if($("input[name='display_new']:radio:checked").val() == '0')
	{
		$('#input-date_day_form').hide();
	}else
	{
		$('#input-date_day_form').show();
	}
	$("input[name='display_new']").change(function(){
		val = $(this).val();
		if(val ==0)
		{
			$('#input-date_day_form').hide();
		}else
		{
			$('#input-date_day_form').show();
		}
	});
//--></script>
	<script type="text/javascript">
		jQuery(document).ready(function ($) {
			var button = '<div class="remove-caching" style="margin-left: 15px"><button type="button" onclick="remove_cache()" title="<?php echo $objlang->get('entry_button_clear_cache'); ?>" class="btn btn-danger"><i class="fa fa-remove"></i> <?php echo $objlang->get('entry_button_clear_cache')?></button></div>';
			var button_min = '<div class="remove-caching" style="margin-left: 7px"><button type="button" onclick="remove_cache()" title="<?php echo $objlang->get('entry_button_clear_cache'); ?>" class="btn btn-danger"><i class="fa fa-remove"></i> </button></div>';
			if($('#column-left').hasClass('active')){
				$('#column-left #stats').after(button);
			}else{
				$('#column-left #stats').after(button_min);
			}
			$('#button-menu').click(function(){
				$('.remove-caching').remove();
				if($(this).parents().find('#column-left').hasClass('active')){
					$('#column-left #stats').after(button);
				}else{
					$('#column-left #stats').after(button_min);
				}
			});
		});
		function remove_cache(){
			var success_remove = '<?php echo $success_remove; ?>';
			$.ajax({
				type: 'POST',
				url: '<?php echo $linkremove; ?>',
				data: {	is_ajax_cache_lite: 1},
				success: function () {
					var html = '<div class="alert alert-success cls-remove-cache"> '+success_remove+' <button type="button" class="close" data-dismiss="alert">&times;</button></div>';
					if(!($('.page-header .container-fluid .alert-success')).hasClass('cls-remove-cache')){
						$('.page-header .container-fluid').append(html);
					}
				},
			});
		}
	</script>
</div>
<?php echo $footer; ?>