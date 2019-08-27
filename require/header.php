<html>
	<head>
		<link	href="css/unsorted.css"
				rel="stylesheet"
				type="text/css" />
		<title>
				Edge Technologies - <?php echo $page;?>
		</title>		
		<body>
			<header>
<?php
$dbconfig = require_once("require/dbconfig.php");
try
{
    $pdo = new PDO($dsn, $user, $pass);
	$stmt = $pdo->prepare('	SELECT pages.page
							FROM menus
							LEFT JOIN menu_pages
							ON menus.id=menu_pages.menu_id
							LEFT JOIN pages
							ON menu_pages.page_id=pages.id
							WHERE menus.menu = ?');
	$stmt->execute(['header_menu']);
?>
				<menu	id	= "header_menu">
<?php
	foreach ($stmt as $row)
	{
?>
					<a href="index.php?page=<?php echo str_replace(" ","_",$row['page'])?>" class="active"><?php echo $row['page']?></a>
<?php
	}
?>
				</menu>
<?php
}
catch (\PDOException $e) 
{
     throw new \PDOException($e->getMessage(), (int)$e->getCode());
}
?>
					
			</header>
