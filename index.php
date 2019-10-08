<?php
	// Starting session
	session_start();
	$page = $_GET["page"];
	if ($_SERVER['SERVER_ADDR']=='192.168.1.67')
	{
		$redirect_path = '/edge/home';
	}
	elseif ($_SERVER['SERVER_NAME']=='localhost')
	{
		$redirect_path = '/edge/home';
	}
	elseif ($_SERVER['SERVER_NAME']=='etl-co-ug.edgetechuganda.com')
	{
		$redirect_path = '/home';
	}
	else
	{
		echo 'Error 1: The host is currently not understood.';
	}
	if (isset($page)&& !empty($page))
	{
?>
<!DOCTYPE html>
<html>
	<head>	
		<link	href			=	"css/colors.css"
				rel				=	"stylesheet"
				type			=	"text/css" />
		<link	href			=	"css/fonts.css"
				rel				=	"stylesheet"
				type			=	"text/css" />
		<link	href			=	"css/structure.css"
				rel				=	"stylesheet"
				type			=	"text/css" />
		<link	href			=	"css/unsorted.css"
				rel				=	"stylesheet"
				type			=	"text/css" />
		<link	href			=	"favicon.ico"
				rel				=	"shortcut icon"
				type			=	"image/x-icon" />
		<meta	charset			=	"UTF-8" />
		<meta	content			=	"Amina Juma"
				name			=	"author" />
		<meta 	content			=	"Edge Technologies Limited specializes in sales and service of copiers and MFPs, printer repair service, computer sales, software development"
				name			=	"description" />
		<meta 	content			=	"multi-function printers, copiers, computers, MFPs" 
				name			=	"keywords" />
		<meta 	content			=	"width=device-width, initial-scale=1.0"
				name			=	"viewport" />
<?php
	$dbconfig = require_once("require/dbconfig.php");
	$pdo = new PDO($dsn, $user, $pass);
	$query = '	SELECT COUNT(*)
				FROM page_parents
				LEFT JOIN pages
				ON pages.id=page_parents.page_id
				WHERE page_parents.page_id = page_parents.page_parent_id
				AND pages.page = ?';
	$stmt = $pdo->prepare($query);
	/* Remove underscore and replace with space. */
	$page=str_replace("_"," ",$page);
	$stmt->execute([$page]);
	/* Check the number of rows that match the SELECT statement. */
	if ($stmt->fetchColumn() > 0)
	{
		require_once("require/title.php");
?>
	</head>
	<body>
<?php
			require_once("require/header.php");
?>
		<main>
<?php
	$pdo = new PDO($dsn, $user, $pass);
	$query = '	SELECT images.image, alternatives.alternative 
				FROM images
				LEFT JOIN image_locations
				ON image_locations.image_id=images.id
				LEFT JOIN locations
				ON locations.id=image_locations.location_id
				LEFT JOIN image_alternatives
				ON image_alternatives.image_id=images.id
				LEFT JOIN alternatives
				ON alternatives.id=image_alternatives.alternative_id
				WHERE locations.location = ?
				ORDER BY RAND()
				LIMIT 10 ';
	$stmt = $pdo->prepare($query);
	$stmt->execute(['slider']);
	$count = $stmt->rowCount();
?>
					<section	class	=	'top_slider'>
						<div		class	=	'slider'>
<?php
	$i=0;
	foreach ($stmt as $row)
	{
		
?>
							<input name="input-slider" id='input-slide-<?php echo $i;?>' type="radio" class='input-slide input-slide-num' />
<?php
		$i++;
	}
?>
							<input name="input-slider" id='input-slide-autoplay' type="radio" class='input-slide' checked>
							<ul>
<?php
	$stmt->execute(['slider']);
	$i=0;
	foreach ($stmt as $row)
	{
		
?>
								<li class='slide-<?php echo $i;?>'
									style="background-image:url(img/<?php echo $row['image'];?>);background-size:contain;"></li>
<?php
		$i++;
	}
?>
							</ul>
							<div class='slide-description'>
<?php
	$stmt->execute(['slider']);
	$i=0;
	foreach ($stmt as $row)
	{
		
?>
								<label class='slide-<?php echo $i;?>'>
									<!--<h1 class="text-slide"><?php /*echo $row['alternative'];*/?></h1>-->
								</label>
<?php
		$i++;
	}
?>
    </div>
    <div class='slider-arrow-prev'>
      <label class='slide-0' for='input-slide-0'></label>
      <label class='slide-1' for='input-slide-1'></label>
      <label class='slide-2' for='input-slide-2'></label>
      <label class='slide-3' for='input-slide-3'></label>
    </div>
    <div class='slider-arrow-next'>
      <label class='slide-0' for='input-slide-0'></label>
      <label class='slide-1' for='input-slide-1'></label>
      <label class='slide-2' for='input-slide-2'></label>
      <label class='slide-3' for='input-slide-3'></label>
    </div>        
    <div class='slider-dot'>
      <label class='slide-0' for='input-slide-0'></label>
      <label class='slide-1' for='input-slide-1'></label>
      <label class='slide-2' for='input-slide-2'></label>
      <label class='slide-3' for='input-slide-3'></label>
    </div>        
  </div>
			</section>
			<div 	class	=	"container">
				<h1>
					Welcome To Edge Technologies LTD!
				</h1>
				<div id="introduction">			
					<p>
						Searching for an attentive service that prioritizes your needs, make Edge Technologies Limited your number one choice. As EdgeTech fraternity we are dedicated to serving and helping our clients to achieve their desired business goals and objectives. This is why we offer customized solutions that address your organizational needs while staying well within your specified budget. 
					</p>
					<p>
						Keep in touch with our products' specialists and find out why we are the region's leading company for document technology, services and the authorized business partner for Toshiba copiers and all other customized office solutions. With Just an initial consultation, we will be able to fully understand your goals and addressing your concerns accordingly. That is why Edge Technologies ltd strives to provide every customer with new value that brings satisfaction.
					</p>
				</div>
				<a		href	=	"#">
					
		
<?php
$pdo = new PDO($dsn, $user, $pass);
$query = '	SELECT images.image, alternatives.alternative 
			FROM images
			LEFT JOIN image_locations
			ON image_locations.image_id=images.id
			LEFT JOIN locations
			ON locations.id=image_locations.location_id
			LEFT JOIN image_alternatives
			ON image_alternatives.image_id=images.id
			LEFT JOIN alternatives
			ON alternatives.id=image_alternatives.alternative_id
			WHERE locations.location = ?
			ORDER BY RAND() 
			LIMIT 1 ';
$stmt = $pdo->prepare($query);
$stmt->execute(['banner']);
	foreach ($stmt as $row)
	{
		
?>
					<img	alt		=	"<?php echo $row['alternative'];?>"
							class	=	"banner"
							src		=	"img/<?php echo $row['image'];?>"/>
<?php
	}
?>
				</a>
				
				<div>
					<h1>
						Our Multifunction Printer Range
					</h1>
					<div	id		=	'range_categories'>
					
					
					
<?php
$pdo = new PDO($dsn, $user, $pass);
$query = '	SELECT images.image, alternatives.alternative, range_category_descriptions.range_category_description
			FROM images
			LEFT JOIN image_locations
			ON image_locations.image_id=images.id
			LEFT JOIN locations
			ON locations.id=image_locations.location_id
			LEFT JOIN image_alternatives
			ON image_alternatives.image_id=images.id
			LEFT JOIN alternatives
			ON alternatives.id=image_alternatives.alternative_id
			LEFT JOIN image_range_category_descriptions
			ON image_range_category_descriptions.image_id=images.id
			LEFT JOIN range_category_descriptions
			ON range_category_descriptions.id=image_range_category_descriptions.range_category_description_id
			WHERE locations.location = ?';
$stmt = $pdo->prepare($query);
$stmt->execute(['range_categories']);
	foreach ($stmt as $row)
	{
?>
						<a			class	=	''
									href	=	'#high_capacity'>
							<img		alt		=	"<?php echo $row['alternative'];?>"
										class	=	"range_categories"
										src		=	"img/<?php echo $row['image'];?>"/>
							
							<h3>
<?php
								echo str_replace('Multi-function Printers','<abbr title="Multi-function printers">MFPs</abbr>',$row['alternative']);
?>
							</h3>
<?php
							echo $row['range_category_description'];
?>
						</a>
<?php
	}
?>
					</div>					
				</div>
			</div>
			<section	id		=	"high_capacity">
				<div class="container">
					<div class="text_wrapper">
						<h3>
							High Capacity MFPs
						</h3>
						<p>							
							Edge Technologies' printers and smart MFPs for large workgroups are designed for the demands of teams of 20 or more with print volumes of more than 6,000 pages per month. These powerful devices offer unprecedented print speeds, advanced features and solutions integration. Industry-leading input/output capacity, high-yield toner cartridges and long-life imaging components reduce downtime and keep work flowing in demanding output environments. 
						</p>						
						<a href="#">
							
							<span>
								explore our products
							</span>
						</a>
					</div>
					<img src="img/high_capacity_mfps.png"/>
				</div>
			</section>
			
			<section>
				<div class="container">
					<div class="text_wrapper">
						<h3>Office Size MFPs</h3>
						<p>
							In addition to our industry-leading multi-function printers (MFPs) and copiers, Toshiba has developed Elevate—a powerful software platform that transforms your MFP into a truly customized solution. Elevate creates a user interface built just for you—creating single-button access to your most important and commonly used features. Every company is different, and Elevate allows your MFP to be uniquely yours.
						</p>
						<a href="#">
							<br/>
							<span>
								explore our products
							</span>
						</a>
					</div>
					<img src="img/office_size_mfps.png"/>
				</div>
			</section>
			
			<section>
				<div class="container">
					<div class="text_wrapper">
						<h3>Entry Level MFPs</h3>
						<p>
							In addition to our industry-leading multi-function printers (MFPs) and copiers, Toshiba has developed Elevate—a powerful software platform that transforms your MFP into a truly customized solution. Elevate creates a user interface built just for you—creating single-button access to your most important and commonly used features. Every company is different, and Elevate allows your MFP to be uniquely yours.
						</p>
						<a href="#">
							<br/>
							<span>
								explore our products
							</span>
						</a>
					</div>
					<img src="img/entry_level_mfps.png"/>
				</div>
			</section>
			
			<section>
				<div class="container">
					<div class="text_wrapper">
						<h3>Color MFPs</h3>
						<p>
							In addition to our industry-leading multi-function printers (MFPs) and copiers, Toshiba has developed Elevate—a powerful software platform that transforms your MFP into a truly customized solution. Elevate creates a user interface built just for you—creating single-button access to your most important and commonly used features. Every company is different, and Elevate allows your MFP to be uniquely yours.
						</p>
						<a href="#">
							<br/>
							<span>
								explore our products
							</span>
						</a>
					</div>
					<img src="img/colour_mfps.png"/>
				</div>
			</section>
			
			<section>
				<div class="container">
					<div class="text_wrapper">
						<h3 id="Monochromes">Monochrome MFPs</h3>
						<p>
							In addition to our industry-leading multi-function printers (MFPs) and copiers, Toshiba has developed Elevate—a powerful software platform that transforms your MFP into a truly customized solution. Elevate creates a user interface built just for you—creating single-button access to your most important and commonly used features. Every company is different, and Elevate allows your MFP to be uniquely yours.
						</p>
						<a href="#">
							<!--Remember to remove break-->
							<br/>
							<span>
								explore our products
							</span>
						</a>
					</div>
					<img src="img/monochrome_mfps.png"/>
				</div>
			</section>
			
			
				
			
			
<?php
        }
        else
        {
			$page_status = '404';
			require_once("require/title.php");
?>
	</head>
	<body	id				=	"error_404">
<?php
			require_once("require/header.php");
?>
		<main>
			<div	class			=	"notfound-copy">
				<svg	alt				=	"404 Page not found"
						aria-labelledby	=	"404"
						class			=	"not-found">
					<title>
						404 Page not found.
					</title>
					<desc>
						404 Error Code for page not found.
					</desc>
					<g class="404-text">
						<g opacity=".5" fill="#3B3D3D">
							<path d="M320.1 209.5c0 7.2-6 12.5-13.7 12.5s-13.7-5.4-13.7-12.5v-16.3h-43.8c-8.4 0-14.1-6.4-14.1-13.5 0-.8.8-4.4 2-7L275 84.5c2-4.8 7.2-7.8 12.3-7.8 6.8 0 13.7 6 13.7 12.9 0 1.2 0 2.6-.8 4.4-11.5 26.7-20.9 47.6-32.4 74.2h24.9v-30.4c0-7.2 6-12.5 13.7-12.5 7.4 0 13.7 5.4 13.7 12.5v30.4h2.6c7.6 0 13.3 5.8 13.3 12.3 0 7-5.8 12.5-13.3 12.5h-2.6v16.5zM436.9 123.9v54.7c0 24.3-16.3 43.6-46 43.6s-46-19.3-46-43.6v-54.7c0-26.3 13.9-47.4 46-47.4 32.1.1 46 21.2 46 47.4zm-64.3-1.4v56.1c0 11.3 6.4 19.1 18.3 19.1s18.3-7.8 18.3-19.1v-56.1c0-12.7-5.2-21.7-18.3-21.7s-18.3 9-18.3 21.7zM535 209.5c0 7.2-6 12.5-13.7 12.5s-13.7-5.4-13.7-12.5v-16.3h-43.8c-8.4 0-14.1-6.4-14.1-13.5 0-.8.8-4.4 2-7l38.2-88.2c2-4.8 7.2-7.8 12.3-7.8 6.8 0 13.7 6 13.7 12.9 0 1.2 0 2.6-.8 4.4-11.5 26.7-20.9 47.6-32.4 74.2h24.9v-30.4c0-7.2 6-12.5 13.7-12.5 7.4 0 13.7 5.4 13.7 12.5v30.4h2.6c7.6 0 13.3 5.8 13.3 12.3 0 7-5.8 12.5-13.3 12.5H535v16.5z"/>
						</g>
						<g fill="#FFF">
							<path d="M326.4 197.5c0 7.2-6 12.5-13.7 12.5s-13.7-5.4-13.7-12.5v-16.3h-43.8c-8.4 0-14.1-6.4-14.1-13.5 0-.8.8-4.4 2-7l38.2-88.2c2-4.8 7.2-7.8 12.3-7.8 6.8 0 13.7 6 13.7 12.9 0 1.2 0 2.6-.8 4.4-11.5 26.7-20.9 47.6-32.4 74.2H299v-30.4c0-7.2 6-12.5 13.7-12.5 7.4 0 13.7 5.4 13.7 12.5v30.4h2.6c7.6 0 13.3 5.8 13.3 12.3 0 7-5.8 12.5-13.3 12.5h-2.6v16.5zM443.2 111.9v54.7c0 24.3-16.3 43.6-46 43.6s-46-19.3-46-43.6v-54.7c0-26.3 13.9-47.4 46-47.4 32.1.1 46 21.2 46 47.4zm-64.2-1.4v56.1c0 11.3 6.4 19.1 18.3 19.1s18.3-7.8 18.3-19.1v-56.1c0-12.7-5.2-21.7-18.3-21.7s-18.3 9-18.3 21.7zM541.4 197.5c0 7.2-6 12.5-13.7 12.5-7.8 0-13.7-5.4-13.7-12.5v-16.3h-43.8c-8.4 0-14.1-6.4-14.1-13.5 0-.8.8-4.4 2-7l38.2-88.2c2-4.8 7.2-7.8 12.3-7.8 6.8 0 13.7 6 13.7 12.9 0 1.2 0 2.6-.8 4.4-11.5 26.7-20.9 47.6-32.4 74.2H514v-30.4c0-7.2 6-12.5 13.7-12.5 7.4 0 13.7 5.4 13.7 12.5v30.4h2.6c7.6 0 13.3 5.8 13.3 12.3 0 7-5.8 12.5-13.3 12.5h-2.6v16.5z"/>
						</g>
					</g>
				</svg>
				<h1>
					Page not found.
				</h1>
				<input	id				=	"input1"
						placeholder		=	"Search"
						type			=	"text" />
				<!-- Search icon -->
				<svg		class			=	"search-icon"
							height			=	"25.8"
							width			=	"26" >
					<path		d				=	"M22.3 3.7C20.5 2 18.1 1 15.6 1S10.8 2 9 3.7c-1.8 1.8-2.7 4.1-2.7 6.6 0 1.7.5 3.4 1.4 4.9l-6 6-.1.1c-.8.9-.8 2.2.1 3.1.8.8 2.2.9 3.1.1l6-6c1.5.9 3.1 1.4 4.9 1.4 2.5 0 4.9-1 6.6-2.7 3.6-3.8 3.6-9.8 0-13.5zm-2.9 10.5c-1 1-2.4 1.6-3.8 1.6s-2.8-.6-3.8-1.6-1.6-2.4-1.6-3.8.6-2.8 1.6-3.8S14.2 5 15.6 5s2.8.6 3.8 1.6c2.1 2.1 2.1 5.5 0 7.6z"
								fill			=	"#68A1D6"
								opacity			=	".4"/>
				</svg>
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
	$stmt->execute(['error_search_menu']);
?>
				<menu	id				=	"error_search_menu">
<?php
	foreach ($stmt as $row)
	{
?>
					<p>
						<a		class			=	"active"
								href			=	"index.php?page=<?php echo str_replace(" ","_",$row['page'])?>">
							<?php echo $row['page']?>
						</a>
					</p>
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
			</div>
			<svg		aria-labelledby	=	"Starry sky" 
						alt				=	"Starry sky" 
						class				=	"starry-sky">
				<!-- STARS START -->
				<g 		class				=	"all-stars" fill="#F6F5BC">
					<path 	class				=	"stars-one" 
							d					=	"M148.9 151.5c-.3-.3-.6-.4-1-.4s-.7.1-1 .4c-1.6 4.9-6.2 6.2-6.2 6.2-.3.3-.4.6-.4 1s.1.7.4 1c4.9 1.6 6.2 6.2 6.2 6.2.3.3.6.4 1 .4s.7-.1 1-.4c1.6-4.9 6.2-6.2 6.2-6.2.3-.3.4-.6.4-1s-.1-.7-.4-1c-5-1.7-6.2-6.2-6.2-6.2zM93.6 "/>
					<path 	class				=	"stars-two" 
							d					=	"M148.9 540.6c-4.9-1.6-6.2-6.2-6.2-6.2-.3-.3-.6-.4-1-.4s-.7.1-1 .4c-1.6 4.9-6.2 6.2-6.2 6.2-.3.3-.4.6-.4 1s.1.7.4 1c4.9 1.6 6.2 6.2 6.2 6.2.3.3.6.4 1 .4s.7-.1 1-.4c1.6-4.9 6.2-6.2 6.2-6.2.3-.3.4-.6.4-1s-.1-.8-.4-1zM526.3 551.7c-.3-.3-.6-.4-1-.4s-.7.1-1 .4c-1.6 4.9-6.2 6.2-6.2 6.2-.3.3-.4.6-.4 1s.1.7.4 1c4.9 1.6 6.2 6.2 6.2 6.2.3.3.6.4 1 .4s.7-.1 1-.4c1.6-4.9 6.2-6.2 6.2-6.2.3-.3.4-.6.4-1s-.1-.7-.4-1c-5-1.7-6.2-6.2-6.2-6.2zM617.4 291.9c-.3-.3-.6-.4-1-.4s-.7.1-1 .4c-1.6 4.9-6.2 6.2-6.2 6.2-.3.3-.4.6-.4 1s.1.7.4 1c4.9 1.6 6.2 6.2 6.2 6.2.3.3.6.4 1 .4s.7-.1 1-.4c1.6-4.9 6.2-6.2 6.2-6.2.3-.3.4-.6.4-1s-.1-.7-.4-1c-5-1.6-6.2-6.2-6.2-6.2zM681.9 42.7c-.3-.3-.6-.4-1-.4s-.7.1-1 .4c-1.6 4.9-6.2 6.2-6.2 6.2-.3.3-.4.6-.4 1s.1.7.4 1c4.9 1.6 6.2 6.2 6.2 6.2.3.3.6.4 1 .4s.7-.1 1-.4c1.6-4.9 6.2-6.2 6.2-6.2.3-.3.4-.6.4-1s-.1-.7-.4-1c-5-1.7-6.2-6.2-6.2-6.2zM51.1 83.9c-.3-.3-.6-.4-1-.4s-.7.1-1 .4C47.5 88.8 43 90 43 90c-.3.3-.4.6-.4 1s.1.7.4 1c4.9 1.6 6.2 6.2 6.2 6.2.3.3.6.4 1 .4s.7-.1 1-.4c1.6-4.9 6.2-6.2 6.2-6.2.3-.3.4-.6.4-1s-.1-.7-.4-1c-5.1-1.6-6.3-6.1-6.3-6.1z"/>
					<path	class				=	"all-stars" 
							d					=	"M148.9 151.5c-.3-.3-.6-.4-1-.4s-.7.1-1 .4c-1.6 4.9-6.2 6.2-6.2 6.2-.3.3-.4.6-.4 1s.1.7.4 1c4.9 1.6 6.2 6.2 6.2 6.2.3.3.6.4 1 .4s.7-.1 1-.4c1.6-4.9 6.2-6.2 6.2-6.2.3-.3.4-.6.4-1s-.1-.7-.4-1c-5-1.7-6.2-6.2-6.2-6.2zM93.6 318.5c-.3-.3-.6-.4-1-.4s-.7.1-1 .4c-1.6 4.9-6.2 6.2-6.2 6.2-.3.3-.4.6-.4 1s.1.7.4 1c4.9 1.6 6.2 6.2 6.2 6.2.3.3.6.4 1 .4s.7-.1 1-.4c1.6-4.9 6.2-6.2 6.2-6.2.3-.3.4-.6.4-1s-.1-.7-.4-1c-5-1.7-6.2-6.2-6.2-6.2zM132.3 169c-.2-.2-.4-.3-.6-.3s-.4.1-.6.3c-1 3.1-3.8 3.8-3.8 3.8-.2.2-.3.4-.3.6 0 .2.1.4.3.6 3.1 1 3.8 3.8 3.8 3.8.2.2.4.3.6.3s.4-.1.6-.3c1-3.1 3.8-3.8 3.8-3.8.2-.2.3-.4.3-.6 0-.2-.1-.4-.3-.6-3-.9-3.8-3.8-3.8-3.8zM585.9 269.5c-.3-.3-.6-.4-1-.4s-.7.1-1 .4c-1.6 4.9-6.2 6.2-6.2 6.2-.3.3-.4.6-.4 1s.1.7.4 1c4.9 1.6 6.2 6.2 6.2 6.2.3.3.6.4 1 .4s.7-.1 1-.4c1.6-4.9 6.2-6.2 6.2-6.2.3-.3.4-.6.4-1s-.1-.7-.4-1c-5-1.7-6.2-6.2-6.2-6.2zM723.4 540.6c-4.9-1.6-6.2-6.2-6.2-6.2-.3-.3-.6-.4-1-.4s-.7.1-1 .4c-1.6 4.9-6.2 6.2-6.2 6.2-.3.3-.4.6-.4 1s.1.7.4 1c4.9 1.6 6.2 6.2 6.2 6.2.3.3.6.4 1 .4s.7-.1 1-.4c1.6-4.9 6.2-6.2 6.2-6.2.3-.3.4-.6.4-1s-.1-.8-.4-1zM526.3 551.7c-.3-.3-.6-.4-1-.4s-.7.1-1 .4c-1.6 4.9-6.2 6.2-6.2 6.2-.3.3-.4.6-.4 1s.1.7.4 1c4.9 1.6 6.2 6.2 6.2 6.2.3.3.6.4 1 .4s.7-.1 1-.4c1.6-4.9 6.2-6.2 6.2-6.2.3-.3.4-.6.4-1s-.1-.7-.4-1c-5-1.7-6.2-6.2-6.2-6.2zM617.4 291.9c-.3-.3-.6-.4-1-.4s-.7.1-1 .4c-1.6 4.9-6.2 6.2-6.2 6.2-.3.3-.4.6-.4 1s.1.7.4 1c4.9 1.6 6.2 6.2 6.2 6.2.3.3.6.4 1 .4s.7-.1 1-.4c1.6-4.9 6.2-6.2 6.2-6.2.3-.3.4-.6.4-1s-.1-.7-.4-1c-5-1.6-6.2-6.2-6.2-6.2zM681.9 42.7c-.3-.3-.6-.4-1-.4s-.7.1-1 .4c-1.6 4.9-6.2 6.2-6.2 6.2-.3.3-.4.6-.4 1s.1.7.4 1c4.9 1.6 6.2 6.2 6.2 6.2.3.3.6.4 1 .4s.7-.1 1-.4c1.6-4.9 6.2-6.2 6.2-6.2.3-.3.4-.6.4-1s-.1-.7-.4-1c-5-1.7-6.2-6.2-6.2-6.2zM51.1 83.9c-.3-.3-.6-.4-1-.4s-.7.1-1 .4C47.5 88.8 43 90 43 90c-.3.3-.4.6-.4 1s.1.7.4 1c4.9 1.6 6.2 6.2 6.2 6.2.3.3.6.4 1 .4s.7-.1 1-.4c1.6-4.9 6.2-6.2 6.2-6.2.3-.3.4-.6.4-1s-.1-.7-.4-1c-5.1-1.6-6.3-6.1-6.3-6.1z"/>
				</g>
				<!-- Moon shadow -->
				<g		class				=	"moon">
					<path 	d					=	"M122.7 373.9L-237.1 744l283.8 269.4 279.9-492.8z"
							fill				=	"#3B3D3D"
							opacity				=	".5"/>
					<!-- Moon color base -->
					<g 		fill				=	"#D1D5D6">
						<path	d					=	"M209 340.6c-70.9 0-128.4 57.5-128.4 128.4S138.1 597.4 209 597.4 337.4 539.9 337.4 469 279.9 340.6 209 340.6zm-41.9 176.1c0 10.9-8.9 19.8-19.8 19.8s-19.8-8.9-19.8-19.8c0-1.4.1-2.7.4-4-18.3-1.7-32.6-17-32.6-35.7 0-19.8 16.1-35.9 35.9-35.9 19.8 0 35.9 16.1 35.9 35.9 0 8.9-3.3 17.1-8.6 23.3 5.1 3.7 8.6 9.7 8.6 16.4zm20.2 3.9c0-8.8 7.1-16 16-16 8.8 0 16 7.1 16 16 0 8.8-7.1 16-16 16-8.9-.1-16-7.2-16-16zm5.8-43.5c0-13.3 10.7-24 24-24s24 10.7 24 24-10.7 24-24 24-24-10.8-24-24zm72.7 86.4c-4.2 0-8.2-.7-11.9-2-.5 12.8-11 23.1-24 23.1-13.3 0-24-10.7-24-24s10.7-24 24-24h1.1c-.7-2.9-1.1-5.8-1.1-8.9 0-19.8 16.1-35.9 35.9-35.9 19.8 0 35.9 16.1 35.9 35.9s-16.1 35.8-35.9 35.8zm10.9-91.1c0 2.6-2.1 4.6-4.6 4.6-2.6 0-4.6-2.1-4.6-4.6 0-2.6 2.1-4.6 4.6-4.6 2.5 0 4.6 2.1 4.6 4.6zm27.7 13.1c-2.1 2-4.9 3.2-8.1 3.2-6.5 0-11.7-5.2-11.7-11.7 0-6.5 5.2-11.7 11.7-11.7.5 0 1.1 0 1.6.1-1.5-3.6-3.2-7.1-5.1-10.5 2.5-4 3.9-8.7 3.9-13.8 0-14.6-11.8-26.4-26.4-26.4-3.6 0-7 .7-10.2 2-4.9-3.8-10.2-7.2-15.7-10.2.1 1 .2 2 .2 3.1 0 17.4-14.1 31.5-31.5 31.5-16.7 0-30.4-13-31.4-29.5 0-.7-.1-1.3-.1-2 0-3.4.5-6.6 1.5-9.6.9-2.8 2.2-5.5 3.8-7.9-2.2 0-4.3.1-6.5.2-3.8-6.7-11-11.2-19.2-11.2-11.8 0-21.5 9.3-22.1 21-17.1 7.5-32.1 18.8-43.9 32.8 14.3-50.3 60.6-87.2 115.6-87.2 66.3 0 120.1 53.8 120.1 120.1 0 29.5-10.6 56.4-28.2 77.3 3-10.5 4.6-21.5 4.6-32.9.1-9.1-.9-18.1-2.9-26.7z"/><circle cx="256.3" cy="384.3" r="14.1"/></g><g fill="#FFF"><circle cx="217.1" cy="477.1" r="24"/><path d="M265.8 491.7c-19.8 0-35.9 16.1-35.9 35.9 0 3.1.4 6.1 1.1 8.9h-1.1c-13.3 0-24 10.7-24 24s10.7 24 24 24c12.9 0 23.5-10.2 24-23.1 3.7 1.3 7.7 2 11.9 2 19.8 0 35.9-16.1 35.9-35.9s-16.1-35.8-35.9-35.8zM131.2 441.2c-19.8 0-35.9 16.1-35.9 35.9 0 18.7 14.3 34.1 32.6 35.7-.3 1.3-.4 2.6-.4 4 0 10.9 8.9 19.8 19.8 19.8s19.8-8.9 19.8-19.8c0-6.8-3.4-12.8-8.6-16.3 5.4-6.3 8.6-14.4 8.6-23.3 0-20-16.1-36-35.9-36z"/><path d="M331 467.9c0-66.3-53.8-120.1-120.1-120.1-54.9 0-101.3 36.9-115.6 87.2 11.8-14.1 26.9-25.4 43.9-32.8.6-11.7 10.2-21 22.1-21 8.2 0 15.4 4.5 19.2 11.2 2.2-.1 4.3-.2 6.5-.2-1.6 2.4-2.9 5.1-3.8 7.9-1 3-1.5 6.3-1.5 9.6 0 .7 0 1.3.1 2 1 16.5 14.7 29.5 31.4 29.5 17.4 0 31.5-14.1 31.5-31.5 0-1-.1-2.1-.2-3.1 5.5 3 10.7 6.4 15.7 10.2 3.1-1.3 6.6-2 10.2-2 14.6 0 26.4 11.8 26.4 26.4 0 5-1.4 9.8-3.9 13.8 1.9 3.4 3.6 6.9 5.1 10.5-.5-.1-1.1-.1-1.6-.1-6.5 0-11.7 5.2-11.7 11.7 0 6.5 5.2 11.7 11.7 11.7 3.1 0 6-1.2 8.1-3.2 2 8.6 3 17.6 3 26.8 0 11.4-1.6 22.5-4.6 32.9 17.5-21 28.1-48 28.1-77.4z"/>
						<circle cx					=	"203.2" 
								cy					=	"520.6" 
								r					=	"16"/>
						<circle cx					=	"272.1" 
								cy					=	"472.4" 
								r					=	"4.6"/>
					</g>
					<path 	opacity				=	".1" 
							fill-rule			=	"evenodd" 
							clip-rule			=	"evenodd" 
							fill				=	"#3B3D3D" 
							d					=	"M201.2 368.2l-.4-.8c-.4-.7-1.4-1-2.1-.6l-80.5 46.8c-.7.4-1 1.4-.6 2.1l.4.8c.3.5.8.8 1.4.8.3 0 .5-.1.8-.2l1-.6c0 .1.1.3.2.4l24.2 41.7c.2.4.7.7 1.2.7.2 0 .5-.1.7-.2l34.1-19.8c.3-.2.5-.5.6-.8.1-.4 0-.7-.1-1l-24.2-41.7-.3-.3 43.2-25.1c.4-.2.6-.5.7-1-.1-.4-.1-.8-.3-1.2z"/>
					<!-- Flag stick -->
					<g>
						<path 	fill				=	"#acacac" 
								stroke				=	"#B5B5B6" 
								stroke-miterlimit	=	"10" 
								d					=	"M200.8 369.5c-.2.6-.8 1-1.4.8l-.9-.2c-.6-.2-1-.8-.8-1.4l25.5-89.5c.2-.6.8-1 1.4-.8l.9.2c.6.2 1 .8.8 1.4l-25.5 89.5z"/>
						<path 	fill-rule			=	"evenodd" 
								clip-rule			=	"evenodd" 
								fill				=	"#263563" 
								stroke				=	"#B5B5B6" 
								stroke-miterlimit	=	"10"
								d					=	"M262.9 334c-.1.5-.7.8-1.2.7l-46.4-13.2c-.5-.1-.8-.7-.7-1.2l10.8-38c.1-.5.7-.8 1.2-.7l46.4 13.2c.5.1.8.7.7 1.2l-10.8 38z"/>
						<g 		fill-rule			=	"evenodd"
								clip-rule			=	"evenodd" 
								fill				=	"#263563">
							<!-- #F9DA1E -->
							<path 	d					=	"M249 311.1c.4.6.8 1.1 1.2 1.6.4.5.9.9.3 1.6.8.2 1.6.3 2.3.5-.1.4-.2.6-.2.9 0 .1.1.2.1.3.1-.1.2-.1.2-.2l.3-.9c.7.3 1.4.5 2.1.7.1-.8.1-.8 1-1.2.7-.3 1.3-.5 2-.8-.5-.7-.5-.7 0-1.3.1-.2.2-.4.4-.5-.5-.5-1.6.1-1.6-1.1-.4.3-.7.5-1 .7-.2.1-.4.1-.6.2 0-.2 0-.4.1-.6l.9-1.8c-.3.1-.6.1-.8.2-.2-.7-.3-1.3-.5-2-.5.5-1 .9-1.5 1.4l-.6-.6c-.1.8-.1 1.5-.2 2.3 0 .1-.1.3-.2.4-.1-.1-.3-.2-.3-.3-.2-.4-.3-.8-.5-1.2-.6.5-.6.5-1.3.2-.2-.1-.4-.1-.6-.2-.4.5.4 1.5-1 1.7z"/>
							<path 	d					=	"M260.2 298.6c-.6 1.1-1.2 2.2-1.8 3.4-.6 1.3-1.3 2.5-1.9 3.8-.4.8-.5.9-1.4.4.2-.8.4-1.6.5-2.4.1-.5.1-1 .2-1.5.1-1.8-1.4-3.7-3.2-3.9-.1 0-.4.2-.5.3-.9 1.6-1.7 3.3-2.5 5 0 .1-.1.2-.1.2-.2.2-.1.6-.6.4-.4-.2-.1-.4-.1-.7.2-.9.4-1.8.5-2.8 0-.7-.1-1.4-.3-2.1-.1-.4-.3-.5-.8-.4-1.8.7-3.3 1.7-4.5 3.1-2.5 2.6-4.3 5.6-5.2 9.1-.5 1.9-.5 3.8.3 5.6.8 1.7 1.2 1.8 2.8.8.7-.4 1.3-.9 2-1.4.3-.2.6-.3 1 0-1.2 1-2.4 2-3.7 2.9.7.6 1.6.8 2.6 1 2.5.4 4.6-.7 6.4-2.3.7-.6 1.2-.5 1.9-.2v.1c-2 2.2-4.2 4.1-7.3 4.3-2.3.2-4.4-.4-6.4-1.8-.2-.2-.5-.3-.8-.3-5.5.1-9.3-3.9-9-9.4 0-.7.1-1.4.2-2 .2-.6.4-1.3.5-1.9.1-.2.2-.3.3-.5.6-1.2 1.1-2.5 1.9-3.6 2.5-3.8 5.9-6.4 10.5-7.2 1.9-.3 3.9-.3 5.6.6 1.1.6 2.1.7 3.3.7.6 0 1.2.1 1.8.1.5.1.9.3 1.4.4.2.1.5.3.7.4.8.6 1.6 1.1 2.4 1.7.4.3.8.4 1.2.1.4-.2.7-.5 1.1-.7.3.5.7.6 1 .7zm-13.4-2c-.7-.5-2.1-.7-3.4-.6-2.1.2-3.8 1.2-5.3 2.4-2.4 2-4.2 4.6-5.5 7.5-.8 1.7-1.3 3.5-1.3 5.4 0 2.5.8 4.6 3.1 5.9.6.3 1.2.5 1.9.8 0-.1.1-.1.1-.2s-.1-.2-.1-.2c-1-1.5-1.4-3.1-1.4-4.9-.1-2.3.5-4.5 1.5-6.6 1.6-3.3 3.9-6.1 7.1-8 .9-.5 2.1-.9 3.3-1.5z"/>
							<path 	d					=	"M249 311.1c1.4-.1.5-1.1.8-1.8.2.1.4.1.6.2.7.3.7.3 1.3-.2.2.4.3.8.5 1.2l.3.3c.1-.1.2-.3.2-.4.1-.7.1-1.5.2-2.3l.6.6c.5-.4 1-.9 1.5-1.4.2.7.4 1.3.5 2 .3-.1.5-.1.8-.2-.3.7-.6 1.2-.9 1.8-.1.2-.1.4-.1.6.2-.1.4-.1.6-.2.3-.2.6-.4 1-.7 0 1.2 1.1.7 1.6 1.1-.1.2-.2.3-.4.5-.5.7-.5.7 0 1.3-.7.3-1.3.5-2 .8-.8.3-.8.3-1 1.2-.7-.2-1.3-.5-2.1-.7l-.3.9c0 .1-.2.2-.2.2 0-.1-.1-.2-.1-.3 0-.3.1-.5.2-.9-.7-.2-1.5-.3-2.3-.5.6-.7.1-1.2-.3-1.6-.1-.5-.5-1-1-1.5z"/>
						</g>
					</g>
				</g>
			</svg>
<?php
		}
	}
    elseif(empty($page))
    {
		/* This will give an error. Note the output
		* above, which is before the header() call */
		header("Location: $redirect_path");
		exit;
	}
?>
		
			<span>	
				<div class="container">	
				 
					<div class="grid">	
						<div class="services">					
						<a href="#">
							<h3>Leasing of printers</h3>
							<p>
								We have a wide range of printers for renting from different manufacturers offering a variety of models.
							</p>							
						</a>
						</div>
						<div class="services">									
						<a href="#">
							<h3>Networking services</h3>
							<p> we offer Networking management solutions and services,that include both fixed or wireless network</p>							
						</a>
						</div>
						<div class="services">								
						<a href="#">
							<h3>Technical Support</h3>
							<p>For any technical issue, connect with us and we will avail you with our support team for an exceptional ser	</p>							
						</a>
						</div>
						<div class="services">								
						<a href="#">
							<h3>Software solutions</h3>
							<p>we provide the widest portfolio of technology offerings in areas of document software and hardware supplies.</p>							
						</a>
					 </div>
					</div>
				</div>						
			</span>
			
			
	<div class="container">
			<div class="partner_sliders">
				<div>
					<img	alt		=	"toshiba logo"
							src 	=	"img/toshiba.png"/>	
				</div>
				<div>				
					<img	alt		=	"papercut logo"
							src 	=	"img/papercut.png"/>
				</div>
				<div>
					<img	alt		=	"docuware logo"
							src 	=	"img/docuware.png"/>
				</div>
				<div>
					<img	alt		=	"hp logo"
							src 	=	"img/hp.png"/>
				</div>
			</div>
	</div>


		</main>	
	<footer>
		<div	class		=	"container">
			
<?php
    $pdo = new PDO($dsn, $user, $pass);
    $pdo2 = new PDO($dsn, $user, $pass);
    $query = '	SELECT footer_submenus.footer_submenu
				FROM pages
				LEFT JOIN footer_submenu_pages
				ON pages.id=footer_submenu_pages.page_id
				LEFT JOIN footer_submenus
				ON footer_submenu_pages.footer_submenu_id=footer_submenus.id
				LEFT JOIN menu_pages
				ON pages.id=menu_pages.page_id
				LEFT JOIN menus
				ON menu_pages.menu_id=menus.id
				WHERE menus.menu = :menu
				GROUP BY footer_submenus.footer_submenu';
				
	$query2 = '	SELECT pages.page, footer_submenus.footer_submenu 
				FROM pages
				LEFT JOIN footer_submenu_pages
				ON pages.id=footer_submenu_pages.page_id 
				LEFT JOIN footer_submenus
				ON footer_submenu_pages.footer_submenu_id=footer_submenus.id
				LEFT JOIN menu_pages
				ON pages.id=menu_pages.page_id
				LEFT JOIN menus
				ON menu_pages.menu_id=menus.id
				WHERE menus.menu = :menu
				AND footer_submenus.footer_submenu = :footer_submenu';
	$stmt = $pdo->prepare($query);
	$menu = 'footer_menu';
	$stmt->execute(array(':menu' => $menu));
?>
			<menu	id		=	"footer_menu">
		
<?php
	foreach ($stmt as $row)
	{
		/* Remove underscore and replace with space. */
		$page=str_replace("_"," ",$page);
		
?>
				<span>
					<h1>
						<?php echo $row['footer_submenu']?>
					</h1>
<?php
		$footer_submenu = $row['footer_submenu'];
		$stmt2 = $pdo2->prepare($query2);
		$stmt2->execute(array(['footer_menu'], $row['footer_submenu']));
		$stmt->execute(array(':menu' => $menu, ':footer_submenu' => $footer_submenu));
		foreach ($stmt2 as $row2)
		{
		echo $row2['page'];
		echo 'test';
?>
					<a href="#">
<?php
						echo $row2['page'];
?>
					</a>
<?php
		}
?>
				</span>
<?php
	}	
?>
			</menu>
			<span>		
				
				<h1>
					About Us
				</h1>
				<ul>
				  <li>Our credo</li>
				  <li>Our philosophy</li>
				  <li>Committments</li>
				</ul>
			</span>
			<span>
				<h1>
					Primary Products
				</h1>
				<ul>
				  <li>Toshiba MFPs</li>
				  <li>Kyocera MFPs</li>
				  <li>Canon MFPs</li>
				  <li>HP MFPs</li>
				</ul>
			</span>
			<span>
				<h1>
					Other Products
				</h1>
				<ul>
				  <li>Computers</li>
				  <li>Data Cards</li>
				  <li>Software Solutions</li>
				  <li>MFP Consumables</li>
				</ul>
			</span>
			<span>
				<h1>Services</h1>
				<ul>
				  <li>Leasing</li>
				  <li>Networking</li>
				  <li>Maintenance and repair</li>
				  <li>Managed print services</li>
				</ul>
			</span>
			<span>
				<h1>
					Support
				</h1>
				<ul>
				  <li>Contact us</li>
				  <li>Web chat</li>
				  <li>Open ticket</li>
				</ul>
			</span>
			<span>
				<h1>
					Social
				</h1>
    <?php
$pdo = new PDO($dsn, $user, $pass);
$query = '	SELECT images.image, alternatives.alternative 
			FROM images
			LEFT JOIN image_locations
			ON image_locations.image_id=images.id
			LEFT JOIN locations
			ON locations.id=image_locations.location_id
			LEFT JOIN image_alternatives
			ON image_alternatives.image_id=images.id
			LEFT JOIN alternatives
			ON alternatives.id=image_alternatives.alternative_id
			WHERE locations.location =?';
$stmt = $pdo->prepare($query);
$stmt->execute(['social']);
	foreach ($stmt as $row)
	{
					
?>
				<img	alt		=	"<?php echo $row['alternative'];?>"
					class	=	"social"
					src		=	"img/<?php echo $row['image'];?>"/>
<?php
	}
?>
			</span>
		</div>
	</footer>
	</body>
</html>
