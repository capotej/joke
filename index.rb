<h1>Parameter Testing:</h1>
$_GET:<br/>
<?= print_r($_GET) ?><br/>
$_POST:<br/>
<?= print_r($_POST) ?><br/>
$_REQUEST:<br/>
<%= print_r($_REQUEST)?><br/>
<br>

array(1,2,3) = <%= print_r(array(1,2,3)) %>

<h1>Forms:</h1>
<form action="form.rb" method="post">
First Name: <input type="text" name="first_name">
Last Name: <input type="text" name="last_name">
<input type="submit" value="submit">
</form>

