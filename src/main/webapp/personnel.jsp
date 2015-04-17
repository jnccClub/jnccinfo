<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<html>
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="jncc booking" />
<meta name="keywords" content="jncc,booking,huangpengfei" />
<meta name="author" content="huangpengfei" />
<!-- BEGIN GLOBAL MANDATORY STYLES -->
<link href="media/css/bootstrap.min.css" rel="stylesheet"
	type="text/css" />
<link href="media/css/bootstrap-responsive.min.css" rel="stylesheet"
	type="text/css" />
<link href="media/css/font-awesome.min.css" rel="stylesheet"
	type="text/css" />
<link href="media/css/style-metro.css" rel="stylesheet" type="text/css" />
<link href="media/css/style.css" rel="stylesheet" type="text/css" />
<link href="media/css/style-responsive.css" rel="stylesheet"
	type="text/css" />
<link href="media/css/default.css" rel="stylesheet" type="text/css"
	id="style_color" />
<link href="media/css/uniform.default.css" rel="stylesheet"
	type="text/css" />
<!-- END GLOBAL MANDATORY STYLES -->
<!-- BEGIN PAGE LEVEL STYLES -->
<link href="media/css/bootstrap-fileupload.css" rel="stylesheet"
	type="text/css" />
<link href="media/css/chosen.css" rel="stylesheet" type="text/css" />
<link href="media/css/profile.css" rel="stylesheet" type="text/css" />
<!-- END PAGE LEVEL STYLES -->
<title>JNCC booking</title>
</head>

<!-- END HEAD -->

<!-- BEGIN BODY -->

<body>
	<div class="container profile">
	<br>
	<br>
		<div class="span12">
			<!--BEGIN TABS-->
			<div class="tabbable tabbable-custom tabbable-full-width">
				<ul class="nav nav-tabs">
					<li ><a href="#tab_1_1" data-toggle="tab">总览</a></li>
					<li class="active"><a href="#tab_1_2" data-toggle="tab">个人信息</a></li>
					<li><a href="#tab_1_3" data-toggle="tab">信息修改</a></li>
					<li><a href="#tab_1_6" data-toggle="tab">Help</a></li>
				</ul>

				<div class="tab-content">

					<div class="tab-pane row-fluid " id="tab_1_1">
						<ul class="unstyled profile-nav span3">
							<li><img src="media/image/profile-img.png" alt="" name="person_avatar"/> <a
								href="#" class="profile-edit">edit</a></li>

							<li><a href="#">Projects</a></li>

							<li><a href="#">Messages <span>3</span></a></li>

							<li><a href="#">Friends</a></li>

							<li><a href="#">Settings</a></li>

						</ul>

						<div class="span9">

							<div class="row-fluid">

								<div class="span8 profile-info">

									<h1>John Doe</h1>

									<p>Lorem ipsum dolor sit amet, consectetuer adipiscing
										elit, sed diam nonummy nibh euismod tincidunt laoreet dolore
										magna aliquam tincidunt erat volutpat laoreet dolore magna
										aliquam tincidunt erat volutpat.</p>

									<p>
										<a href="#">www.mywebsite.com</a>
									</p>

									<ul class="unstyled inline">

										<li><i class="icon-map-marker"></i> Spain</li>

										<li><i class="icon-calendar"></i> 18 Jan 1982</li>

										<li><i class="icon-briefcase"></i> Design</li>

										<li><i class="icon-star"></i> Top Seller</li>

										<li><i class="icon-heart"></i> BASE Jumping</li>

									</ul>

								</div>

								<!--end span8-->

								<div class="span4">

									<div class="portlet sale-summary">

										<div class="portlet-title">

											<div class="caption">Sales Summary</div>

											<div class="tools">

												<a class="reload" href="javascript:;"></a>

											</div>

										</div>

										<ul class="unstyled">

											<li><span class="sale-info">TODAY SOLD <i
													class="icon-img-up"></i></span> <span class="sale-num">23</span></li>

											<li><span class="sale-info">WEEKLY SALES <i
													class="icon-img-down"></i></span> <span class="sale-num">87</span>

											</li>

											<li><span class="sale-info">TOTAL SOLD</span> <span
												class="sale-num">2377</span></li>

											<li><span class="sale-info">EARNS</span> <span
												class="sale-num">$37.990</span></li>

										</ul>

									</div>

								</div>

								<!--end span4-->

							</div>

							<!--end row-fluid-->

							<div class="tabbable tabbable-custom tabbable-custom-profile">

								<ul class="nav nav-tabs">

									<li class="active"><a href="#tab_1_11" data-toggle="tab">Latest
											Customers</a></li>

									<li class=""><a href="#tab_1_22" data-toggle="tab">Feeds</a></li>

								</ul>

								<div class="tab-content">

									<div class="tab-pane active" id="tab_1_11">

										<div class="portlet-body" style="display: block;">

											<table
												class="table table-striped table-bordered table-advance table-hover">

												<thead>

													<tr>

														<th><i class="icon-briefcase"></i> Company</th>

														<th class="hidden-phone"><i
															class="icon-question-sign"></i> Descrition</th>

														<th><i class="icon-bookmark"></i> Amount</th>

														<th></th>

													</tr>

												</thead>

												<tbody>

													<tr>

														<td><a href="#">Pixel Ltd</a></td>

														<td class="hidden-phone">Server hardware purchase</td>

														<td>52560.10$ <span
															class="label label-success label-mini">Paid</span></td>

														<td><a class="btn mini green-stripe" href="#">View</a></td>

													</tr>

													<tr>

														<td><a href="#"> Smart House </a></td>

														<td class="hidden-phone">Office furniture purchase</td>

														<td>5760.00$ <span
															class="label label-warning label-mini">Pending</span></td>

														<td><a class="btn mini blue-stripe" href="#">View</a></td>

													</tr>

													<tr>

														<td><a href="#"> FoodMaster Ltd </a></td>

														<td class="hidden-phone">Company Anual Dinner
															Catering</td>

														<td>12400.00$ <span
															class="label label-success label-mini">Paid</span></td>

														<td><a class="btn mini blue-stripe" href="#">View</a></td>

													</tr>

													<tr>

														<td><a href="#"> WaterPure Ltd </a></td>

														<td class="hidden-phone">Payment for Jan 2013</td>

														<td>610.50$ <span
															class="label label-danger label-mini">Overdue</span></td>

														<td><a class="btn mini red-stripe" href="#">View</a></td>

													</tr>

													<tr>

														<td><a href="#">Pixel Ltd</a></td>

														<td class="hidden-phone">Server hardware purchase</td>

														<td>52560.10$ <span
															class="label label-success label-mini">Paid</span></td>

														<td><a class="btn mini green-stripe" href="#">View</a></td>

													</tr>

													<tr>

														<td><a href="#"> Smart House </a></td>

														<td class="hidden-phone">Office furniture purchase</td>

														<td>5760.00$ <span
															class="label label-warning label-mini">Pending</span></td>

														<td><a class="btn mini blue-stripe" href="#">View</a></td>

													</tr>

													<tr>

														<td><a href="#"> FoodMaster Ltd </a></td>

														<td class="hidden-phone">Company Anual Dinner
															Catering</td>

														<td>12400.00$ <span
															class="label label-success label-mini">Paid</span></td>

														<td><a class="btn mini blue-stripe" href="#">View</a></td>

													</tr>

												</tbody>

											</table>

										</div>

									</div>

									<!--tab-pane-->

									<div class="tab-pane" id="tab_1_22">

										<div class="tab-pane active" id="tab_1_1_1">

											<div class="scroller" data-height="290px"
												data-always-visible="1" data-rail-visible1="1">

												<ul class="feeds">

													<li>

														<div class="col1">

															<div class="cont">

																<div class="cont-col1">

																	<div class="label label-success">

																		<i class="icon-bell"></i>

																	</div>

																</div>

																<div class="cont-col2">

																	<div class="desc">

																		You have 4 pending tasks. <span
																			class="label label-important label-mini"> Take
																			action <i class="icon-share-alt"></i>

																		</span>

																	</div>

																</div>

															</div>

														</div>

														<div class="col2">

															<div class="date">Just now</div>

														</div>

													</li>

													<li><a href="#">

															<div class="col1">

																<div class="cont">

																	<div class="cont-col1">

																		<div class="label label-success">

																			<i class="icon-bell"></i>

																		</div>

																	</div>

																	<div class="cont-col2">

																		<div class="desc">New version v1.4 just lunched!

																		</div>

																	</div>

																</div>

															</div>

															<div class="col2">

																<div class="date">20 mins</div>

															</div>

													</a></li>

													<li>

														<div class="col1">

															<div class="cont">

																<div class="cont-col1">

																	<div class="label label-important">

																		<i class="icon-bolt"></i>

																	</div>

																</div>

																<div class="cont-col2">

																	<div class="desc">Database server #12 overloaded.
																		Please fix the issue.</div>

																</div>

															</div>

														</div>

														<div class="col2">

															<div class="date">24 mins</div>

														</div>

													</li>

													<li>

														<div class="col1">

															<div class="cont">

																<div class="cont-col1">

																	<div class="label label-info">

																		<i class="icon-bullhorn"></i>

																	</div>

																</div>

																<div class="cont-col2">

																	<div class="desc">New order received. Please take
																		care of it.</div>

																</div>

															</div>

														</div>

														<div class="col2">

															<div class="date">30 mins</div>

														</div>

													</li>

													<li>

														<div class="col1">

															<div class="cont">

																<div class="cont-col1">

																	<div class="label label-success">

																		<i class="icon-bullhorn"></i>

																	</div>

																</div>

																<div class="cont-col2">

																	<div class="desc">New order received. Please take
																		care of it.</div>

																</div>

															</div>

														</div>

														<div class="col2">

															<div class="date">40 mins</div>

														</div>

													</li>

													<li>

														<div class="col1">

															<div class="cont">

																<div class="cont-col1">

																	<div class="label label-warning">

																		<i class="icon-plus"></i>

																	</div>

																</div>

																<div class="cont-col2">

																	<div class="desc">New user registered.</div>

																</div>

															</div>

														</div>

														<div class="col2">

															<div class="date">1.5 hours</div>

														</div>

													</li>

													<li>

														<div class="col1">

															<div class="cont">

																<div class="cont-col1">

																	<div class="label label-success">

																		<i class="icon-bell-alt"></i>

																	</div>

																</div>

																<div class="cont-col2">

																	<div class="desc">

																		Web server hardware needs to be upgraded. <span
																			class="label label-inverse label-mini">Overdue</span>

																	</div>

																</div>

															</div>

														</div>

														<div class="col2">

															<div class="date">2 hours</div>

														</div>

													</li>

													<li>

														<div class="col1">

															<div class="cont">

																<div class="cont-col1">

																	<div class="label">

																		<i class="icon-bullhorn"></i>

																	</div>

																</div>

																<div class="cont-col2">

																	<div class="desc">New order received. Please take
																		care of it.</div>

																</div>

															</div>

														</div>

														<div class="col2">

															<div class="date">3 hours</div>

														</div>

													</li>

													<li>

														<div class="col1">

															<div class="cont">

																<div class="cont-col1">

																	<div class="label label-warning">

																		<i class="icon-bullhorn"></i>

																	</div>

																</div>

																<div class="cont-col2">

																	<div class="desc">New order received. Please take
																		care of it.</div>

																</div>

															</div>

														</div>

														<div class="col2">

															<div class="date">5 hours</div>

														</div>

													</li>

													<li>

														<div class="col1">

															<div class="cont">

																<div class="cont-col1">

																	<div class="label label-info">

																		<i class="icon-bullhorn"></i>

																	</div>

																</div>

																<div class="cont-col2">

																	<div class="desc">New order received. Please take
																		care of it.</div>

																</div>

															</div>

														</div>

														<div class="col2">

															<div class="date">18 hours</div>

														</div>

													</li>

													<li>

														<div class="col1">

															<div class="cont">

																<div class="cont-col1">

																	<div class="label">

																		<i class="icon-bullhorn"></i>

																	</div>

																</div>

																<div class="cont-col2">

																	<div class="desc">New order received. Please take
																		care of it.</div>

																</div>

															</div>

														</div>

														<div class="col2">

															<div class="date">21 hours</div>

														</div>

													</li>

													<li>

														<div class="col1">

															<div class="cont">

																<div class="cont-col1">

																	<div class="label label-info">

																		<i class="icon-bullhorn"></i>

																	</div>

																</div>

																<div class="cont-col2">

																	<div class="desc">New order received. Please take
																		care of it.</div>

																</div>

															</div>

														</div>

														<div class="col2">

															<div class="date">22 hours</div>

														</div>

													</li>

													<li>

														<div class="col1">

															<div class="cont">

																<div class="cont-col1">

																	<div class="label">

																		<i class="icon-bullhorn"></i>

																	</div>

																</div>

																<div class="cont-col2">

																	<div class="desc">New order received. Please take
																		care of it.</div>

																</div>

															</div>

														</div>

														<div class="col2">

															<div class="date">21 hours</div>

														</div>

													</li>

													<li>

														<div class="col1">

															<div class="cont">

																<div class="cont-col1">

																	<div class="label label-info">

																		<i class="icon-bullhorn"></i>

																	</div>

																</div>

																<div class="cont-col2">

																	<div class="desc">New order received. Please take
																		care of it.</div>

																</div>

															</div>

														</div>

														<div class="col2">

															<div class="date">22 hours</div>

														</div>

													</li>

													<li>

														<div class="col1">

															<div class="cont">

																<div class="cont-col1">

																	<div class="label">

																		<i class="icon-bullhorn"></i>

																	</div>

																</div>

																<div class="cont-col2">

																	<div class="desc">New order received. Please take
																		care of it.</div>

																</div>

															</div>

														</div>

														<div class="col2">

															<div class="date">21 hours</div>

														</div>

													</li>

													<li>

														<div class="col1">

															<div class="cont">

																<div class="cont-col1">

																	<div class="label label-info">

																		<i class="icon-bullhorn"></i>

																	</div>

																</div>

																<div class="cont-col2">

																	<div class="desc">New order received. Please take
																		care of it.</div>

																</div>

															</div>

														</div>

														<div class="col2">

															<div class="date">22 hours</div>

														</div>

													</li>

													<li>

														<div class="col1">

															<div class="cont">

																<div class="cont-col1">

																	<div class="label">

																		<i class="icon-bullhorn"></i>

																	</div>

																</div>

																<div class="cont-col2">

																	<div class="desc">New order received. Please take
																		care of it.</div>

																</div>

															</div>

														</div>

														<div class="col2">

															<div class="date">21 hours</div>

														</div>

													</li>

													<li>

														<div class="col1">

															<div class="cont">

																<div class="cont-col1">

																	<div class="label label-info">

																		<i class="icon-bullhorn"></i>

																	</div>

																</div>

																<div class="cont-col2">

																	<div class="desc">New order received. Please take
																		care of it.</div>

																</div>

															</div>

														</div>

														<div class="col2">

															<div class="date">22 hours</div>

														</div>

													</li>

												</ul>

											</div>

										</div>

									</div>

									<!--tab-pane-->

								</div>

							</div>

						</div>

						<!--end span9-->

					</div>

					<!--end tab-pane-->

					<div class="tab-pane profile-classic row-fluid active" id="tab_1_2">
						<div class="span2">
							<img src="media/image/profile-img.png" alt="" name="person_avatar"/> <a href="#"
								class="profile-edit">edit</a>
						</div>
						<ul class="unstyled span10" id="user_profile_dis">	 <!-- 显示个人信息 -->
						</ul>
					</div>

					<!--tab_1_2-->

					<div class="tab-pane row-fluid profile-account" id="tab_1_3">
						<div class="row-fluid">
							<div class="span12">
								<div class="span3">
									<ul class="ver-inline-menu tabbable margin-bottom-10">
										<li class="active"><a data-toggle="tab" href="#tab_1-1">
												<i class="icon-cog"></i> 个人信息
										</a> <span class="after"></span></li>
										<li class=""><a data-toggle="tab" href="#tab_2-2"><i
												class="icon-picture"></i> 更新头像</a></li>
										<li class=""><a data-toggle="tab" href="#tab_3-3"><i
												class="icon-lock"></i> 修改密码</a></li>
										<li class=""><a data-toggle="tab" href="#tab_4-4"><i
												class="icon-eye-open"></i> 隐私设置</a></li>
									</ul>
								</div>
								<div class="span9">
									<div class="tab-content">
										<div id="tab_1-1" class="tab-pane active">
											<div style="height: auto;" id="accordion1-1"
												class="accordion collapse">
												<form id="user_profile_mod">
													<div >
													</div>
													<div class="submit-btn">
														<a href="#" class="btn green" onclick="saveProfile()">保存修改</a> <a href="#"
															class="btn">取消</a>
													</div>
												</form>
											</div>
										</div>
										<div id="tab_2-2" class="tab-pane">
											<div style="height: auto;" id="accordion2-2"
												class="accordion collapse">
												<form >
													<p></p>
													<br />
													<div class="controls">
														<div class="thumbnail"
															style="width: 291px; height: 250px;">
															<img src="media/image/profile-img.png" alt=""  name="person_avatar" style="width: 281px; height: 245px;"/>
														</div>
													</div>
													<div class="space10"></div>
													<div class="fileupload fileupload-new"
														data-provides="fileupload">
														<div class="input-append">
															<div class="uneditable-input">
																<i class="icon-file fileupload-exists"></i> <span
																	class="fileupload-preview"></span>
															</div>
															<span class="btn btn-file"> <span
																class="fileupload-new">选择文件</span> <span
																class="fileupload-exists">更换</span> <input
																type="file" class="default" />
															</span> <a href="#" class="btn fileupload-exists"
																data-dismiss="fileupload">删除</a>
														</div>
													</div>
													<div class="clearfix"></div>
													<div class="controls">
														<span class="label label-important">说明!</span> <span>你可以在此标注</span>
													</div>
													<div class="space10"></div>
													<div class="submit-btn">
														<a href="#" class="btn green">提交</a> <a href="#"
															class="btn">取消</a>
													</div>
												</form>
											</div>
										</div>

										<div id="tab_3-3" class="tab-pane">
											<div style="height: auto;" id="accordion3-3"
												class="accordion collapse">
												<form >
													<label class="control-label">当前密码</label> <input
														type="password" class="m-wrap span8" id="mod_curPasswd"/> <label
														class="control-label" >新密码</label> <input
														type="password" class="m-wrap span8" id="mod_newPasswd"/> <label
														class="control-label" >请重新输入密码</label> <input
														type="password" class="m-wrap span8" id="mod_comPasswd"/>
													<div class="submit-btn">
														<a href="#" class="btn green" onclick="modProfilePasswd()">修改密码</a> <a
															href="#" type="reset" class="btn">取消</a>
													</div>
												</form>
											</div>
										</div>

										<div id="tab_4-4" class="tab-pane">

											<div style="height: auto;" id="accordion4-4"
												class="accordion collapse">

												<form action="#">

													<div class="profile-settings row-fluid">

														<div class="span9">

															<p>Anim pariatur cliche reprehenderit, enim eiusmod
																high life accusamus..</p>

														</div>

														<div class="control-group span3">

															<div class="controls">

																<label class="radio"> <input type="radio"
																	name="optionsRadios1" value="option1" /> Yes

																</label> <label class="radio"> <input type="radio"
																	name="optionsRadios1" value="option2" checked /> No

																</label>

															</div>

														</div>

													</div>

													<!--end profile-settings-->

													<div class="profile-settings row-fluid">

														<div class="span9">

															<p>Enim eiusmod high life accusamus terry richardson
																ad squid wolf moon</p>

														</div>

														<div class="control-group span3">

															<div class="controls">

																<label class="checkbox"> <input type="checkbox"
																	value="" /> All

																</label> <label class="checkbox"> <input type="checkbox"
																	value="" /> Friends

																</label>

															</div>

														</div>

													</div>

													<!--end profile-settings-->

													<div class="profile-settings row-fluid">

														<div class="span9">

															<p>Pariatur cliche reprehenderit, enim eiusmod high
																life accusamus terry richardson</p>

														</div>

														<div class="control-group span3">

															<div class="controls">

																<label class="checkbox"> <input type="checkbox"
																	value="" /> Yes

																</label>

															</div>

														</div>

													</div>

													<!--end profile-settings-->

													<div class="profile-settings row-fluid">

														<div class="span9">

															<p>Cliche reprehenderit enim eiusmod high life
																accusamus terry</p>

														</div>

														<div class="control-group span3">

															<div class="controls">

																<label class="checkbox"> <input type="checkbox"
																	value="" /> Yes

																</label>

															</div>

														</div>

													</div>

													<!--end profile-settings-->

													<div class="profile-settings row-fluid">

														<div class="span9">

															<p>Oiusmod high life accusamus terry richardson ad
																squid wolf fwopo</p>

														</div>

														<div class="control-group span3">

															<div class="controls">

																<label class="checkbox"> <input type="checkbox"
																	value="" /> Yes

																</label>

															</div>

														</div>

													</div>

													<!--end profile-settings-->

													<div class="space5"></div>

													<div class="submit-btn">

														<a href="#" class="btn green">Save Changes</a> <a href="#"
															class="btn">Cancel</a>

													</div>

												</form>

											</div>

										</div>

									</div>

								</div>

								<!--end span9-->

							</div>

						</div>

					</div>

					<!--end tab-pane-->


					<div class="tab-pane row-fluid" id="tab_1_6">

						<div class="row-fluid">

							<div class="span12">

								<div class="span3">

									<ul class="ver-inline-menu tabbable margin-bottom-10">

										<li class="active"><a data-toggle="tab" href="#tab_1">

												<i class="icon-briefcase"></i> General Questions

										</a> <span class="after"></span></li>

										<li><a data-toggle="tab" href="#tab_2"><i
												class="icon-group"></i> Membership</a></li>

										<li><a data-toggle="tab" href="#tab_3"><i
												class="icon-leaf"></i> Terms Of Service</a></li>

										<li><a data-toggle="tab" href="#tab_1"><i
												class="icon-info-sign"></i> License Terms</a></li>

										<li><a data-toggle="tab" href="#tab_2"><i
												class="icon-tint"></i> Payment Rules</a></li>

										<li><a data-toggle="tab" href="#tab_3"><i
												class="icon-plus"></i> Other Questions</a></li>

									</ul>

								</div>

								<div class="span9">

									<div class="tab-content">

										<div id="tab_1" class="tab-pane active">

											<div style="height: auto;" id="accordion1"
												class="accordion collapse">

												<div class="accordion-group">

													<div class="accordion-heading">

														<a href="#collapse_1" data-parent="#accordion1"
															data-toggle="collapse" class="accordion-toggle collapsed">

															Anim pariatur cliche reprehenderit, enim eiusmod high
															life accusamus terry ? </a>

													</div>

													<div class="accordion-body collapse in" id="collapse_1">

														<div class="accordion-inner">Anim pariatur cliche
															reprehenderit, enim eiusmod high life accusamus terry
															richardson ad squid. 3 wolf moon officia aute, non
															cupidatat skateboard dolor brunch. Food truck quinoa
															nesciunt laborum eiusmod.</div>

													</div>

												</div>

												<div class="accordion-group">

													<div class="accordion-heading">

														<a href="#collapse_2" data-parent="#accordion1"
															data-toggle="collapse" class="accordion-toggle collapsed">

															Pariatur cliche reprehenderit enim eiusmod highr brunch ?

														</a>

													</div>

													<div class="accordion-body collapse" id="collapse_2">

														<div class="accordion-inner">Anim pariatur cliche
															reprehenderit, enim eiusmod high life accusamus terry
															richardson ad squid. 3 wolf moon officia aute, non
															cupidatat skateboard dolor brunch. Food truck quinoa
															nesciunt laborum eiusmod. Brunch 3 wolf moon tempor.</div>

													</div>

												</div>

												<div class="accordion-group">

													<div class="accordion-heading">

														<a href="#collapse_3" data-parent="#accordion1"
															data-toggle="collapse" class="accordion-toggle collapsed">

															Food truck quinoa nesciunt laborum eiusmod nim eiusmod
															high life accusamus ? </a>

													</div>

													<div class="accordion-body collapse" id="collapse_3">

														<div class="accordion-inner">Anim pariatur cliche
															reprehenderit, enim eiusmod high life accusamus terry
															richardson ad squid. 3 wolf moon officia aute, non
															cupidatat skateboard dolor brunch. Food truck quinoa
															nesciunt laborum eiusmod. Brunch 3 wolf moon tempor.</div>

													</div>

												</div>

												<div class="accordion-group">

													<div class="accordion-heading">

														<a href="#collapse_4" data-parent="#accordion1"
															data-toggle="collapse" class="accordion-toggle collapsed">

															High life accusamus terry richardson ad ? </a>

													</div>

													<div class="accordion-body collapse" id="collapse_4">

														<div class="accordion-inner">Anim pariatur cliche
															reprehenderit, enim eiusmod high life accusamus terry
															richardson ad squid. 3 wolf moon officia aute, non
															cupidatat skateboard dolor brunch. Food truck quinoa
															nesciunt laborum eiusmod. Brunch 3 wolf moon tempor.</div>

													</div>

												</div>

												<div class="accordion-group">

													<div class="accordion-heading">

														<a href="#collapse_5" data-parent="#accordion1"
															data-toggle="collapse" class="accordion-toggle collapsed">

															Reprehenderit enim eiusmod high life accusamus terry
															quinoa nesciunt laborum eiusmod ? </a>

													</div>

													<div class="accordion-body collapse" id="collapse_5">

														<div class="accordion-inner">Anim pariatur cliche
															reprehenderit, enim eiusmod high life accusamus terry
															richardson ad squid. 3 wolf moon officia aute, non
															cupidatat skateboard dolor brunch. Food truck quinoa
															nesciunt laborum eiusmod. Brunch 3 wolf moon tempor.</div>

													</div>

												</div>

												<div class="accordion-group">

													<div class="accordion-heading">

														<a href="#collapse_6" data-parent="#accordion1"
															data-toggle="collapse" class="accordion-toggle collapsed">

															Wolf moon officia aute non cupidatat skateboard dolor
															brunch ? </a>

													</div>

													<div class="accordion-body collapse" id="collapse_6">

														<div class="accordion-inner">Anim pariatur cliche
															reprehenderit, enim eiusmod high life accusamus terry
															richardson ad squid. 3 wolf moon officia aute, non
															cupidatat skateboard dolor brunch. Food truck quinoa
															nesciunt laborum eiusmod. Brunch 3 wolf moon tempor.</div>

													</div>

												</div>

											</div>

										</div>

										<div id="tab_2" class="tab-pane">

											<div style="height: auto;" id="accordion2"
												class="accordion collapse">

												<div class="accordion-group">

													<div class="accordion-heading">

														<a href="#collapse_2_1" data-parent="#accordion2"
															data-toggle="collapse" class="accordion-toggle collapsed">

															Cliche reprehenderit, enim eiusmod high life accusamus
															enim eiusmod ? </a>

													</div>

													<div class="accordion-body collapse in" id="collapse_2_1">

														<div class="accordion-inner">Anim pariatur cliche
															reprehenderit, enim eiusmod high life accusamus terry
															richardson ad squid. 3 wolf moon officia aute, non
															cupidatat skateboard dolor brunch. Food truck quinoa
															nesciunt laborum eiusmod.</div>

													</div>

												</div>

												<div class="accordion-group">

													<div class="accordion-heading">

														<a href="#collapse_2_2" data-parent="#accordion2"
															data-toggle="collapse" class="accordion-toggle collapsed">

															Pariatur cliche reprehenderit enim eiusmod high life non
															cupidatat skateboard dolor brunch ? </a>

													</div>

													<div class="accordion-body collapse" id="collapse_2_2">

														<div class="accordion-inner">Anim pariatur cliche
															reprehenderit, enim eiusmod high life accusamus terry
															richardson ad squid. 3 wolf moon officia aute, non
															cupidatat skateboard dolor brunch. Food truck quinoa
															nesciunt laborum eiusmod. Brunch 3 wolf moon tempor.</div>

													</div>

												</div>

												<div class="accordion-group">

													<div class="accordion-heading">

														<a href="#collapse_2_3" data-parent="#accordion2"
															data-toggle="collapse" class="accordion-toggle collapsed">

															Food truck quinoa nesciunt laborum eiusmod ? </a>

													</div>

													<div class="accordion-body collapse" id="collapse_2_3">

														<div class="accordion-inner">Anim pariatur cliche
															reprehenderit, enim eiusmod high life accusamus terry
															richardson ad squid. 3 wolf moon officia aute, non
															cupidatat skateboard dolor brunch. Food truck quinoa
															nesciunt laborum eiusmod. Brunch 3 wolf moon tempor.</div>

													</div>

												</div>

												<div class="accordion-group">

													<div class="accordion-heading">

														<a href="#collapse_2_4" data-parent="#accordion2"
															data-toggle="collapse" class="accordion-toggle collapsed">

															High life accusamus terry richardson ad squid enim
															eiusmod high ? </a>

													</div>

													<div class="accordion-body collapse" id="collapse_2_4">

														<div class="accordion-inner">Anim pariatur cliche
															reprehenderit, enim eiusmod high life accusamus terry
															richardson ad squid. 3 wolf moon officia aute, non
															cupidatat skateboard dolor brunch. Food truck quinoa
															nesciunt laborum eiusmod. Brunch 3 wolf moon tempor.</div>

													</div>

												</div>

												<div class="accordion-group">

													<div class="accordion-heading">

														<a href="#collapse_2_5" data-parent="#accordion2"
															data-toggle="collapse" class="accordion-toggle collapsed">

															Reprehenderit enim eiusmod high life accusamus terry
															quinoa nesciunt laborum eiusmod ? </a>

													</div>

													<div class="accordion-body collapse" id="collapse_2_5">

														<div class="accordion-inner">

															<p>Anim pariatur cliche reprehenderit, enim eiusmod
																high life accusamus terry richardson ad squid. 3 wolf
																moon officia aute, non cupidatat skateboard dolor
																brunch. Food truck quinoa nesciunt laborum eiusmod.
																Brunch 3 wolf moon tempor.</p>

															<p>moon officia aute, non cupidatat skateboard dolor
																brunch. Food truck quinoa nesciunt laborum eiusmodBrunch
																3 wolf moon tempor</p>

														</div>

													</div>

												</div>

												<div class="accordion-group">

													<div class="accordion-heading">

														<a href="#collapse_2_6" data-parent="#accordion2"
															data-toggle="collapse" class="accordion-toggle collapsed">

															Wolf moon officia aute non cupidatat skateboard dolor
															brunch ? </a>

													</div>

													<div class="accordion-body collapse" id="collapse_2_6">

														<div class="accordion-inner">Anim pariatur cliche
															reprehenderit, enim eiusmod high life accusamus terry
															richardson ad squid. 3 wolf moon officia aute, non
															cupidatat skateboard dolor brunch. Food truck quinoa
															nesciunt laborum eiusmod. Brunch 3 wolf moon tempor.</div>

													</div>

												</div>

												<div class="accordion-group">

													<div class="accordion-heading">

														<a href="#collapse_2_7" data-parent="#accordion2"
															data-toggle="collapse" class="accordion-toggle collapsed">

															Reprehenderit enim eiusmod high life accusamus terry
															quinoa nesciunt laborum eiusmod ? </a>

													</div>

													<div class="accordion-body collapse" id="collapse_2_7">

														<div class="accordion-inner">

															<p>Anim pariatur cliche reprehenderit, enim eiusmod
																high life accusamus terry richardson ad squid. 3 wolf
																moon officia aute, non cupidatat skateboard dolor
																brunch. Food truck quinoa nesciunt laborum eiusmod.
																Brunch 3 wolf moon tempor.</p>

															<p>moon officia aute, non cupidatat skateboard dolor
																brunch. Food truck quinoa nesciunt laborum eiusmodBrunch
																3 wolf moon tempor</p>

														</div>

													</div>

												</div>

											</div>

										</div>

										<div id="tab_3" class="tab-pane">

											<div style="height: auto;" id="accordion3"
												class="accordion collapse">

												<div class="accordion-group">

													<div class="accordion-heading">

														<a href="#collapse_3_1" data-parent="#accordion3"
															data-toggle="collapse" class="accordion-toggle collapsed">

															Cliche reprehenderit, enim eiusmod ? </a>

													</div>

													<div class="accordion-body collapse in" id="collapse_3_1">

														<div class="accordion-inner">Anim pariatur cliche
															reprehenderit, enim eiusmod high life accusamus terry
															richardson ad squid. 3 wolf moon officia aute, non
															cupidatat skateboard dolor brunch. Food truck quinoa
															nesciunt laborum eiusmod.</div>

													</div>

												</div>

												<div class="accordion-group">

													<div class="accordion-heading">

														<a href="#collapse_3_2" data-parent="#accordion3"
															data-toggle="collapse" class="accordion-toggle collapsed">

															Pariatur skateboard dolor brunch ? </a>

													</div>

													<div class="accordion-body collapse" id="collapse_3_2">

														<div class="accordion-inner">Anim pariatur cliche
															reprehenderit, enim eiusmod high life accusamus terry
															richardson ad squid. 3 wolf moon officia aute, non
															cupidatat skateboard dolor brunch. Food truck quinoa
															nesciunt laborum eiusmod. Brunch 3 wolf moon tempor.</div>

													</div>

												</div>

												<div class="accordion-group">

													<div class="accordion-heading">

														<a href="#collapse_3_3" data-parent="#accordion3"
															data-toggle="collapse" class="accordion-toggle collapsed">

															Food truck quinoa nesciunt laborum eiusmod ? </a>

													</div>

													<div class="accordion-body collapse" id="collapse_3_3">

														<div class="accordion-inner">Anim pariatur cliche
															reprehenderit, enim eiusmod high life accusamus terry
															richardson ad squid. 3 wolf moon officia aute, non
															cupidatat skateboard dolor brunch. Food truck quinoa
															nesciunt laborum eiusmod. Brunch 3 wolf moon tempor.</div>

													</div>

												</div>

												<div class="accordion-group">

													<div class="accordion-heading">

														<a href="#collapse_3_4" data-parent="#accordion3"
															data-toggle="collapse" class="accordion-toggle collapsed">

															High life accusamus terry richardson ad squid enim
															eiusmod high ? </a>

													</div>

													<div class="accordion-body collapse" id="collapse_3_4">

														<div class="accordion-inner">Anim pariatur cliche
															reprehenderit, enim eiusmod high life accusamus terry
															richardson ad squid. 3 wolf moon officia aute, non
															cupidatat skateboard dolor brunch. Food truck quinoa
															nesciunt laborum eiusmod. Brunch 3 wolf moon tempor.</div>

													</div>

												</div>

												<div class="accordion-group">

													<div class="accordion-heading">

														<a href="#collapse_3_5" data-parent="#accordion3"
															data-toggle="collapse" class="accordion-toggle collapsed">

															Reprehenderit enim eiusmod high eiusmod ? </a>

													</div>

													<div class="accordion-body collapse" id="collapse_3_5">

														<div class="accordion-inner">

															<p>Anim pariatur cliche reprehenderit, enim eiusmod
																high life accusamus terry richardson ad squid. 3 wolf
																moon officia aute, non cupidatat skateboard dolor
																brunch. Food truck quinoa nesciunt laborum eiusmod.
																Brunch 3 wolf moon tempor.</p>

															<p>moon officia aute, non cupidatat skateboard dolor
																brunch. Food truck quinoa nesciunt laborum eiusmodBrunch
																3 wolf moon tempor</p>

														</div>

													</div>

												</div>

												<div class="accordion-group">

													<div class="accordion-heading">

														<a href="#collapse_3_6" data-parent="#accordion3"
															data-toggle="collapse" class="accordion-toggle collapsed">

															Anim pariatur cliche reprehenderit, enim eiusmod high
															life accusamus terry ? </a>

													</div>

													<div class="accordion-body collapse" id="collapse_3_6">

														<div class="accordion-inner">Anim pariatur cliche
															reprehenderit, enim eiusmod high life accusamus terry
															richardson ad squid. 3 wolf moon officia aute, non
															cupidatat skateboard dolor brunch. Food truck quinoa
															nesciunt laborum eiusmod. Brunch 3 wolf moon tempor.</div>

													</div>

												</div>

												<div class="accordion-group">

													<div class="accordion-heading">

														<a href="#collapse_3_7" data-parent="#accordion3"
															data-toggle="collapse" class="accordion-toggle collapsed">

															Reprehenderit enim eiusmod high life accusamus aborum
															eiusmod ? </a>

													</div>

													<div class="accordion-body collapse" id="collapse_3_7">

														<div class="accordion-inner">

															<p>Anim pariatur cliche reprehenderit, enim eiusmod
																high life accusamus terry richardson ad squid. 3 wolf
																moon officia aute, non cupidatat skateboard dolor
																brunch. Food truck quinoa nesciunt laborum eiusmod.
																Brunch 3 wolf moon tempor.</p>

															<p>moon officia aute, non cupidatat skateboard dolor
																brunch. Food truck quinoa nesciunt laborum eiusmodBrunch
																3 wolf moon tempor</p>

														</div>

													</div>

												</div>

												<div class="accordion-group">

													<div class="accordion-heading">

														<a href="#collapse_3_8" data-parent="#accordion3"
															data-toggle="collapse" class="accordion-toggle collapsed">

															Reprehenderit enim eiusmod high life accusamus terry
															quinoa nesciunt laborum eiusmod ? </a>

													</div>

													<div class="accordion-body collapse" id="collapse_3_8">

														<div class="accordion-inner">

															<p>Anim pariatur cliche reprehenderit, enim eiusmod
																high life accusamus terry richardson ad squid. 3 wolf
																moon officia aute, non cupidatat skateboard dolor
																brunch. Food truck quinoa nesciunt laborum eiusmod.
																Brunch 3 wolf moon tempor.</p>

															<p>moon officia aute, non cupidatat skateboard dolor
																brunch. Food truck quinoa nesciunt laborum eiusmodBrunch
																3 wolf moon tempor</p>

														</div>

													</div>

												</div>

											</div>

										</div>

									</div>

								</div>

								<!--end span9-->

							</div>

						</div>

					</div>

					<!--end tab-pane-->

				</div>

			</div>

			<!--END TABS-->

		</div>

	</div>

	<!-- END FOOTER -->

	<!-- BEGIN JAVASCRIPTS(Load javascripts at bottom, this will reduce page load time) -->

	<!-- BEGIN CORE PLUGINS -->

	<script src="media/js/jquery-1.10.1.min.js" type="text/javascript"></script>
	<script src="media/js/jquery-migrate-1.2.1.min.js"
		type="text/javascript"></script>
	<!-- IMPORTANT! Load jquery-ui-1.10.1.custom.min.js before bootstrap.min.js to fix bootstrap tooltip conflict with jquery ui tooltip -->
	<script src="media/js/jquery-ui-1.10.1.custom.min.js"
		type="text/javascript"></script>
	<script src="media/js/bootstrap.min.js" type="text/javascript"></script>
	<!--[if lt IE 9]>
	<script src="media/js/excanvas.min.js"></script>
	<script src="media/js/respond.min.js"></script>  
	<![endif]-->
	<script src="media/js/jquery.slimscroll.min.js" type="text/javascript"></script>
	<script src="media/js/jquery.blockui.min.js" type="text/javascript"></script>
	<script src="media/js/jquery.cookie.min.js" type="text/javascript"></script>
	<script src="media/js/jquery.uniform.min.js" type="text/javascript"></script>
	<!-- END CORE PLUGINS -->
	<!-- BEGIN PAGE LEVEL PLUGINS -->
	<script type="text/javascript" src="media/js/bootstrap-fileupload.js"></script>
	<script type="text/javascript" src="media/js/chosen.jquery.min.js"></script>
	<!-- END PAGE LEVEL PLUGINS -->

	<!-- BEGIN PAGE LEVEL SCRIPTS -->
	<script src="media/js/app.js"></script>
	<!-- END PAGE LEVEL SCRIPTS -->
	<script type="text/javascript" src="js/profile/personnel.js"></script>
	<!-- END JAVASCRIPTS -->

</body>

<!-- END BODY -->

</html>
