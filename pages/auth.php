<?php
include_once "../class.php";
$panel->userRedirect(true, "../grenade");
$panel->drawTemplate("header", ["Авторизация"]);
?>

    <div class="container">
        <div class="row" style="padding-top:50px;">
            <div class="col-md-4 col-md-offset-4">
                <?php
                if (isset($_POST["auth"]))
                    echo $panel->auth($_POST["username"], $_POST["password"]);
                ?>
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title">Авторизация</h3>
                    </div>
                    <div class="panel-body">
                        <form role="form" method="POST">
                            <fieldset>
                                <div class="form-group">
                                    <input class="form-control" placeholder="Логин" name="username" type="text">
                                </div>
                                <div class="form-group">
                                    <input class="form-control" placeholder="Пароль" name="password" type="password">
                                </div>
                                <input class="btn btn-primary btn-block" name="auth" type="submit" value="Войти">
                            </fieldset>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

<?php
$panel->drawTemplate("footer");
?>