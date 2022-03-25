<?php
require_once "core/init.php";

if (!isset($_GET['m'])) {
    header("location: {$GLOBALS['path']}projects");
}

$query = selectQuery("SELECT * FROM projects WHERE slug = {$_GET['m']}");
while ($row = mysqli_fetch_assoc($query)) {
    $projects_dir = "{$GLOBALS['path']}assets/projects/{$row['slug']}";
    $projects_dir_relative = "assets/projects/{$row['slug']}";

    $cover_image = "$projects_dir/{$row['cover']}";

    $thumbnails = array();
    if ($handle = opendir("assets/projects/{$row['slug']}")) {
        while (false !== ($item = readdir($handle))) {
            if (!in_array($item, array(".", "..", ".DS_Store", "details.txt", $row['cover']))) {
                $var = explode(".", $item);
                if (in_array($var[sizeof($var)-1], array("jpg"))) {
                    array_push($thumbnails, $item);
                }
            }
        }
    }
    var_dump($thumbnails);

    $summary = $row['summary'];
    $clientname = $row['clientname'];

    $category = "";
    $x = explode(",", $row['tags']);
    $count = 0;
    foreach ($x as $item) {
        $str = getTag($item, 1);
        $category .= "$str";
        $count += 1;
        $category .= sizeof($x) > $count ? "," : null;
    }
    $num = number_format($row['value']);
    $value = "$$num";
    $year_comp = date_create($row['date_comp'])->format("F Y");
    $area = $row['area'];
    $architect = $row['architect'];
    $location = $row['location'];
    $inv_url = $row['investor_web'];

    $owner_review = $row['owner_review'];
    $owner_rate = $row['owner_rate'];

    $file = fopen($projects_dir_relative."/details.txt", "r");
    $project_details = fread($file, filesize($projects_dir_relative."/details.txt"));
    fclose($file);
}
?>

    <!-- html starts here -->
<?php require_once "includes/styles.php" ?>
<?php require_once "includes/navbar.php" ?>

    <section class="banner_area">
        <div class="container">
            <div class="banner_inner_text">
                <h4>Our Projects</h4>
                <ul>
                    <li><a href="#">Home</a></li>
                    <li><a href="#">Projects</a></li>
                    <li class="active"><a href="#">Info #<?php echo $_GET['m'] ?></a></li>
                </ul>
            </div>
        </div>
    </section>

    <section class="project_single_area">
        <div class="container">
            <div class="project_single_inner">
                <div class="project_single_slider">
                    <div class="flexslider" id="slider">
                        <div class="flex-viewport">
                            <ul class="slides">
                                <li class="flex-active-slide">
                                    <img width="100%" height="534px" src="<?php echo $cover_image ?>" alt="cover image">
                                </li>
                                <?php
                                foreach ($thumbnails as $thumb) {
                                    echo "<li><img src='$projects_dir/$thumb' /></li>";
                                }
                                ?>
                            </ul>
                        </div>
                    </div>
                    <div id="carousel" class="flexslider">
                        <div class="custom-navigation">
                            <a href="#" class="flex-prev flex-disabled" tabindex="-1"><i class="fa fa-angle-left"></i></a>
                            <a href="#" class="flex-next"><i class="fa fa-angle-right"></i></a>
                        </div>
                        <div class="flex-viewport">
                            <ul class="slides">
                                <?php
                                $thumbs_dir = $projects_dir_relative."/thumb";
                                if ($handle = opendir($thumbs_dir)) {
                                    while (false !== ($item = readdir($handle))) {
                                        if (!in_array($item, array(".", "..", ".DS_Store"))) {
                                            echo "<li><img src='$projects_dir/thumb/$item' /></li>";
                                        }
                                    }
                                }
                                ?>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-6">
                        <div class="project_summery">
                            <h4 class="project_title">Project Summary</h4>
                            <p><?php echo $summary; ?></p>
                            <ul>
                                <li><a href="#">Client's Name: <span><?php echo $clientname; ?></span></a></li>
                                <li><a href="#">Category: <span><?php echo $category; ?></span></a></li>
                                <li><a href="#">Value: <span><?php echo $value; ?></span></a></li>
                                <li><a href="#">Year Completed: <span><?php echo $year_comp; ?></span></a></li>
                                <li><a href="#">Area: <span><?php echo $area; ?></span></a></li>
                                <li><a href="#">Architect: <span><?php echo $architect; ?></span></a></li>
                                <li><a href="#">Location: <span><?php echo $location; ?></span></a></li>
                                <li><a href="#">Investor's Website: <span><?php echo $inv_url; ?></span></a></li>
                            </ul>
                        </div>
                        <div class="project_quote">
                            <h4 class="project_title">Owner Review</h4>
                            <div class="quote_inner">
                                <p><?php echo $owner_review; ?></p>
                                <?php
                                    for ($i=0; $i<intval($owner_rate);$i++) {
                                        echo '<a href="#"><i class="fa fa-star"></i></a>';
                                    }
                                    if (intval($owner_rate) < 5) {
                                        $unrate = 5 - intval($owner_rate);
                                        for ($i=0; $i<$unrate;$i++) {
                                            echo '<a href="#"><i class="fa fa-star-o"></i></a>';
                                        }
                                    }
                                ?>
                            </div>
                        </div>
                        <hr>
                        <div class="panel-group project_collaps" id="accordion" role="tablist" aria-multiselectable="true">
                            <h4 class="project_title" style="margin-bottom: 20px">Frequently Asked Questions</h4>
                            <div class="panel panel-default">
                                <div class="panel-heading" role="tab" id="headingOne">
                                    <h4 class="panel-title">
                                        <a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                                            Lorem ipsum dolor sit amet, consectetur adipiscing
                                            <i class="fa fa-minus" aria-hidden="true"></i>
                                            <i class="fa fa-plus" aria-hidden="true"></i>
                                        </a>
                                    </h4>
                                </div>
                                <div id="collapseOne" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
                                    <div class="panel-body">
                                        Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco.
                                    </div>
                                </div>
                            </div>
                            <div class="panel panel-default">
                                <div class="panel-heading" role="tab" id="headingTwo">
                                    <h4 class="panel-title">
                                        <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                                            Lorem ipsum dolor sit amet, consectetur adipiscing
                                            <i class="fa fa-minus" aria-hidden="true"></i>
                                            <i class="fa fa-plus" aria-hidden="true"></i>
                                        </a>
                                    </h4>
                                </div>
                                <div id="collapseTwo" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwo">
                                    <div class="panel-body">
                                        Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco.
                                    </div>
                                </div>
                            </div>
                            <div class="panel panel-default">
                                <div class="panel-heading" role="tab" id="headingThree">
                                    <h4 class="panel-title">
                                        <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                                            Lorem ipsum dolor sit amet, consectetur adipiscing
                                            <i class="fa fa-minus" aria-hidden="true"></i>
                                            <i class="fa fa-plus" aria-hidden="true"></i>
                                        </a>
                                    </h4>
                                </div>
                                <div id="collapseThree" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingThree">
                                    <div class="panel-body">
                                        Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco.
                                    </div>
                                </div>
                            </div>
                            <div class="panel panel-default">
                                <div class="panel-heading" role="tab" id="headingfour">
                                    <h4 class="panel-title">
                                        <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapsefour" aria-expanded="false" aria-controls="collapsefour">
                                            Lorem ipsum dolor sit amet, consectetur adipiscing
                                            <i class="fa fa-minus" aria-hidden="true"></i>
                                            <i class="fa fa-plus" aria-hidden="true"></i>
                                        </a>
                                    </h4>
                                </div>
                                <div id="collapsefour" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingfour">
                                    <div class="panel-body">
                                        Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco.
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="project_discription">
                            <h4 class="project_title">Project Details</h4>
                            <p><?php echo nl2br($project_details); ?></p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <section class="our_latest_project">
        <div class="container">
            <?php if (mysqli_num_rows(selectQuery("SELECT * FROM projects WHERE  slug != '{$_GET['m']}'"))>1){ ?>
<!--                <h3 class="out_title">Our Latest Projects</h3>-->

            <?php } ?>
        </div>
    </section>

<?php require_once "includes/footer.php" ?>
<?php require_once "includes/scripts.php" ?>