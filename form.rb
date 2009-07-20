<h1>Parameter Testing:</h1>
$_GET:<br/>
<?= print_r($_GET) ?><br/>
$_POST:<br/>
<?= print_r($_POST) ?><br/>
$_REQUEST:<br/>
<%= print_r($_REQUEST)?><br/>
<br/>

<h1>Form result:</h1>
Your name is <%= $_POST["first_name"]%> <%= $_POST["last_name"] %>

