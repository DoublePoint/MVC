<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-Compatible" content="ie=edge">
<%@ include file="/template/base.jsp"%>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description"
	content="Turn checkboxes and radio buttons into toggle switches">
<meta name="author"
	content="Mattia Larentis, Emanuele Marchi and Peter Stein">
<title>Bootstrap Switch · Turn checkboxes and radio buttons into
	toggle switches</title>
<link
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	rel="stylesheet">
<link href="css/highlight.css" rel="stylesheet">
<link
	href="https://unpkg.com/bootstrap-switch/dist/css/bootstrap3/bootstrap-switch.css"
	rel="stylesheet">
<link href="https://getbootstrap.com/assets/css/docs.min.css"
	rel="stylesheet">
<link href="css/main.css" rel="stylesheet">
</head>
<body>
	<a href="https://github.com/Bttstrp/bootstrap-switch" id="github"><img
		src="https://s3.amazonaws.com/github/ribbons/forkme_right_gray_6d6d6d.png"
		alt="Fork me on GitHub"></a>
	<header role="banner" class="navbar navbar-static-top bs-docs-nav">
		<div class="container">
			<div class="navbar-header">
				<button type="button" data-toggle="collapse" data-target="#collapse"
					class="navbar-toggle">
					<span class="sr-only">Toggle navigation</span><span
						class="icon-bar"></span><span class="icon-bar"></span><span
						class="icon-bar"></span>
				</button>
				<a href="../" class="navbar-brand">Bootstrap Switch</a>
			</div>
			<nav id="collapse" role="navigation"
				class="collapse navbar-collapse bs-navbar-collapse">
				<ul class="nav navbar-nav">
					<li><a
						href="https://github.com/Bttstrp/bootstrap-switch/archive/master.zip"
						data-toggle="dropdown">Download</a></li>
					<li><a href="examples.html">Examples</a></li>
					<li class="dropdown"><a href="#" data-toggle="dropdown">Documentation
							<span class="caret"></span>
					</a>
					<ul class="dropdown-menu">
							<li><a href="/options.html">Options</a></li>
							<li><a href="/methods.html">Methods</a></li>
							<li><a href="/events.html">Events</a></li>
							<li role="presentation" class="divider"></li>
							<li><a href="/documentation-2.html">Documentation
									(v2.0.1)</a></li>
						</ul></li>
					<li><a
						href="https://github.com/Bttstrp/bootstrap-switch/issues">Bug
							reports</a></li>
				</ul>
			</nav>
		</div>
	</header>
	<main id="content" role="main">
	<div class="bs-docs-header">
		<div class="container">
			<h1>Examples</h1>
		</div>
	</div>
	<div class="container">
		<div class="row">
			<div class="col-sm-6 col-lg-4">
				<h2 class="h4">State</h2>
				<p>
					<input id="switch-state" type="checkbox" checked="checked">
				</p>
				<div class="btn-group">
					<button type="button" data-switch-toggle="state"
						class="btn btn-default">Toggle</button>
					<button type="button" data-switch-set="state"
						data-switch-value="true" class="btn btn-default">Set true</button>
					<button type="button" data-switch-set="state"
						data-switch-value="false" class="btn btn-default">Set
						false</button>
					<button type="button" data-switch-get="state"
						class="btn btn-default">Get</button>
				</div>
			</div>
			<div class="col-sm-6 col-lg-4">
				<h2 class="h4">Size</h2>
				<p>
					<input id="switch-size" type="checkbox" checked="checked"
						data-size="mini">
				</p>
				<div class="btn-group">
					<button type="button" data-switch-set="size"
						data-switch-value="mini" class="btn btn-default">Mini</button>
					<button type="button" data-switch-set="size"
						data-switch-value="small" class="btn btn-default">Small</button>
					<button type="button" data-switch-set="size"
						data-switch-value="normal" class="btn btn-default">Normal</button>
					<button type="button" data-switch-set="size"
						data-switch-value="large" class="btn btn-default">Large</button>
					<button type="button" data-switch-get="size"
						class="btn btn-default">Get</button>
				</div>
			</div>
			<div class="col-sm-6 col-lg-4">
				<h2 class="h4">Animate</h2>
				<p>
					<input id="switch-animate" type="checkbox" checked="checked">
				</p>
				<p>
					<button type="button" data-switch-toggle="animate"
						class="btn btn-default">Toggle</button>
					<button type="button" data-switch-get="animate"
						class="btn btn-default">Get</button>
				</p>
			</div>
			<div class="col-sm-6 col-lg-4">
				<h2 class="h4">Disabled</h2>
				<p>
					<input id="switch-disabled" type="checkbox" checked="checked"
						disabled="disabled">
				</p>
				<p>
					<button type="button" data-switch-toggle="disabled"
						class="btn btn-default">Toggle</button>
					<button type="button" data-switch-get="disabled"
						class="btn btn-default">Get</button>
				</p>
			</div>
			<div class="col-sm-6 col-lg-4">
				<h2 class="h4">Readonly</h2>
				<p>
					<input id="switch-readonly" type="checkbox" checked="checked"
						readonly="readonly">
				</p>
				<p>
					<button type="button" data-switch-toggle="readonly"
						class="btn btn-default">Toggle</button>
					<button type="button" data-switch-get="readonly"
						class="btn btn-default">Get</button>
				</p>
			</div>
			<div class="col-sm-6 col-lg-4">
				<h2 class="h4">Indeterminate</h2>
				<p>
					<input id="switch-indeterminate" type="checkbox" checked="checked"
						data-indeterminate="true">
				</p>
				<p>
					<button type="button" data-switch-toggle="indeterminate"
						class="btn btn-default">Toggle</button>
					<button type="button" data-switch-get="indeterminate"
						class="btn btn-default">Get</button>
				</p>
			</div>
			<div class="col-sm-6 col-lg-4">
				<h2 class="h4">Inverse</h2>
				<p>
					<input id="switch-inverse" type="checkbox" checked="checked"
						data-inverse="true">
				</p>
				<p>
					<button type="button" data-switch-toggle="inverse"
						class="btn btn-default">Toggle</button>
					<button type="button" data-switch-get="inverse"
						class="btn btn-default">Get</button>
				</p>
			</div>
			<div class="col-sm-6 col-lg-4">
				<h2 class="h4">On Color</h2>
				<p>
					<input id="switch-onColor" type="checkbox" checked="checked"
						data-on-color="info">
				</p>
				<p class="btn-group">
				<div class="btn-group">
					<button type="button" data-toggle="dropdown"
						class="btn btn-default dropdown-toggle">
						Set &nbsp;<span class="caret"></span>
					</button>
					<div role="menu" class="dropdown-menu">
						<li><a data-switch-set="onColor" data-switch-value="primary">Primary</a></li>
						<li><a data-switch-set="onColor" data-switch-value="info">Info</a></li>
						<li><a data-switch-set="onColor" data-switch-value="success">Success</a></li>
						<li><a data-switch-set="onColor" data-switch-value="warning">Warning</a></li>
						<li><a data-switch-set="onColor" data-switch-value="default">Default</a></li>
					</div>
				</div>
				<button type="button" data-switch-get="onColor"
					class="btn btn-default">Get</button>
				</p>
			</div>
			<div class="col-sm-6 col-lg-4">
				<h2 class="h4">Off Color</h2>
				<p>
					<input id="switch-offColor" type="checkbox"
						data-off-color="warning">
				</p>
				<p class="btn-group">
				<div class="btn-group">
					<button type="button" data-toggle="dropdown"
						class="btn btn-default dropdown-toggle">
						Set &nbsp;<span class="caret"></span>
					</button>
					<div role="menu" class="dropdown-menu">
						<li><a data-switch-set="offColor" data-switch-value="primary">Primary</a></li>
						<li><a data-switch-set="offColor" data-switch-value="info">Info</a></li>
						<li><a data-switch-set="offColor" data-switch-value="success">Success</a></li>
						<li><a data-switch-set="offColor" data-switch-value="warning">Warning</a></li>
						<li><a data-switch-set="offColor" data-switch-value="default">Default</a></li>
					</div>
				</div>
				<button type="button" data-switch-get="offColor"
					class="btn btn-default">Get</button>
				</p>
			</div>
			<div class="col-sm-6 col-lg-4">
				<h2 class="h4">On Text</h2>
				<p>
					<input id="switch-onText" type="checkbox" checked="checked"
						data-on-text="Yes">
				</p>
				<div class="row">
					<div class="col-sm-6">
						<input type="text" data-switch-set-value="onText" value="Yes"
							class="form-control">
					</div>
				</div>
			</div>
			<div class="col-sm-6 col-lg-4">
				<h2 class="h4">Off Text</h2>
				<p>
					<input id="switch-offText" type="checkbox" data-off-text="No">
				</p>
				<div class="row">
					<div class="col-sm-6">
						<input type="text" data-switch-set-value="offText" value="No"
							class="form-control">
					</div>
				</div>
			</div>
			<div class="col-sm-6 col-lg-4">
				<h2 class="h4">Label Text</h2>
				<p>
					<input id="switch-labelText" type="checkbox"
						data-label-text="Label">
				</p>
				<div class="row">
					<div class="col-sm-6">
						<input type="text" data-switch-set-value="labelText"
							class="form-control">
					</div>
				</div>
			</div>
			<div class="col-sm-6 col-lg-4">
				<h2 class="h4">Handle Width</h2>
				<p>
					<input id="switch-handleWidth" type="checkbox"
						data-handle-width="100">
				</p>
				<div class="row">
					<div class="col-sm-6">
						<input type="number" data-switch-set-value="handleWidth"
							value="100" class="form-control">
					</div>
				</div>
			</div>
			<div class="col-sm-6 col-lg-4">
				<h2 class="h4">Label Width</h2>
				<p>
					<input id="switch-labelWidth" type="checkbox"
						data-label-width="100">
				</p>
				<div class="row">
					<div class="col-sm-6">
						<input type="number" data-switch-set-value="labelWidth"
							value="100" class="form-control">
					</div>
				</div>
			</div>
			<div class="col-sm-6 col-lg-4">
				<h2 class="h4">Create | Destroy</h2>
				<p>
					<input id="switch-create-destroy" type="checkbox" checked="checked"
						data-switch-no-init="data-switch-no-init">
				</p>
				<div class="row">
					<div class="col-sm-6">
						<button type="button"
							data-switch-create-destroy="data-switch-create-destroy"
							data-destroy-text="Destroy" class="btn btn-default">Create</button>
					</div>
				</div>
			</div>
		</div>
		<br>
		<br>
		<div class="text-center">
			<h2 class="h4">Radio All Off</h2>
			<div class="row">
				<div class="col-sm-6">
					<h3 class="h5">Disabled</h3>
					<input type="radio" name="radio1" checked="checked"
						class="switch-radio1"><input type="radio" name="radio1"
						class="switch-radio1"><input type="radio" name="radio1"
						class="switch-radio1">
				</div>
				<div class="col-sm-6">
					<h3 class="h5">Enabled</h3>
					<input type="radio" name="radio2" checked="checked"
						data-radio-all:off="true" class="switch-radio2"><input
						type="radio" name="radio2" data-radio-all:off="true"
						class="switch-radio2"><input type="radio" name="radio2"
						data-radio-all:off="true" class="switch-radio2">
				</div>
			</div>
			<br>
			<hr>
			<h2 class="h4">Inside Modals</h2>
			<button data-toggle="modal" data-target="#modal-switch"
				class="btn btn-default">Open Modal</button>
			<div id="modal-switch" tabindex="-1" role="dialog"
				aria-labelledby="modal-switch-label" class="modal fade">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" data-dismiss="modal" class="close">
								<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
							</button>
							<div id="modal-switch-label" class="modal-title">Title</div>
						</div>
						<div class="modal-body">
							<input id="switch-modal" type="checkbox" checked="checked">
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	</main>
	<footer class="bs-docs-footer">
		<div class="container">
			<p>
				Code licensed under <a
					href="https://www.apache.org/licenses/LICENSE-2.0" target="_blank">Apache
					License, Version 2.0</a><br>Created by <a
					href="https://github.com/nostalgiaz" target="_blank">Mattia
					Larentis</a><br>Mantained by <a href="https://github.com/lostcrew"
					target="_blank">Emanuele Marchi</a>
			</p>
		</div>
	</footer>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<script src="js/highlight.js"></script>
	<script src="https://unpkg.com/bootstrap-switch"></script>
	<script src="js/main.js"></script>
</body>
</html>