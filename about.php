<?php require_once "core/init.php" ?>

    <!-- html starts here -->
<?php require_once "includes/styles.php" ?>
<?php require_once "includes/navbar.php" ?>

<section class="who_we_are_area" style="margin-bottom: 100px">
    <div class="container">
        <div class="row who_we_inner">
            <div class="col-md-5">
                <div class="who_we_left_content">
                    <div class="main_w_title">
                        <h2>Who <br class="title_br"> We Are?</h2>
                        <h6>All About Us</h6>
                    </div>
                    <?php
                    $query = selectQuery("SELECT * FROM settings WHERE name = 'aboutus'");
                    while ($row = mysqli_fetch_assoc($query)) {
                        $str = nl2br($row['value']);
                        echo "<p style='margin-bottom: 50px'>$str</p>";
                    }
                    ?>
                    <div class="border_bar"></div>
                </div>
            </div>
            <div class="col-md-7">
                <div class="who_we_image">
                    <img src="<?php echo $GLOBALS['path'] ?>assets/img/who-we.jpg" alt="">
                </div>
            </div>
        </div>
    </div>
</section>

<?php require_once "includes/footer.php" ?>
<?php require_once "includes/scripts.php" ?>